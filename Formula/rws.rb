class Rws < Formula
  desc "HTTP/1.1, HTTP/2 and HTTP/3 web server, reverse proxy and app framework"
  homepage "https://rws8.tech"
  version "18.15.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.15.0/rws-18.15.0-aarch64-apple-darwin.tar.gz"
      sha256 "a31f01ebf2b2b504a1af6f273931b3476a4b4cbd2f7d68d45ccc26aa9ca7bb81"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.15.0/rws-18.15.0-x86_64-apple-darwin.tar.gz"
      sha256 "205418808b450c047a6cf6aa24f9f73a98621bf79e3cd16eb3c4f183c21f1537"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.15.0/rws-18.15.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a7aa3a7297964b528a562b09105f744ddee5959a520e9e1e6d7f676f655679e4"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.15.0/rws-18.15.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "fbb7d48f0c19c7ed6033507f5819c4a9cae527249ee9772aa2b2f2a90da29200"
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
