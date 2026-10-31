class Rws < Formula
  desc "HTTP/1.1, HTTP/2 and HTTP/3 web server, reverse proxy and app framework"
  homepage "https://rws8.tech"
  version "18.16.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.16.0/rws-18.16.0-aarch64-apple-darwin.tar.gz"
      sha256 "5920b169d672aa878af3b16b9b91c8a6ebb1cca68265915541d4202df3a555c1"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.16.0/rws-18.16.0-x86_64-apple-darwin.tar.gz"
      sha256 "b1f5e347b35776927b00e8dd17d8e82bfd301083b3756c100621fcff0d017b74"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.16.0/rws-18.16.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d2288681c75d23dd28cab26ff4af73675f78977a7fa9652094f7c6fc4e46b128"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.16.0/rws-18.16.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1d5899b495e1c0333a46e4ba68bca0c4ee4ced3fac17b2c1567de745104685ac"
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
