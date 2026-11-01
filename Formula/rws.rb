class Rws < Formula
  desc "HTTP/1.1, HTTP/2 and HTTP/3 web server, reverse proxy and app framework"
  homepage "https://rws8.tech"
  version "18.21.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.21.0/rws-18.21.0-aarch64-apple-darwin.tar.gz"
      sha256 "affe2631dadf33179f82a76937caadbd77b69c52338f645e2da2cc4091244ddd"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.21.0/rws-18.21.0-x86_64-apple-darwin.tar.gz"
      sha256 "12c66b9a441e1a55b7c46dd108beaeb0f9d16c0b6bc8554c333dfaf1cbf80572"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.21.0/rws-18.21.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b3503a60c1aad779d1628e3c3befef812b5287dda47f601def67c94c6db01aa0"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.21.0/rws-18.21.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "bf1ec412f852ab22ee90c9c2098a226290b70396e53f8a7e4065eb61c985fade"
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
