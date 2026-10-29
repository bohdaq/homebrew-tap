class Rws < Formula
  desc "HTTP/1.1, HTTP/2 and HTTP/3 web server, reverse proxy and app framework"
  homepage "https://rws8.tech"
  version "18.9.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.9.1/rws-18.9.1-aarch64-apple-darwin.tar.gz"
      sha256 "166247bdf87c4b74bcbe79672eac2251a6e3970a3f13e862afb0c664d4acfd88"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.9.1/rws-18.9.1-x86_64-apple-darwin.tar.gz"
      sha256 "772a1fdbb5c85bb079a846de65176f506d5309be2b2be41be9df512317d74331"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.9.1/rws-18.9.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c05eb03540a5d050f4a6ed749b661bfe9f18e7c808c76b6ed2b48d28a7116a6b"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.9.1/rws-18.9.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "130f62bf98b44d3bea5b4dfd3fed4b304379e06f9b22d8c9d1d5925b27703fc5"
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
