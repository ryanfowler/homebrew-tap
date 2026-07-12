class Fetch < Formula
  desc "Modern HTTP(S) client for the command line"
  homepage "https://github.com/ryanfowler/fetch"
  version "0.25.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.25.2/fetch-darwin-arm64.tar.gz"
      sha256 "19522239f1bc4d5a94746a3f51fdac3d5e13288e3ff9d981fe3422d867a9840f"
    elsif Hardware::CPU.intel?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.25.2/fetch-darwin-amd64.tar.gz"
      sha256 "b5839652d06ddf9323f8c98c03b008ca9daa577f062121658df274fefb77bb55"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.25.2/fetch-linux-arm64.tar.gz"
      sha256 "5f6e4249bc66a732ea7d4a24cc0b459b1b7b3213b280658b4a131e5365a18848"
    elsif Hardware::CPU.intel?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.25.2/fetch-linux-amd64.tar.gz"
      sha256 "13daee36562a815aed48b617d706307af5c918fbbd106833b0ba8831de73a9d9"
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
