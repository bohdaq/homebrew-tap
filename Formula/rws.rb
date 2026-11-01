class Rws < Formula
  desc "HTTP/1.1, HTTP/2 and HTTP/3 web server, reverse proxy and app framework"
  homepage "https://rws8.tech"
  version "18.22.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.22.0/rws-18.22.0-aarch64-apple-darwin.tar.gz"
      sha256 "7e87871c03587f95453678a0ef0abb0cb75590284d8f6f2b2106244b88e76f8c"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.22.0/rws-18.22.0-x86_64-apple-darwin.tar.gz"
      sha256 "4d19ba6680c7cad3ac5664a6d128428bdeec653c1fb0dd923e0865162da3c122"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.22.0/rws-18.22.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "22b1a40f1d077bc7e1f107518da1bebdae9db58963b51bd09bf14ef0423478dd"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.22.0/rws-18.22.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "38ad649acc18bf3d9b3e230808d9bf2b7b735652911375864423aef22aa76115"
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
