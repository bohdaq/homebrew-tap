class Rws < Formula
  desc "HTTP/1.1, HTTP/2 and HTTP/3 web server, reverse proxy and app framework"
  homepage "https://rws8.tech"
  version "18.13.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.13.0/rws-18.13.0-aarch64-apple-darwin.tar.gz"
      sha256 "14d9d92f3264243ffe8f9e7f04950e2f8431abcee91c1713d4b96011893131d8"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.13.0/rws-18.13.0-x86_64-apple-darwin.tar.gz"
      sha256 "b82d0246a4c354b8c97fa67272405f7d012be43446d328b5cd7a4bb78555466e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.13.0/rws-18.13.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d0a0af7baf40f180d480dcf598570ce96ab1d285eef863db1951307420304918"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.13.0/rws-18.13.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1b4b4079d0bc7a3796db9ed1c303e941974b3f4a4ef45fac86ebfc6f13610f31"
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
