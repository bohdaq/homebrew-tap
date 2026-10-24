class Rws < Formula
  desc "HTTP/1.1, HTTP/2 and HTTP/3 web server, reverse proxy and app framework"
  homepage "https://rws8.tech"
  version "17.113.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/17.113.0/rws-17.113.0-aarch64-apple-darwin.tar.gz"
      sha256 "62414954b61148c7ae7420d0a88f2231fbad03856b41cd7ed672f129d333a40c"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/17.113.0/rws-17.113.0-x86_64-apple-darwin.tar.gz"
      sha256 "8643e609aaccf039f1d832439f6993f6863ef956123fd4aa5d4b44d1a5b7ce6d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/17.113.0/rws-17.113.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "5b43a83ceaed2a184ae25b252c229f7d5a2b0695221ee60d7d009749a6ed9727"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/17.113.0/rws-17.113.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "7df4533a07634afaf8d4794caf0eec86d04dbd9a03899ced6161b77efdcb31b7"
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
