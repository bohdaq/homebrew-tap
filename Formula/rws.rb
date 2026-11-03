class Rws < Formula
  desc "HTTP/1.1, HTTP/2 and HTTP/3 web server, reverse proxy and app framework"
  homepage "https://rws8.tech"
  version "18.27.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.27.2/rws-18.27.2-aarch64-apple-darwin.tar.gz"
      sha256 "c286199db41a375af25e7f137e28dd854dc23e8de4d7a379add57481525c4e78"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.27.2/rws-18.27.2-x86_64-apple-darwin.tar.gz"
      sha256 "a6bcefe2999b48cce43676af47b52d6395ea3b7b61911eb4094927df24c16b05"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.27.2/rws-18.27.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "33769b2f7aeecbce6a77c6ed88ae5bff73da374463f0566c2ae7ffe107bfc4fa"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.27.2/rws-18.27.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "85c711943e1cadd92cc756a0e775607aa4a1a978bbb8234e610afd2c32574f50"
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
