class Rws < Formula
  desc "HTTP/1.1, HTTP/2 and HTTP/3 web server, reverse proxy and app framework"
  homepage "https://rws8.tech"
  version "18.8.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.8.1/rws-18.8.1-aarch64-apple-darwin.tar.gz"
      sha256 "dd2a4f7e3848df1d5f114bde7bb8c3d8fe5db8d62fb82246599ecd4b90e8f660"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.8.1/rws-18.8.1-x86_64-apple-darwin.tar.gz"
      sha256 "88f20b15f7dcbdfe0606cda4225904f234af2c80818fd70ce2a5be1ed783fc2c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.8.1/rws-18.8.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "49d760e62570880ff520a472b2807c51e5d6d0b583243e928bbcf0f6a8a6e0fa"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.8.1/rws-18.8.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8fd7e41eaffde2b9e67eaf359983102e58bc38ee8a8b13825daea74109109c00"
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
