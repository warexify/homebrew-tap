class Syncthing < Formula
  desc "Open source continuous file synchronization application"
  homepage "https://syncthing.net/"
  head "https://github.com/syncthing/syncthing.git"

  stable do
    url "https://github.com/syncthing/syncthing.git",
      :tag      => "v1.1.3",
      :revision => "a04fcfe7494a6e3ede091534597539b77dc05a52"
  end

  devel do
    url "https://github.com/syncthing/syncthing.git",
      :tag      => "v1.1.4-rc.1",
      :revision => "e4956358fbab0d78e975d474acba2a0d098e4adc"
  end

  bottle :unneeded

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    (buildpath/"src/github.com/syncthing/syncthing").install buildpath.children
    ENV.append_path "PATH", buildpath/"bin"
    cd "src/github.com/syncthing/syncthing" do
      system "./build.sh", "noupgrade"
      bin.install "syncthing"
      man1.install Dir["man/*.1"]
      man5.install Dir["man/*.5"]
      man7.install Dir["man/*.7"]
      prefix.install_metafiles
    end
  end

  plist_options :manual => "syncthing"

  def plist; <<~EOS
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
      <dict>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>ProgramArguments</key>
        <array>
          <string>#{opt_bin}/syncthing</string>
          <string>-no-browser</string>
          <string>-no-restart</string>
        </array>
        <key>KeepAlive</key>
        <dict>
          <key>Crashed</key>
          <true/>
          <key>SuccessfulExit</key>
          <false/>
        </dict>
        <key>LowPriorityIO</key>
        <true/>
        <key>ProcessType</key>
        <string>Background</string>
        <key>StandardErrorPath</key>
        <string>#{var}/log/syncthing.log</string>
        <key>StandardOutPath</key>
        <string>#{var}/log/syncthing.log</string>
      </dict>
    </plist>
  EOS
  end

  test do
    system bin/"syncthing", "-generate", "./"
  end
end
