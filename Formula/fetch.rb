class Fetch < Formula
  desc "Modern HTTP(S) client for the command line"
  homepage "https://github.com/ryanfowler/fetch"
  version "0.18.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.18.0/fetch-darwin-arm64.tar.gz"
      sha256 "f490fa59cce598a2d3f03456e961f1bacf976bd365f22adfdd2105d95dea4f23"
    elsif Hardware::CPU.intel?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.18.0/fetch-darwin-amd64.tar.gz"
      sha256 "42b148cda765598e3515a525bd41657cd26fb4a1774d83930db9c8bdac5b1cb6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.18.0/fetch-linux-arm64.tar.gz"
      sha256 "9b2d6aef121ba9e19c0b143b44e6cd82c7d86356e53a9a39198f843737517963"
    elsif Hardware::CPU.intel?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.18.0/fetch-linux-amd64.tar.gz"
      sha256 "200ceaf984da68e3e89cee923453d881809ce9bc4223e35be0ccf746db13548d"
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
