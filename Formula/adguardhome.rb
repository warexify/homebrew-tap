require "language/node"

class Adguardhome < Formula
  desc "Network-wide ads & trackers blocking DNS server"
  homepage "https://adguard.com/en/adguard-dns/overview.html"
  url "https://github.com/AdguardTeam/AdGuardHome/archive/v0.104.0-beta1.tar.gz"
  sha256 "767cfd80f8f3156fe2143c07b97c730843aea78ffaa32f53ade77ec3689fe678"
  head "https://github.com/AdguardTeam/AdGuardHome.git"

  bottle :unneeded

  depends_on "go" => :build
  depends_on "node" => :build
  depends_on "packr" => :build

  def install
    ENV["GOOS"] = "darwin"
    ENV["GOARCH"] = MacOS.prefer_64_bit? ? "amd64" : "386"
    ENV["GOPATH"] = `go env GOPATH`.chomp
    ENV["STATIC"] = "build/static/index.html"
    ENV["GO111MODULE"] = "on"
    cd "client" do
      system "npm", "install", *Language::Node.local_npm_install_args
      system "npm", "run", "build-prod", *Language::Node.local_npm_install_args
    end
    # system "make", "build", "AdGuardHome"
    system "packr", "build", "-ldflags=-X main.VersionString=#{version}",
          "-asmflags=-trimpath=#{buildpath}",
          "-gcflags=-trimpath=#{buildpath}",
          "-o", buildpath/"AdGuardHome"
    prefix.install buildpath/"AdGuardHome"
    prefix.install_metafiles
    (prefix/"AdGuardHome.yaml").write yaml
  end

  def yaml; <<~EOS
    bind_host: 127.0.0.1
    bind_port: 3000
    auth_name: ""
    auth_pass: ""
    language: ""
    coredns:
      port: 5353
      protection_enabled: true
      filtering_enabled: true
      safebrowsing_enabled: false
      safesearch_enabled: false
      parental_enabled: false
      parental_sensitivity: 0
      blocked_response_ttl: 10
      querylog_enabled: true
      ratelimit: 20
      refuse_any: true
      bootstrap_dns: 1.1.1.1:53
      upstream_dns:
      - tls://1.1.1.1
      - tls://1.0.0.1
      - tls://2606:4700:4700::1111
      - tls://2606:4700:4700::1001
    filters:
    - enabled: true
      url: https://adguardteam.github.io/AdGuardSDNSFilter/Filters/filter.txt
      name: AdGuard Simplified Domain Names filter
      id: 1
    - enabled: false
      url: https://adaway.org/hosts.txt
      name: AdAway
      id: 2
    - enabled: false
      url: https://hosts-file.net/ad_servers.txt
      name: hpHosts - Ad and Tracking servers only
      id: 3
    - enabled: false
      url: http://www.malwaredomainlist.com/hostslist/hosts.txt
      name: MalwareDomainList.com Hosts List
      id: 4
    schema_version: 1
  EOS
  end

  plist_options :manual => "AdGuardHome"

  def plist; <<~EOS
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
      <dict>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>ProgramArguments</key>
        <array>
          <string>#{opt_prefix}/AdGuardHome</string>
          <string>--host</string>
          <string>127.0.0.1</string>
          <string>--port</string>
          <string>3000</string>
        </array>
        <key>RunAtLoad</key>
        <true/>
        <key>KeepAlive</key>
        <true/>
        <key>StandardErrorPath</key>
        <string>#{var}/log/AdGuardHome.log</string>
        <key>StandardOutPath</key>
        <string>#{var}/log/AdGuardHome.log</string>
      </dict>
    </plist>
  EOS
  end
end
