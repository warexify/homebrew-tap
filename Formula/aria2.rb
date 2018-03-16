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

  def config
    <<~EOS
      bt-enable-lpd=true
      bt-save-metadata=true
      bt-seed-unverified=true
      continue=true
      daemon=true
      dir=/Users/warexify/Downloads
      disk-cache=64M
      enable-dht=true
      enable-http-pipelining=true
      enable-mmap=true
      enable-rpc=true
      event-poll=kqueue
      file-allocation=falloc
      input-file=/usr/local/var/aria2/aria2.session
      listen-port=64248
      lowest-speed-limit=0
      max-concurrent-downloads=6
      max-connection-per-server=6
      max-tries=0
      rpc-allow-origin-all=true
      rpc-listen-all=true
      rpc-listen-port=6800
      rpc-secret=kPKOas8xZCqDHCkKhM0a-o9Sr1rQhL94
      save-session=/usr/local/var/aria2/aria2.session
      save-session-interval=30
    EOS
  end

  def post_install
    system "mkdir #{var}/aria2"
    system "touch #{var}/aria2/aria2.session"
    # (var+"aria2/aria2.conf").write config
  end

  plist_options :manual => "aria2c"

  def plist; <<~EOS
	<?xml version="1.0" encoding="UTF-8"?>
	<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
	<plist version="1.0">
	<dict>
		<key>Label</key>
		<string>homebrew.mxcl.aria2c</string>
		<key>RunAtLoad</key>
		<true/>
		<key>ProgramArguments</key>
		<array>
			<string>#{opt_bin}/aria2c</string>
			<string>--enable-rpc=true</string>
			<string>--input-file=#{var}/aria2/aria2.session</string>
			<string>--save-session=#{var}/aria2/aria2.session</string>
			<string>--conf-path=/Users/warexify/.aria2/aria2.conf</string>
		</array>
		<key>ServiceDescription</key>
		<string>Aria2 Service</string>
		<key>StandardErrorPath</key>
		<string>#{var}/log/aria2-error.log</string>
		<key>StandardOutPath</key>
		<string>#{var}/log/aria2-output.log</string>
	</dict>
	</plist>
	EOS
  end

  test do
    system "#{bin}/aria2c", "https://brew.sh/"
    assert_predicate testpath/"index.html", :exist?, "Failed to create index.html!"
  end
end
