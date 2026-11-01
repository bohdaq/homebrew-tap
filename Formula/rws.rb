class Rws < Formula
  desc "HTTP/1.1, HTTP/2 and HTTP/3 web server, reverse proxy and app framework"
  homepage "https://rws8.tech"
  version "18.20.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.20.0/rws-18.20.0-aarch64-apple-darwin.tar.gz"
      sha256 "5efc0801062eaf4056f5921b68fe1d2cca7e3fa0062eb147a8be225b3b7dd95c"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.20.0/rws-18.20.0-x86_64-apple-darwin.tar.gz"
      sha256 "88410494fc311890ff8e66d5a32458884dcad3a65764e7583ba6fa18629be6cb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.20.0/rws-18.20.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "df835f576cd28c76b8326f036baede53e11cf201e3738769258ba3c93bc0bd34"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.20.0/rws-18.20.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "555756da972ef502e67832316885b5dafe082d95344ae04119673dd92de6d1e6"
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
