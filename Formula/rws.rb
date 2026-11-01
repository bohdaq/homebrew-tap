class Rws < Formula
  desc "HTTP/1.1, HTTP/2 and HTTP/3 web server, reverse proxy and app framework"
  homepage "https://rws8.tech"
  version "18.19.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.19.0/rws-18.19.0-aarch64-apple-darwin.tar.gz"
      sha256 "6b83eff8120c2710c51b514164a4621074db095226f60c1f8df580d933c766d0"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.19.0/rws-18.19.0-x86_64-apple-darwin.tar.gz"
      sha256 "167db0de604d921dd6666e5666d67dd4dc3a05a66abab1848bbf38ff4cea3801"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.19.0/rws-18.19.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "80fbbb409163a647fece9a888501134b260940ee2a0aa77f4bff87fbf1e7bf2a"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.19.0/rws-18.19.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "519ccc250a51919b43b476209cbc9af2f0097068ddaf578482eec42a2b44672c"
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
