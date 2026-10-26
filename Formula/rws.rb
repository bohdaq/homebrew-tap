class Rws < Formula
  desc "HTTP/1.1, HTTP/2 and HTTP/3 web server, reverse proxy and app framework"
  homepage "https://rws8.tech"
  version "18.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.1.0/rws-18.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "b6edbf5d34dbe530f54819a31c344b96e82543bf161b4a8cebe6b57b2ecf7d5c"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.1.0/rws-18.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "1bfc899a36eaa343090b8596eda12ee85fc50773aa959c464f7642957f3a8eac"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.1.0/rws-18.1.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "6444b1203a918eb49cadf1ab55f7791086254c33bd6a6df00a5e80d39e2d1357"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.1.0/rws-18.1.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "05e40cdec1cc171fc25976bd8287b16e2c0369981782c7e8f6ffdec16be9ecff"
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
