class Rws < Formula
  desc "HTTP/1.1, HTTP/2 and HTTP/3 web server, reverse proxy and app framework"
  homepage "https://rws8.tech"
  version "18.27.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.27.0/rws-18.27.0-aarch64-apple-darwin.tar.gz"
      sha256 "dcbe3e5c2c30c124e55d51b41e7a8950a9d4265820543191f6db6587fb967991"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.27.0/rws-18.27.0-x86_64-apple-darwin.tar.gz"
      sha256 "d243582ea196ad1beb8131d1dd9d08687d070a89a2b7b240df765f370bfa1a56"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.27.0/rws-18.27.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "92d3581a458747b9ea06348d08cdac15f105f9a9cc4400ff8fe040c847e493ee"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.27.0/rws-18.27.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2e2df0104eeeac5b9d0f3e9016461cf72b88c375bf64582c0887d17d33ad0e5b"
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
