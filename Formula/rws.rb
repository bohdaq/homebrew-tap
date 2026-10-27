class Rws < Formula
  desc "HTTP/1.1, HTTP/2 and HTTP/3 web server, reverse proxy and app framework"
  homepage "https://rws8.tech"
  version "18.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.4.0/rws-18.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "4c1c5ba0c621099971abed6b584e6ed4b48a9b45f287396feac433c9471931b9"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.4.0/rws-18.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "8729836a2f243d3457c133d8ee569349077337e20018f6bdca20adb8ac454aa7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.4.0/rws-18.4.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "14c03f590e2c61817e0e89c2e7bd4307669117221b7038400ab04d45bef48614"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.4.0/rws-18.4.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0b8413675ff0de93d6b5589410d3a9c7a8e2ea163027925c451e58bb48256de4"
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
