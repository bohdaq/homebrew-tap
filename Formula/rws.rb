class Rws < Formula
  desc "HTTP/1.1, HTTP/2 and HTTP/3 web server, reverse proxy and app framework"
  homepage "https://rws8.tech"
  version "18.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.7.0/rws-18.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "b6228ed89326e555284193c23f308603957f64f6ba4a8151974a5d742ad934b1"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.7.0/rws-18.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "48309ee5f5777576d4b1a662ace7e1a10494d926ecee3abbca6e0f394b41eaf6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.7.0/rws-18.7.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a514a916eea8c4bdca234a2a83845223c05435f5c10daea2a8a9266b9db452c3"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.7.0/rws-18.7.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ff9f841353b502971b845c8cbc9928ffb3aae2891cd8d8fd02f374c36c2648e9"
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
