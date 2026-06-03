class Fetch < Formula
  desc "Modern HTTP(S) client for the command line"
  homepage "https://github.com/ryanfowler/fetch"
  version "0.24.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.24.9/fetch-darwin-arm64.tar.gz"
      sha256 "b7e5167fb846bb77df52ddb64ce3c7f5b25175277e69fbcd3e9f9adf8ff222c8"
    elsif Hardware::CPU.intel?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.24.9/fetch-darwin-amd64.tar.gz"
      sha256 "e1b83c9702a405700aed848835d7049b5f03e1b25e7504677fbde0e8eed5e739"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.24.9/fetch-linux-arm64.tar.gz"
      sha256 "66b6093d5f57af2f6a371552ec44ec17ab674c9ac43c962eea27c9f00fe7930a"
    elsif Hardware::CPU.intel?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.24.9/fetch-linux-amd64.tar.gz"
      sha256 "f2ba58a7555af8d0c712f92ed6f6f63dabd587b0c2ff35c3a710ebcebc0edf12"
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
