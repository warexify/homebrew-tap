class SimpleTorrent < Formula
  desc "Self-hosted remote torrent client"
  homepage "https://github.com/boypt/simple-torrent"
  license "AGPL-3.0-only"
  head "https://github.com/boypt/simple-torrent.git"

  livecheck do
    url :stable
    strategy :github_latest
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/boypt/simple-torrent/releases/download/1.3.9/cloud-torrent_darwin_amd64_static.gz"
    sha256 "109e0e101fd3dfd967addc1177f51b6ad559bdfbea42c5400e05f09d0116d7a6"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/boypt/simple-torrent/releases/download/1.3.9/cloud-torrent_linux_amd64_static.gz"
    sha256 "d2f535e4cd0449b357a563cfce79c1f6afcac9b7b3af94e758defc44faa52ebf"
  end

  if OS.linux? && Hardware::CPU.intel? && !Hardware::CPU.is_64_bit?
    url "https://github.com/boypt/simple-torrent/releases/download/1.3.9/cloud-torrent_linux_386_static.gz"
    sha256 "583898eb907c21dbbcb6f33934eae3dc1d6ec2620fdc7689c70a3479049af52b"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/boypt/simple-torrent/releases/download/1.3.9/cloud-torrent_linux_arm64_static.gz"
    sha256 "6f48f8b59bc8d834c6ede1d27ecc1a598b8a0be1dab00622caa6fd047e51eed6"
  end

  depends_on "go" => :build

  def datadir
    var/"cloud-torrent"
  end

  def install
    bin.install "cloud-torrent_darwin_amd64_static" => "cloud-torrent" if OS.mac? && Hardware::CPU.intel?
    bin.install "cloud-torrent_linux_amd64_static" => "cloud-torrent" if OS.linux? && Hardware::CPU.intel?
    if OS.linux? && Hardware::CPU.intel? && !Hardware::CPU.is_64_bit?
      bin.install "cloud-torrent_linux_386_static" => "cloud-torrent"
    end
    if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      bin.install "cloud-torrent_linux_arm64_static" => "cloud-torrent"
    end
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
      IncomingPort: 50007
      # DoneCmd: ""
      SeedRatio: 1.5
      SeedTime: "60m"
      UploadRate: Low
      DownloadRate: Unlimited
      TrackerList: |-
        remote:https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_all_ip.txt
        remote:https://newtrackon.com/api/live
        http://p4p.arenabg.com:1337/announce
      AlwaysAddTrackers: true
      MaxConcurrentTask: 0
      ProxyURL: ""
      # ScraperURL: "https:#raw.githubusercontent.com/boypt/simple-torrent/master/scraper-config.json"
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
    system "#{bin}/cloud-torrent", "--version"
  end
end
