class Rws < Formula
  desc "HTTP/1.1, HTTP/2 and HTTP/3 web server, reverse proxy and app framework"
  homepage "https://rws8.tech"
  version "18.14.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.14.0/rws-18.14.0-aarch64-apple-darwin.tar.gz"
      sha256 "15f34b55ce9e8deaf20596dab22ebd3329d5988684fce6d0054ed7b1f0864316"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.14.0/rws-18.14.0-x86_64-apple-darwin.tar.gz"
      sha256 "5446c21de39ee1e44d05b349bdf89c24ef7ba4954d041e86554f41026d830545"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.14.0/rws-18.14.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "2d0163c6f8db3ae3aedeca209a320b2e66c91a98ea353055d41a262e9d798988"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.14.0/rws-18.14.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d895dbab9ffcb0bc91cb47e5ae0630e69a9b3f960687ff808263977bc357071a"
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
