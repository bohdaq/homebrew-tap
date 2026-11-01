class Rws < Formula
  desc "HTTP/1.1, HTTP/2 and HTTP/3 web server, reverse proxy and app framework"
  homepage "https://rws8.tech"
  version "18.24.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.24.0/rws-18.24.0-aarch64-apple-darwin.tar.gz"
      sha256 "9733741464e1daf1d52bd8804b7672b26a970f3895471f681190f845cbb24349"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.24.0/rws-18.24.0-x86_64-apple-darwin.tar.gz"
      sha256 "2d55931955553d8bb4c6638b0e772bd905f6df3d3f16b636f8f63bd0395f4b89"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.24.0/rws-18.24.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c64e671477bf760e028545d89b15fff345426baaf72ce15dfc60b78fd29da5c2"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.24.0/rws-18.24.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "94cb2e6de36a21e75c46c797da3a626e0e91b4b4e98031082d252e99289d51f4"
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
