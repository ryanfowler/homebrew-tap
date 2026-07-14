class Fetch < Formula
  desc "Modern HTTP(S) client for the command line"
  homepage "https://github.com/ryanfowler/fetch"
  version "0.26.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.26.0/fetch-darwin-arm64.tar.gz"
      sha256 "effb3344ec348fcfa0ffa523fa7b751f11409b569d2c4ad21293bf00b786df30"
    elsif Hardware::CPU.intel?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.26.0/fetch-darwin-amd64.tar.gz"
      sha256 "1910e8d20495f725b354b5159b37a7453d7ece7d4da91a9428a52f06c576ddcb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.26.0/fetch-linux-arm64.tar.gz"
      sha256 "a59173f82b9615ade1fd0e31f818bea6fb644b16e563f8e1537edc518442f57e"
    elsif Hardware::CPU.intel?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.26.0/fetch-linux-amd64.tar.gz"
      sha256 "10f94fa2e8bd777b9a91c3bf6c4a857a17ff44ecc9001be9b5eb46c46791eb1f"
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
