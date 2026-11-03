class Rws < Formula
  desc "HTTP/1.1, HTTP/2 and HTTP/3 web server, reverse proxy and app framework"
  homepage "https://rws8.tech"
  version "18.27.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.27.1/rws-18.27.1-aarch64-apple-darwin.tar.gz"
      sha256 "6c2b646e2286b4f84beb7edd79eaae543dc5e6a7be1cb7d4bbe1a1c7add537fa"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.27.1/rws-18.27.1-x86_64-apple-darwin.tar.gz"
      sha256 "8f9b6ba1115da701779dcb19f5c5a24e0d40ee6eae7f4d21471e199a8f845de1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.27.1/rws-18.27.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "cccda3cc0c5a01e3c09eb33908d59f703d41e016ae5932441676dc65f562ade2"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.27.1/rws-18.27.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "eb9e38eeb90bcb593dafa1303f897f5844bba20f7e72417f74b79cbb6a6f932d"
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
