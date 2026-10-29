class Rws < Formula
  desc "HTTP/1.1, HTTP/2 and HTTP/3 web server, reverse proxy and app framework"
  homepage "https://rws8.tech"
  version "18.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.9.0/rws-18.9.0-aarch64-apple-darwin.tar.gz"
      sha256 "ecc99b03ae272a6031cc927cb561a4d2cd748b225638087ced282f3d3a0f88ae"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.9.0/rws-18.9.0-x86_64-apple-darwin.tar.gz"
      sha256 "0b9b12f31d0df652185e6a0c32415ec5e514041e27c0b054a40abdec255d787b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.9.0/rws-18.9.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a676715df9ba225a8d19e7e98f8a55120182816835e3046eb6ec49624626bbd8"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.9.0/rws-18.9.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2b2c6588a7df7df41073181b33077b25e9cd488632c4c944644789c502ec04c0"
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
