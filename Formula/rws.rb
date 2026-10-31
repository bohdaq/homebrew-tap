class Rws < Formula
  desc "HTTP/1.1, HTTP/2 and HTTP/3 web server, reverse proxy and app framework"
  homepage "https://rws8.tech"
  version "18.17.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.17.0/rws-18.17.0-aarch64-apple-darwin.tar.gz"
      sha256 "6fc9a4cf03edf7569fe30430128c16ab4e7bc77ce7deb741264ec2d8fccdfd73"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.17.0/rws-18.17.0-x86_64-apple-darwin.tar.gz"
      sha256 "f43ca2d8f71457ace6e9dd8a5f5069a1c647712faf0e29851f1785a43a4704ce"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.17.0/rws-18.17.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b9219866e04f33f9da2eba0b0bbba47ca2d77cad0d1e0024c07409626c47e4ba"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.17.0/rws-18.17.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "969915563c962e5538af5e68685fb3786378bc4456d75f6bdc05748c31af40ff"
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
