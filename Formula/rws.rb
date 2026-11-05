class Rws < Formula
  desc "HTTP/1.1, HTTP/2 and HTTP/3 web server, reverse proxy and app framework"
  homepage "https://rws8.tech"
  version "18.31.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.31.0/rws-18.31.0-aarch64-apple-darwin.tar.gz"
      sha256 "3fc66d6ee82977fbe4ac5677b667c56a2a5491c6dec7c88f4f64f8bf27bb4fe4"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.31.0/rws-18.31.0-x86_64-apple-darwin.tar.gz"
      sha256 "1563b57e7a15356aaae884b8b14edd862cb05a52a9e9c4406dde5bbf3500f508"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.31.0/rws-18.31.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "8caccdee5ac0820d9e1f8e5e0d8486b361f0ce2319ec5d46eb0146f16afbfcca"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.31.0/rws-18.31.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "86309fdc1b991e40926f594cd1c623db2921899875097d8f8e8c2a4ab07e749a"
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
