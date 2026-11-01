class Rws < Formula
  desc "HTTP/1.1, HTTP/2 and HTTP/3 web server, reverse proxy and app framework"
  homepage "https://rws8.tech"
  version "18.18.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.18.0/rws-18.18.0-aarch64-apple-darwin.tar.gz"
      sha256 "5c9d10bd6d53c4a733b63fcb22a9f40db7716ef41841a163e7068b5056f524d4"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.18.0/rws-18.18.0-x86_64-apple-darwin.tar.gz"
      sha256 "d858f1c9215b30a603bc787236a7f058ec19155ccdc455798e6d440adfa77131"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.18.0/rws-18.18.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a53ce4407c407093632bc588a95db99108435032d7057b3a14bd6ddbfa851ab7"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.18.0/rws-18.18.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8d85b4b9c1c047e47e0a3ec5c764b6ac4f81ef80926542556f683b8c6fc1b19b"
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
