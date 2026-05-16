class Fetch < Formula
  desc "Modern HTTP(S) client for the command line"
  homepage "https://github.com/ryanfowler/fetch"
  version "0.23.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.23.4/fetch-darwin-arm64.tar.gz"
      sha256 "f34c3e05318f442bccdb9921d74ca90feec8e04316f612667ff55ce8abfcc6d4"
    elsif Hardware::CPU.intel?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.23.4/fetch-darwin-amd64.tar.gz"
      sha256 "ea8cc1241f6cbd3e446cbf7497298e32cf253a69a74c1e514ce62a6aedf21983"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.23.4/fetch-linux-arm64.tar.gz"
      sha256 "1655ce578150904fbaabdf32f822b56e67590c110b37945e9bfc35160045cefe"
    elsif Hardware::CPU.intel?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.23.4/fetch-linux-amd64.tar.gz"
      sha256 "f882eb0d717f2f7f49bcc3b72ce9fa8d9794b441859f59ecbf3f6827339e4cd1"
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
