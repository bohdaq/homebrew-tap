class Rws < Formula
  desc "HTTP/1.1, HTTP/2 and HTTP/3 web server, reverse proxy and app framework"
  homepage "https://rws8.tech"
  version "18.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.0.0/rws-18.0.0-aarch64-apple-darwin.tar.gz"
      sha256 "ac7d8330dd3710635f1604c15c2fa3a26ff65846c5464539cddf608094605ee2"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.0.0/rws-18.0.0-x86_64-apple-darwin.tar.gz"
      sha256 "eea5522d99c248846ffca1c1a53bd32933318a1234ff038bc31ad1898bc01e28"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.0.0/rws-18.0.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ba1a71e9e7a12954f4e1f07f281659356c36605d47647e1222623b076f7abe9e"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.0.0/rws-18.0.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0ed768b4ccacbf473c2aa524bb117f9051c978d2b421ffdcf06b4f2a9d71e474"
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
