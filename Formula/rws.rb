class Rws < Formula
  desc "HTTP/1.1, HTTP/2 and HTTP/3 web server, reverse proxy and app framework"
  homepage "https://rws8.tech"
  version "18.8.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.8.3/rws-18.8.3-aarch64-apple-darwin.tar.gz"
      sha256 "15d365f6fac1b1e853a4cbe4c5fde5e4d5d1ccfc3df4b276579ad073299387c1"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.8.3/rws-18.8.3-x86_64-apple-darwin.tar.gz"
      sha256 "2fa94d24827b87ba4846cb8e0b2321e5f1b387cf5f6fba9a31b109c8f8ae9d69"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.8.3/rws-18.8.3-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b167c30f1d5478c2d97f864da52d41539e58c8af4cfed1682ae245cad1c151c8"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.8.3/rws-18.8.3-x86_64-unknown-linux-musl.tar.gz"
      sha256 "be2b468e2e670a73707d738235cd7c8d28f02f6c9d93bea4f6baf57af2563383"
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
