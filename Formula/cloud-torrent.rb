class CloudTorrent < Formula
  desc "Self-hosted remote torrent client"
  homepage "https://github.com/boypt/simple-torrent"
  url "https://github.com/boypt/simple-torrent/archive/1.3.6.tar.gz"
  sha256 "7785b7d9d217fa044e64fe1e4e03d3849e4123611c67c5c5179fbb1aeb7654c0"
  license "AGPL-3.0 License"
  head "https://github.com/boypt/simple-torrent.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "go" => :build

  def datadir
    var/"cloud-torrent"
  end

  def install
    ENV["GOOS"] = "darwin"
    ENV["GOARCH"] = `go env GOARCH`.chomp
    ENV["GOPATH"] = `go env GOPATH`.chomp
    ENV["GOBIN"] = bin.to_s
    ENV["CGO_ENABLED"] = "0"
    ENV["SUFFIX"] = "_static"
    build_version = build.head? ? "v0.0.0-#{version}" : "v#{version}"
    system "go", "build", "-o", "cloud-torrent", "-trimpath", "-ldflags", "-s -w -X main.VERSION=#{build_version}"
    bin.install "cloud-torrent"
    # Install cloud-torrent.yaml that binds to 127.0.0.1 by default
    (buildpath/"cloud-torrent.yaml").write <<~EOS
      AutoStart: true
      AllowRuntimeConfigure: true
      EngineDebug: false
      MuteEngineLog: true
      ObfsPreferred: true
      ObfsRequirePreferred: false
      DisableTrackers: false
      DisableIPv6: false
      DisableUTP: false
      NoDefaultPortForwarding: true
      # Don't broadcast the UPNP request for gateway port forwarding,
      # which is unnecessary in machines that has public IP (of which this program is mean for?)
      DownloadDirectory: #{datadir}/downloads
      WatchDirectory: #{datadir}/torrents
      EnableUpload: true
      EnableSeeding: true
      IncomingPort: 64248
      # DoneCmd: ""
      SeedRatio: 1.0
      SeedTime: "0s"
      UploadRate: Low
      DownloadRate: Unlimited
      TrackerList: |-
        remote:https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_all_ip.txt
        remote:https://newtrackon.com/api/live
      AlwaysAddTrackers: true
      MaxConcurrentTask: 0
      ProxyURL: ""
      # ScraperURL: ""
      # RSSUrl: ""
    EOS
    etc.install "cloud-torrent.yaml"
  end

  def post_install
    # Make sure the var/cloud-torrent directory exists
    (var/"cloud-torrent").mkpath
    (var/"cloud-torrent/downloads").mkpath
    (var/"cloud-torrent/torrents").mkpath
  end

  plist_options manual: "cloud-torrent --listen :3000 --rest-api localhost:3001"

  def plist
    <<~EOS
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
      <dict>
          <key>EnvironmentVariables</key>
          <dict>
              <key>LISTEN</key>
              <string>:3000</string>
              <key>RESTAPI</key>
              <string>localhost:3001</string>
          </dict>
          <key>KeepAlive</key>
          <dict>
              <key>SuccessfulExit</key>
              <false/>
          </dict>
          <key>Label</key>
          <string>#{plist_name}</string>
          <key>ProgramArguments</key>
          <array>
              <string>#{opt_bin}/cloud-torrent</string>
              <string>-c</string>
              <string>#{etc}/cloud-torrent.yaml</string>
              <string>--disable-log-time</string>
          </array>
          <key>RunAtLoad</key>
          <true/>
          <key>WorkingDirectory</key>
          <string>#{datadir}</string>
          <key>StandardErrorPath</key>
          <string>#{var}/log/cloud-torrent.log</string>
          <key>StandardOutPath</key>
          <string>#{var}/log/cloud-torrent.log</string>
      </dict>
      </plist>
    EOS
  end

  test do
    build_version = build.head? ? "v0.0.0-#{version}" : "v#{version}"
    assert_match "cloud-torrent #{build_version} ", shell_output("#{bin}/cloud-torrent --version")
  end
end
