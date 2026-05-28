class Fetch < Formula
  desc "Modern HTTP(S) client for the command line"
  homepage "https://github.com/ryanfowler/fetch"
  version "0.24.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.24.4/fetch-darwin-arm64.tar.gz"
      sha256 "4d19fcf7cbcb189bb1e2e007cae3338707fec7f9ba140c67105c6b46eb7bfcfd"
    elsif Hardware::CPU.intel?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.24.4/fetch-darwin-amd64.tar.gz"
      sha256 "13f0043bf632a577b9dc57fc28e228a4f43377018e6c3bf84aac081a85870916"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.24.4/fetch-linux-arm64.tar.gz"
      sha256 "86b3b8134e3f146711a21d807aed12975b41c25a34a659621a1b2abfc90d0518"
    elsif Hardware::CPU.intel?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.24.4/fetch-linux-amd64.tar.gz"
      sha256 "e4549d79f75d5c1b70209f86a9249636983f5e91302a6946e3d2d3dbaed41ac6"
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
