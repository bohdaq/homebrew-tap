class Rws < Formula
  desc "HTTP/1.1, HTTP/2 and HTTP/3 web server, reverse proxy and app framework"
  homepage "https://rws8.tech"
  version "18.23.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.23.1/rws-18.23.1-aarch64-apple-darwin.tar.gz"
      sha256 "3e1fb52c7a7ed3a7b96ed4790a8eab955609ec1cbf66aeb32e90ed7d43a41555"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.23.1/rws-18.23.1-x86_64-apple-darwin.tar.gz"
      sha256 "cc383ea8d9d0600a1a040c29ef8ae2e545d2d36ecce97a51be97577ebe3b263e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.23.1/rws-18.23.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a746adbe01fa3901e507a9798a67beb95feece938942ce47704388573c5f79f3"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.23.1/rws-18.23.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "4f799ab88fd705988b6d4f16f0ed39e567749f8e930b2439c6e77095b62fbef0"
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
