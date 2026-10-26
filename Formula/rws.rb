class Rws < Formula
  desc "HTTP/1.1, HTTP/2 and HTTP/3 web server, reverse proxy and app framework"
  homepage "https://rws8.tech"
  version "18.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.2.0/rws-18.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "052dc8b59ab7b75935b3718243d372990b9257a8130e7d8a343a8b6940fd1778"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.2.0/rws-18.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "36f715ca3353b806627980484f7d3515546e5a547f32ac1b58ee8d15667ef823"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.2.0/rws-18.2.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "760486a2eaaca6bb8aee64cee9c01c941cbe82281812fcee0bd79e3514e79ba0"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.2.0/rws-18.2.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "5b48a623d51df0db1d14f236e99d05a95148132c31a6ab4ff01279535e285350"
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
