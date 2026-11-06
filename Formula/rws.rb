class Rws < Formula
  desc "HTTP/1.1, HTTP/2 and HTTP/3 web server, reverse proxy and app framework"
  homepage "https://rws8.tech"
  version "18.34.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.34.0/rws-18.34.0-aarch64-apple-darwin.tar.gz"
      sha256 "0976e7de5c1a614cea66b93ffdc4da18bb84cf5df7f177310f9f625291fcc08e"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.34.0/rws-18.34.0-x86_64-apple-darwin.tar.gz"
      sha256 "e7e484d652e8f41c36ade5fa4f20aaa1c99914202087f9fe7996b88558752ee7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.34.0/rws-18.34.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "3185d1b59dc01dcd1a43c903be055abae9f662f58d885025c9f70dcc0742570c"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.34.0/rws-18.34.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "43f702e7d7f862928c9fa4549db26440bf2b2f7dcff393fd1bfc0c85f50b068f"
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
