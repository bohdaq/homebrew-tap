class Rws < Formula
  desc "HTTP/1.1, HTTP/2 and HTTP/3 web server, reverse proxy and app framework"
  homepage "https://rws8.tech"
  version "18.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.3.0/rws-18.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "e718523e51ab22298a774d09bf386d50801a73ffd61ad210b20e21067b5ded81"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.3.0/rws-18.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "7b3b58ef872c8c208ac054a433576daaa48a5369696c40143933a31dd11561ab"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.3.0/rws-18.3.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "88b4daa693dcdeeb76c7f3ed3642fe0a2bd413116b5496da8ec24befb3fc1743"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.3.0/rws-18.3.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8c96a0c48e114eaee81741f1c3d03effbc1a35cbbc9963f055367b6e5d8e89af"
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
