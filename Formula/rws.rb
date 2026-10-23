class Rws < Formula
  desc "HTTP/1.1, HTTP/2 and HTTP/3 web server, reverse proxy and app framework"
  homepage "https://rws8.tech"
  version "17.112.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/17.112.0/rws-17.112.0-aarch64-apple-darwin.tar.gz"
      sha256 "643deda035bd58e63d5340099fab88b357c102bd456027bb54616960cd38ffac"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/17.112.0/rws-17.112.0-x86_64-apple-darwin.tar.gz"
      sha256 "7cb2329fed7751dafc7ee08e43ad78eaf661f2e2a9dfad9f32498393abda3bd2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/17.112.0/rws-17.112.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c80b4d40af58fee4a0848a9e267e6a1766cf2c80f384236e264a9b45cfd25d48"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/17.112.0/rws-17.112.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6ab8b13273386d916adfca6c1857dadee6e2f4672914097e291c8d0cc2b1ebab"
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
