class Rws < Formula
  desc "HTTP/1.1, HTTP/2 and HTTP/3 web server, reverse proxy and app framework"
  homepage "https://rws8.tech"
  version "18.8.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.8.4/rws-18.8.4-aarch64-apple-darwin.tar.gz"
      sha256 "ab7a3c8d4e79e8b77226ab4af7f8e08a939b7fd0ccc3f401629f3b6da2925e1a"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.8.4/rws-18.8.4-x86_64-apple-darwin.tar.gz"
      sha256 "952281819a3c5cbf9abd454c668465ab9847a4d8a758981894863ab69bb02b78"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.8.4/rws-18.8.4-aarch64-unknown-linux-musl.tar.gz"
      sha256 "4c1bf694bfc4ea8eb8f3228e49e198450d2d2af8e20e360f0341a51030307a10"
    end
    on_intel do
      url "https://github.com/bohdaq/rust-web-server/releases/download/18.8.4/rws-18.8.4-x86_64-unknown-linux-musl.tar.gz"
      sha256 "21008b4e846c8b866b76be0ed2229ff725e238731e9d898b8a8aa034881f8f81"
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
