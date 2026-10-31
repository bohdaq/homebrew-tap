class Rws < Formula
  desc "HTTP/1.1, HTTP/2 and HTTP/3 web server, reverse proxy and app framework"
  homepage "https://rws8.tech"
  version "18.12.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.12.0/rws-18.12.0-aarch64-apple-darwin.tar.gz"
      sha256 "851d1d4bc6e6224b1fadb199d2a80857de3f9f6b2a79a2897bb1784e96cc5272"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.12.0/rws-18.12.0-x86_64-apple-darwin.tar.gz"
      sha256 "5976299fef25f59e9c2582103be055a16507f716e7de140281b5931ac721d1e6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.12.0/rws-18.12.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "37a2550af660994f13e36448597bb36a692f6d741cc0403ac2e8e26c3165ea63"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.12.0/rws-18.12.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f55fd0c856f92b6f3f82f9435845b20f3b32f6ce702fa470f5fc5cc472a01cc2"
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
