class Rws < Formula
  desc "HTTP/1.1, HTTP/2 and HTTP/3 web server, reverse proxy and app framework"
  homepage "https://rws8.tech"
  version "18.35.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.35.1/rws-18.35.1-aarch64-apple-darwin.tar.gz"
      sha256 "f088deff6de2cd3a36cf6d8dee8b7c96fadbeba1c201b5057b0c8095a564bf0d"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.35.1/rws-18.35.1-x86_64-apple-darwin.tar.gz"
      sha256 "847b98ef36030a1673196f5d94f77b3babb2af3f4478832cd6c76936e53a88ab"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.35.1/rws-18.35.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "6a0c7ade700f67f2af925bb9ebff808c1b20e9f6b7a5f17ba27aefe20c1e4c66"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.35.1/rws-18.35.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8a3fbdae6537942dd9ce3a48acafc85312be9028ea0864e2871d47e3a7bdde47"
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
