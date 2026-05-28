class Fetch < Formula
  desc "Modern HTTP(S) client for the command line"
  homepage "https://github.com/ryanfowler/fetch"
  version "0.24.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.24.5/fetch-darwin-arm64.tar.gz"
      sha256 "5e772ea360781151aa760e129a471c6738628ea57ffbf7655c79ec6511a390b0"
    elsif Hardware::CPU.intel?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.24.5/fetch-darwin-amd64.tar.gz"
      sha256 "05cd4eb4b0b403c606a22495c540c8b4ca66c58e17bb1390968382ad767d3de7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.24.5/fetch-linux-arm64.tar.gz"
      sha256 "bc10695c03f0ae314801ac8f75d22362897e9c50a206ce114141259ba83daa9d"
    elsif Hardware::CPU.intel?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.24.5/fetch-linux-amd64.tar.gz"
      sha256 "c22150f37aca3a01a7a658b101ea35c2bf0cadf4359b48d1cf5e03ad22139c80"
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
