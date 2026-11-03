class Rws < Formula
  desc "HTTP/1.1, HTTP/2 and HTTP/3 web server, reverse proxy and app framework"
  homepage "https://rws8.tech"
  version "18.26.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.26.0/rws-18.26.0-aarch64-apple-darwin.tar.gz"
      sha256 "38d4277ac1057c2834ef6b13540b1ba225172d8b00aa8af17d3e4f9db13da420"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.26.0/rws-18.26.0-x86_64-apple-darwin.tar.gz"
      sha256 "a9bd4a3dab4cd40c9d83eb9b8e84476d4d5074593314538f88be94e6c501eb41"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.26.0/rws-18.26.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7a85af1df59172263c5dbe202c002ba267fda6d82ade958d4f19cdcf8cfde1ed"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.26.0/rws-18.26.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "cfb187c42e3d1faa92b2f66e0f0b00954c0fe534bcd5b169b880c33eac131240"
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
