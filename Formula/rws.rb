class Rws < Formula
  desc "HTTP/1.1, HTTP/2 and HTTP/3 web server, reverse proxy and app framework"
  homepage "https://rws8.tech"
  version "18.33.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.33.0/rws-18.33.0-aarch64-apple-darwin.tar.gz"
      sha256 "06780ccb9a66971b4bce3ac2d1fc394bf5f507358ae86584c5166fe9e0a46bc4"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.33.0/rws-18.33.0-x86_64-apple-darwin.tar.gz"
      sha256 "f43f393b8d1e029ca8accb95783150ed8c70e0c793abaaf5c71fadcd7380764c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.33.0/rws-18.33.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "9deb39c2d9e80ed27ebe15d315fa70d16d1282ac67c079b8125c8dab7bc09412"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.33.0/rws-18.33.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a59ef4d511ec498ccc89e6cbf421a1382b66394fb6b2bb7c88757d490378bf41"
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
