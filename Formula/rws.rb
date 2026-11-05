class Rws < Formula
  desc "HTTP/1.1, HTTP/2 and HTTP/3 web server, reverse proxy and app framework"
  homepage "https://rws8.tech"
  version "18.30.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.30.0/rws-18.30.0-aarch64-apple-darwin.tar.gz"
      sha256 "d2facbf7d803dfba54f482373a9b4245587abd81ec23b739f643976e21668286"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.30.0/rws-18.30.0-x86_64-apple-darwin.tar.gz"
      sha256 "220cf3d1fda842c6d632da9687d83ec4e2ed4ee747b404ddf8af87e532dbca92"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.30.0/rws-18.30.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "8db46d7a7df067539d27b0be700b49ffcb28c51d7fe81f535a1f8e6a4ec9caa8"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.30.0/rws-18.30.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e0ed091a1db86e904a8deeeb7028c250e37c75a9728a4ae4d386bb80f050a582"
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
