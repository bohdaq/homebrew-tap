class Rws < Formula
  desc "HTTP/1.1, HTTP/2 and HTTP/3 web server, reverse proxy and app framework"
  homepage "https://rws8.tech"
  version "18.36.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.36.0/rws-18.36.0-aarch64-apple-darwin.tar.gz"
      sha256 "c7036e33535245d56360a58d875a66dfe98a085ab4df4ab6bf249c97a55eea80"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.36.0/rws-18.36.0-x86_64-apple-darwin.tar.gz"
      sha256 "04fce197c2883c04658a8734334cc76d5fac96888737a19da923b564f5ca59e7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.36.0/rws-18.36.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "cf7b28c1db8c4d8eafd0a903023c398409bf2e100e6820bb62d3f4e132ab7c1e"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.36.0/rws-18.36.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9e4128feece4fd262bb68eb3596247441e310951231304b64d2306461f9349e8"
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
