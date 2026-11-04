class Rws < Formula
  desc "HTTP/1.1, HTTP/2 and HTTP/3 web server, reverse proxy and app framework"
  homepage "https://rws8.tech"
  version "18.28.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.28.1/rws-18.28.1-aarch64-apple-darwin.tar.gz"
      sha256 "81a98218b4f149cf28f71286a8fb7e898eb7cd0de72a56ae11b760c22a3679d5"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.28.1/rws-18.28.1-x86_64-apple-darwin.tar.gz"
      sha256 "c08fe6e2357c99277d2b08019ade5cee16dcae8e1dfea8c192113c682bad419c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.28.1/rws-18.28.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a877210affae4553a8eab38c04e409f07ab7d8e8e08d9c597d8c6b2c64247d38"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.28.1/rws-18.28.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f5704ecf61c7e3990ac14cc5bb8b7bdbed8e7d444beb17ea8bd6be105c31d7c5"
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
