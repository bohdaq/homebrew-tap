class Rws < Formula
  desc "HTTP/1.1, HTTP/2 and HTTP/3 web server, reverse proxy and app framework"
  homepage "https://rws8.tech"
  version "18.27.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.27.0/rws-18.27.0-aarch64-apple-darwin.tar.gz"
      sha256 "dd0ba8f05619c2725886540bede744737733348e2bf6b015be36c5abf2524e2c"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.27.0/rws-18.27.0-x86_64-apple-darwin.tar.gz"
      sha256 "98ee394e1b94166a796d5731f2f178f313c3f623e27038972b03c81543c219dd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.27.0/rws-18.27.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "8665d1e82157689c797a697eaf38a86a1e5822c7f75fd5a30094d75a568bba11"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.27.0/rws-18.27.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "089de3103f495fb7cebdaece9c61752030fa4def345de745557d696e278657c2"
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
