class Rws < Formula
  desc "HTTP/1.1, HTTP/2 and HTTP/3 web server, reverse proxy and app framework"
  homepage "https://rws8.tech"
  version "18.34.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.34.1/rws-18.34.1-aarch64-apple-darwin.tar.gz"
      sha256 "86ea38c260329d39c6b22076fa4e3df9e34aea4fed49fd6f4ca4f74030bdf38e"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.34.1/rws-18.34.1-x86_64-apple-darwin.tar.gz"
      sha256 "f0c21eb10c71aa06501ff42be7b34ca04ec2f38fb9e6183ee6e31fe0b8ae0ce5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.34.1/rws-18.34.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f5d7d9b045a0bf894afa1c387e9caed38fcb164d6e3a2017166a3cd9714d09bc"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.34.1/rws-18.34.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2c883bd237077c89fa128c08727ae8413cc5530a80c8e24632b5c22340586588"
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
