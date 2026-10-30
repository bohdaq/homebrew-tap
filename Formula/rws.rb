class Rws < Formula
  desc "HTTP/1.1, HTTP/2 and HTTP/3 web server, reverse proxy and app framework"
  homepage "https://rws8.tech"
  version "18.10.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.10.1/rws-18.10.1-aarch64-apple-darwin.tar.gz"
      sha256 "ed88ed5a6b993bc791c4bf7ddd3dc3cdf904c756130ec34a8d775a80c423fc29"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.10.1/rws-18.10.1-x86_64-apple-darwin.tar.gz"
      sha256 "bc8eaf46a556d405b576d7b6c151e837803f3d55d315273fa89c8558118a9e31"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.10.1/rws-18.10.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "441e9710f1217c76cf18dad3d80d3a0743b7732f561fadfbc0c93a4e8441268a"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.10.1/rws-18.10.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d2e569d0159d6d2eecba137bbb852feb2b7864e2839bcaf1126dc3bc2089aba1"
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
