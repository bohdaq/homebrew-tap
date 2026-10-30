class Rws < Formula
  desc "HTTP/1.1, HTTP/2 and HTTP/3 web server, reverse proxy and app framework"
  homepage "https://rws8.tech"
  version "18.10.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.10.2/rws-18.10.2-aarch64-apple-darwin.tar.gz"
      sha256 "0bb297e376bf2c005e8e9ed8b22d46e691247b9341cda12bdf76ba2a63da4692"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.10.2/rws-18.10.2-x86_64-apple-darwin.tar.gz"
      sha256 "e94163f2a6a73d3aa21ae00f5d8004956efee305762ea1d38aaee94560d8dbba"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.10.2/rws-18.10.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b10ddf21807e052573454e2acd3a66c5da4a4c155a6bd2d416df460edabbf2e6"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.10.2/rws-18.10.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6ce365eb0696938c08f4b7c7c8103ce21092a87bca0c35a32f84098324e98190"
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
