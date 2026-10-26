class Rws < Formula
  desc "HTTP/1.1, HTTP/2 and HTTP/3 web server, reverse proxy and app framework"
  homepage "https://rws8.tech"
  version "18.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.1.0/rws-18.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "e6498c152bf770ff3d8f3bd2ac4ac68ffb63d5fbe888340fb72af8c143fa8710"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.1.0/rws-18.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "77450db32807c447a2a39b3f5dd01b1337b014546e813009133e24133ea2c93d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.1.0/rws-18.1.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e60abb8122c8008a783d72a6fb84796e8c2e63e5b12d9daa87dc82be9aa9887f"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.1.0/rws-18.1.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "49d37d6cb6936dca3d25a3f75612f1b02fb02b6235c53abe245a8badafd3334e"
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
