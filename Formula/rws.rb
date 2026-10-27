class Rws < Formula
  desc "HTTP/1.1, HTTP/2 and HTTP/3 web server, reverse proxy and app framework"
  homepage "https://rws8.tech"
  version "18.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.5.0/rws-18.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "1604cdb9822b9d0cc4b801203a7dfbce8ed5111cb4ec7759577ca409d9924539"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.5.0/rws-18.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "301e09f02ae46c787abdf0e0834d6561d4a308379fa0fe6d55f689c0fe342eea"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.5.0/rws-18.5.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "48e08c0c8aec8ef93ff38131d55c430de9a8417358f5243c49312aa16e8f8221"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.5.0/rws-18.5.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "cd85278ae41d549196e758806a3e89276aef12b1c2e776aeb8bff073897b0bed"
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
