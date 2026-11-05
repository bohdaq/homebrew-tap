class Rws < Formula
  desc "HTTP/1.1, HTTP/2 and HTTP/3 web server, reverse proxy and app framework"
  homepage "https://rws8.tech"
  version "18.32.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.32.0/rws-18.32.0-aarch64-apple-darwin.tar.gz"
      sha256 "4428ceadd27e9cfddb442bdf9a7006ef77a76606bda91f3adc0cf82c9d6366fb"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.32.0/rws-18.32.0-x86_64-apple-darwin.tar.gz"
      sha256 "ed4cd5c7752895876a8e3d3ad8999d809ed9622ea7d8c541c4f20de8011ae729"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.32.0/rws-18.32.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e2a8b3a1ed9c76798f1f22fa25519677bf15919d3f8f1a0eee9ac9915b0160ff"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.32.0/rws-18.32.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3181e4b1fd4c3b3c9e7adbee6f00c06baf47c671059bf81dbb45256a3159ac92"
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
