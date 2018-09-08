class Syncthing < Formula
  desc "Open source continuous file synchronization application"
  homepage "https://syncthing.net/"
  head "https://github.com/syncthing/syncthing.git"

  stable do
    url "https://github.com/syncthing/syncthing.git",
      :tag => "v0.14.49",
      :revision => "6b82538e623feb4df2bef9fc4b37d581de96309a"
  end

  devel do
    url "https://github.com/syncthing/syncthing.git",
      :tag => "v0.14.50-rc.3",
      :revision => "09aff7bb14f99d2c7ca06b8a1207228c4ef15d95"
  end

  bottle :unneeded

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    (buildpath/"src/github.com/syncthing/syncthing").install buildpath.children
    ENV.append_path "PATH", buildpath/"bin"
    cd "src/github.com/syncthing/syncthing" do
      # system "go", "run", "build.go", "-no-upgrade", "tar"
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
