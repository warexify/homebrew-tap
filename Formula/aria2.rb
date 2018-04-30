class Aria2 < Formula
  desc "Download with resuming and segmented downloading"
  homepage "https://aria2.github.io/"
  url "https://github.com/aria2/aria2/releases/download/release-1.33.1/aria2-1.33.1.tar.xz"
  sha256 "2539e4844f55a1f1f5c46ad42744335266053a69162e964d9a2d80a362c75e1b"

  depends_on "pkg-config" => :build
  depends_on "libssh2" => :optional

  needs :cxx11

  def install
    ENV.cxx11

    args = %W[
      --disable-dependency-tracking
      --prefix=#{prefix}
      --with-appletls
      --without-openssl
      --without-gnutls
      --without-libgmp
      --without-libnettle
      --without-libgcrypt
    ]

    args << "--with-libssh2" if build.with? "libssh2"

    system "./configure", *args
    system "make", "install"

    bash_completion.install "doc/bash_completion/aria2c"
  end

  def post_install
    (var/"log").mkpath
    (var/"cache/aria2").mkpath
    system "touch #{var}/cache/aria2/session.conf"
  end

  plist_options :startup => true, :manual => "#{HOMEBREW_PREFIX}/bin/aria2c -D --enable-rpc=true --rpc-allow-origin-all=true --rpc-listen-all=true --rpc-listen-port=6800 --rpc-secret=kPKOas8xZCqDHCkKhM0a-o9Sr1rQhL94 --input-file=#{HOMEBREW_PREFIX}/var/cache/aria2/session.conf --save-session=#{HOMEBREW_PREFIX}/var/cache/aria2/session.conf --log-level=error"

  def plist; <<~EOS
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
      <key>Label</key>
      <string>#{plist_name}</string>
      <key>ProgramArguments</key>
      <array>
        <string>#{opt_bin}/aria2c</string>
        <string>-D</string>
        <string>--enable-rpc=true</string>
        <string>--rpc-allow-origin-all=true</string>
        <string>--rpc-listen-all=true</string>
        <string>--rpc-listen-port=6800</string>
        <string>--rpc-secret=kPKOas8xZCqDHCkKhM0a-o9Sr1rQhL94</string>
        <string>--input-file=#{var}/cache/aria2/session.conf</string>
        <string>--save-session=#{var}/cache/aria2/session.conf</string>
        <string>--log-level=error</string>
      </array>
      <key>RunAtLoad</key>
      <true/>
      <key>KeepAlive</key>
      <false/>
      <key>WorkingDirectory</key>
      <string>#{HOMEBREW_PREFIX}</string>
      <key>StandardOutPath</key>
      <string>#{var}/log/aria2-output.log</string>
      <key>StandardErrorPath</key>
      <string>#{var}/log/aria2-error.log</string>
    </dict>
    </plist>
    EOS
  end

  test do
    system "#{bin}/aria2c", "https://brew.sh/"
    assert_predicate testpath/"index.html", :exist?, "Failed to create index.html!"
  end
end
