class Rws < Formula
  desc "HTTP/1.1, HTTP/2 and HTTP/3 web server, reverse proxy and app framework"
  homepage "https://rws8.tech"
  version "18.8.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.8.2/rws-18.8.2-aarch64-apple-darwin.tar.gz"
      sha256 "362a588d044bf7b43ae695c4d4b6176afe36a57e29b831fbb9d943bb0e354c13"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.8.2/rws-18.8.2-x86_64-apple-darwin.tar.gz"
      sha256 "8d50180f438bfede221172318addf6e1c11d37cb341d5da01e2caf11883be94f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.8.2/rws-18.8.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "8ad2dd04b73ccdb72156dd8a7e2b205d60b589a1026fe44d36c493c262832db7"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.8.2/rws-18.8.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "82500c9ba528ff290e1ee59ed04883f770e1b6c86f4f1bbc1e475c74d77578bc"
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
