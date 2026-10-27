class Rws < Formula
  desc "HTTP/1.1, HTTP/2 and HTTP/3 web server, reverse proxy and app framework"
  homepage "https://rws8.tech"
  version "18.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.6.0/rws-18.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "7a2896803d33fe9920e0a83528b64e59a9a9ca662f37628a49de2c6d818e3dad"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.6.0/rws-18.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "54bfb93a34c42ec458aabef872cb43831a5a15d859106b8218e57161f5aa6ada"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.6.0/rws-18.6.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "dff659ee125df761e811a9987a54d72c385b2961b2ccb4d6045b9e8b1e8a94c0"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.6.0/rws-18.6.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "990ca6d36070e859760a58e07a824b60ccda9b72166e3776285742abf7a3c974"
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
