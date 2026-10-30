class Rws < Formula
  desc "HTTP/1.1, HTTP/2 and HTTP/3 web server, reverse proxy and app framework"
  homepage "https://rws8.tech"
  version "18.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.10.0/rws-18.10.0-aarch64-apple-darwin.tar.gz"
      sha256 "da57e7d3c9562303462f804bddd2814eb4ee2d70909b1a4690fdfb04d077d2a7"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.10.0/rws-18.10.0-x86_64-apple-darwin.tar.gz"
      sha256 "d93da86738299b1c75142c00c58f70450773ebfc7f78a5abce96499a5ad9bd2f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.10.0/rws-18.10.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "23f283e62fe7c7ada72542c6dbf249575baf4aed8abda40145f23db1a6a998c7"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.10.0/rws-18.10.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "412ed244c1e9708aba7d7beab1da6943e0586d9b9a641854072a15d0361eb93f"
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
