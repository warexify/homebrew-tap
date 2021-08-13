class SimpleTorrent < Formula
  desc "Self-hosted remote torrent client"
  homepage "https://github.com/boypt/simple-torrent"
  license "AGPL-3.0 License"
  head "https://github.com/boypt/simple-torrent.git"

  livecheck do
    url :stable
    strategy :github_latest
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/boypt/simple-torrent/releases/download/1.3.4/cloud-torrent_darwin_amd64_static.gz"
    sha256 "d732ca819e520953d175d5030d81e824bcc9dbf234050c0571dc1c4d656d8a8c"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/boypt/simple-torrent/releases/download/1.3.4/cloud-torrent_linux_amd64_static.gz"
    sha256 "2ca5e4ddc42275f2448a391b3aa4a55ddc33bb561d418498a48510b609865f9f"
  end

  if OS.linux? && Hardware::CPU.intel? && !Hardware::CPU.is_64_bit?
    url "https://github.com/boypt/simple-torrent/releases/download/1.3.4/cloud-torrent_linux_386_static.gz"
    sha256 "ab92c751f918d944072093f5abe7ebbd1f8d1dd138e12019b1bffe9d8b645c65"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/boypt/simple-torrent/releases/download/1.3.4/cloud-torrent_linux_arm64_static.gz"
    sha256 "81995fcf6a409a47b7316967e65f2faeba0d16b80f3913cc91d402d7f37642a3"
  end

  bottle :unneeded

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
    system "#{bin}/cloud-torrent", "--version"
  end
end
