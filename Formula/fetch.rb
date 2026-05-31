class Fetch < Formula
  desc "Modern HTTP(S) client for the command line"
  homepage "https://github.com/ryanfowler/fetch"
  version "0.24.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.24.7/fetch-darwin-arm64.tar.gz"
      sha256 "10785783685ab8bd5128a54ce0a8115103c8415ad8954913de4ad595d805613c"
    elsif Hardware::CPU.intel?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.24.7/fetch-darwin-amd64.tar.gz"
      sha256 "ee1245e7dff5a865f1b4c67cb34c76b7d850ad3077dc61e30f4cbdd8bde900f0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.24.7/fetch-linux-arm64.tar.gz"
      sha256 "8d3ad3cb90692aab85c919de97517ea8571191ff5c97c8b1dd4147e594944ec4"
    elsif Hardware::CPU.intel?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.24.7/fetch-linux-amd64.tar.gz"
      sha256 "5982cb6a23695c9883b6dfcfec1bfaa10d932557e88dfe9a782e7cad6e7f893f"
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
