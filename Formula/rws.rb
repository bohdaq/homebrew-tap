class Rws < Formula
  desc "HTTP/1.1, HTTP/2 and HTTP/3 web server, reverse proxy and app framework"
  homepage "https://rws8.tech"
  version "18.28.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.28.0/rws-18.28.0-aarch64-apple-darwin.tar.gz"
      sha256 "58bc7fe69d18363e38b0c911a4cb4d91a370e6bda23bab61ce72f9b42c25d4ee"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.28.0/rws-18.28.0-x86_64-apple-darwin.tar.gz"
      sha256 "e040865bd33e611c7e7d5a8dfab34eeab5a424bc515f5d2a4352275bc8e9f6b6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.28.0/rws-18.28.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "5bd8ad8c5bbb80a1691decc496a2508396045d915dfcf116fb1231f03333c4e0"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.28.0/rws-18.28.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "76f54f01456d3513d7900c208eb3b4d3aad15c2c8265ec27970237d2055febf4"
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
