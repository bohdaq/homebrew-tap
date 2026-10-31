class Rws < Formula
  desc "HTTP/1.1, HTTP/2 and HTTP/3 web server, reverse proxy and app framework"
  homepage "https://rws8.tech"
  version "18.11.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.11.0/rws-18.11.0-aarch64-apple-darwin.tar.gz"
      sha256 "c873a6d8fa35e949711f31687379aef654654beedaee745c1f9c5e173b547cde"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.11.0/rws-18.11.0-x86_64-apple-darwin.tar.gz"
      sha256 "77c8d6b5a17d4171b593796ee9537b5550f13687ff3445da33f8fdceab21c1f4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.11.0/rws-18.11.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7c6719dc3d1c90a9c407e608ee728735cebbaa76bbc89f4ee2e3678341ec63d1"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.11.0/rws-18.11.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "24377ddbc0684179c282d9579f568655a97402261232dc9ee230d30d89a74fc5"
    end
  end

  def install
    bin.install "rws"
  end

  test do
    port = free_port
    pid = spawn bin/"rws", "--port=#{port}"
    sleep 2
    assert_match "OK", shell_output("curl -s http://127.0.0.1:#{port}/healthz")
  ensure
    Process.kill("TERM", pid)
  end
end
