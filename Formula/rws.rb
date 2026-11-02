class Rws < Formula
  desc "HTTP/1.1, HTTP/2 and HTTP/3 web server, reverse proxy and app framework"
  homepage "https://rws8.tech"
  version "18.25.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.25.0/rws-18.25.0-aarch64-apple-darwin.tar.gz"
      sha256 "bc4eb5d09d6fdf47f22fe144f5e06990ec152784e79eabccf0a5277577a2df7d"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.25.0/rws-18.25.0-x86_64-apple-darwin.tar.gz"
      sha256 "aa176f1bd400f5607fdda5fc4042424d25f6c796370725b8249478ce2906a5f3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.25.0/rws-18.25.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "29b80e771d80c3c84750584370efa7e5db0bdf544ecfff90d0b2e10587cf613c"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.25.0/rws-18.25.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9bf3b7c3ffa77017490daddff6b09e0ca55875f9ee7a0cb3908c6acafdd1dc09"
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
