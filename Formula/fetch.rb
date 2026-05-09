class Fetch < Formula
  desc "Modern HTTP(S) client for the command line"
  homepage "https://github.com/ryanfowler/fetch"
  version "0.23.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.23.0/fetch-darwin-arm64.tar.gz"
      sha256 "0dbf4bf62733148a4b0871cad3ee8e102912d551c85c2cf42e2531d398048e5a"
    elsif Hardware::CPU.intel?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.23.0/fetch-darwin-amd64.tar.gz"
      sha256 "e440124124cf3b624e24ba12c1e6c295d737e88a3eafd4a3fafc291f4ac77c7c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.23.0/fetch-linux-arm64.tar.gz"
      sha256 "322e16c98006f29ad23c3b2e33f3b8f146a0caa064cfa07c822c0570b1cbb861"
    elsif Hardware::CPU.intel?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.23.0/fetch-linux-amd64.tar.gz"
      sha256 "a54c1d2ec54864b4436236075345969fc341b6b8d138bc0b2b8af4749512a30f"
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
