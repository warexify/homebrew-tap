class Ntfs3g < Formula
  desc "Read-write NTFS driver for FUSE"
  homepage "https://www.tuxera.com/community/open-source-ntfs-3g/"
  url "https://tuxera.com/opensource/ntfs-3g_ntfsprogs-2017.3.23.tgz"
  version "2017.3.23"
  sha256 "3e5a021d7b761261836dcb305370af299793eedbded731df3d6943802e1262d5"

  devel do
    url "https://sourceforge.net/code-snapshots/git/n/nt/ntfs-3g/ntfs-3g.git/ntfs-3g-ntfs-3g-f862fcee00cecfbb7427e0e2eec990229d52d99f.zip"
    version "2018.6.01"
    sha256 "30f87592fb05d8edb19679b7ad6e5dd24045762809b13caae729b90efffea2c9"
    depends_on "autoconf" => :build
    depends_on "automake" => :build
    depends_on "libtool" => :build
    depends_on "libgcrypt" => :build
  end

  depends_on "pkg-config" => :build
  depends_on "gettext"
  depends_on :osxfuse

  def install
    ENV.append "LDFLAGS", "-lintl"

    args = %W[
      --disable-debug
      --disable-dependency-tracking
      --prefix=#{prefix}
      --exec-prefix=#{prefix}
      --mandir=#{man}
      --enable-extras
      --enable-posix-acls
      --enable-xattr-mappings
      --with-fuse=external
    ]

    inreplace "src/lowntfs-3g.c", "timespec2ntfs(stin->st_atim);", "timespec2ntfs(stin->st_atimespec);"
    inreplace "src/lowntfs-3g.c", "timespec2ntfs(stin->st_mtim);", "timespec2ntfs(stin->st_mtimespec);"
    system "./autogen.sh" if build.devel?
    # inreplace "ntfsprogs/Makefile.in", "/sbin", sbin
    system "./configure", *args
    system "make"
    system "make", "install"

    # Install a script that can be used to enable automount
    File.open("#{sbin}/mount_ntfs", File::CREAT|File::TRUNC|File::RDWR, 0755) do |f|
      f.puts <<~EOS
        #!/usr/bin/env bash

        VOLUME_NAME="${@:$#}"
        VOLUME_NAME=${VOLUME_NAME#/Volumes/}
        USER_ID=#{Process.uid}
        GROUP_ID=#{Process.gid}

        if [ $(/usr/bin/stat -f %u /dev/console) -ne 0 ]; then
          USER_ID=$(usr/bin/stat -f %u /dev/console)
          GROUP_ID=$(/usr/bin/stat -f %g /dev/console)
        fi

        #{opt_bin}/ntfs-3g \\
          -o volname="${VOLUME_NAME}" \\
          -o local \\
          -o negative_vncache \\
          -o auto_xattr \\
          -o auto_cache \\
          -o noatime \\
          -o windows_names \\
          -o user_xattr \\
          -o inherit \\
          -o uid=$USER_ID \\
          -o gid=$GROUP_ID \\
          -o allow_other \\
          "$@" >> /var/log/mount-ntfs-3g.log 2>&1

        exit $?;
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/ntfs-3g --version 2>&1")
    assert_match version.to_s, output
  end
end