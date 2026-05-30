class Fetch < Formula
  desc "Modern HTTP(S) client for the command line"
  homepage "https://github.com/ryanfowler/fetch"
  version "0.24.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.24.6/fetch-darwin-arm64.tar.gz"
      sha256 "ee37fc5cd9e526e33e590f21dde346bc2f3595c1535bd7d84c8e79b43afe80df"
    elsif Hardware::CPU.intel?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.24.6/fetch-darwin-amd64.tar.gz"
      sha256 "2308558d52d3994d2f3bf7e22a78cc182e12294297d8690244dbcd9c7040478d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.24.6/fetch-linux-arm64.tar.gz"
      sha256 "ae285da50ca1d44288e79c72cfd6acdd255cef409149a5f3236d2969b7e87dee"
    elsif Hardware::CPU.intel?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.24.6/fetch-linux-amd64.tar.gz"
      sha256 "d757e0cb553b78eb904584634b6d2da2fd191b2104f2cc7aeae21fc6bb95f3bf"
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
