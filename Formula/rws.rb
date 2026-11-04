class Rws < Formula
  desc "HTTP/1.1, HTTP/2 and HTTP/3 web server, reverse proxy and app framework"
  homepage "https://rws8.tech"
  version "18.29.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.29.0/rws-18.29.0-aarch64-apple-darwin.tar.gz"
      sha256 "280e97aed6475f2f825bcccafc9cda50b71a82db2b3ec6b83c1d23825b87429a"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.29.0/rws-18.29.0-x86_64-apple-darwin.tar.gz"
      sha256 "e3cc1effa49177ba14032287e806ebc825baa94d45ca1c8993ab470d8fc0f3bc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.29.0/rws-18.29.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0edffaf7d16e27d2c0a59afb73aaf30e8bd908bd3fabfb5ea093c80b7d648030"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.29.0/rws-18.29.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f7df86f053ff871eacde717373cf2a57995046f3990d3495c95f103ceb234d83"
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
