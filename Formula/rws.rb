class Rws < Formula
  desc "HTTP/1.1, HTTP/2 and HTTP/3 web server, reverse proxy and app framework"
  homepage "https://rws8.tech"
  version "17.111.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/17.111.0/rws-17.111.0-aarch64-apple-darwin.tar.gz"
      sha256 "e0885453062ddd3f738ab64e2c37451de8719f4b89e5a62f00775624195aba8f"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/17.111.0/rws-17.111.0-x86_64-apple-darwin.tar.gz"
      sha256 "7dc01e2103ac068e0cad8e5420feb31cb3c668de83460563424757ccbe98d1ca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/17.111.0/rws-17.111.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "694abb6d8a858163945318375150efb8e35f9b7e2f5431f63c1e14306750e33a"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/17.111.0/rws-17.111.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a8045a699486ff65f604234bc47a11532c7a299d00df878f9bcc0d7aea9bc4fe"
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
