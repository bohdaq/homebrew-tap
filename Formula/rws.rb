class Rws < Formula
  desc "HTTP/1.1, HTTP/2 and HTTP/3 web server, reverse proxy and app framework"
  homepage "https://rws8.tech"
  version "18.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.8.0/rws-18.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "747eccd9d8108b06e07088680c84162ab7c91d22d49cef26366070dc11988931"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.8.0/rws-18.8.0-x86_64-apple-darwin.tar.gz"
      sha256 "509c4e5a577aa8336fab307d5fcd73ebb6aaa7b7998d616a832d6b0517c48f69"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.8.0/rws-18.8.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "91435f1522310e67551eebe468b0c66c43c5a498b261695259371dbc10f2b493"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.8.0/rws-18.8.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "651cddda413902c4c682511aea487922ff19020248e123d16d4cb2bcbde918d2"
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
