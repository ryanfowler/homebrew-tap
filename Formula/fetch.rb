class Fetch < Formula
  desc "Modern HTTP(S) client for the command line"
  homepage "https://github.com/ryanfowler/fetch"
  version "0.24.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.24.11/fetch-darwin-arm64.tar.gz"
      sha256 "e89314963f9effa1d37939ee6f4f126fbc6c637cc68638d2351de470dddf059e"
    elsif Hardware::CPU.intel?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.24.11/fetch-darwin-amd64.tar.gz"
      sha256 "48703a1046399a9aaa98b9ef73526dcbac1dac59f592ecabecef27584c5d760d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.24.11/fetch-linux-arm64.tar.gz"
      sha256 "b9b96d4a9d2c42cd9c1372b9fc2a0b283b3e8f968b0e06b0de9225692b58ede2"
    elsif Hardware::CPU.intel?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.24.11/fetch-linux-amd64.tar.gz"
      sha256 "e54c4d25c3c74909c416e5d00dd8ffa6e85a70bf525228bb74ed7cdebcbb125a"
    end
  end

  def install
    bin.install "fetch"
    generate_completions_from_executable(bin/"fetch", "--complete")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fetch --version")
  end
end
