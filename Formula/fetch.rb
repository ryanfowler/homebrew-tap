class Fetch < Formula
  desc "Modern HTTP(S) client for the command line"
  homepage "https://github.com/ryanfowler/fetch"
  version "0.23.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.23.2/fetch-darwin-arm64.tar.gz"
      sha256 "731909177cd25596cb4c285d8cabc23ff0cf66fb93d527d3617ea3f8c4c03a5b"
    elsif Hardware::CPU.intel?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.23.2/fetch-darwin-amd64.tar.gz"
      sha256 "19daae424500e5590d580a1da567e2b5885e7ea07b029bd5e5164811d48d02e9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.23.2/fetch-linux-arm64.tar.gz"
      sha256 "12c788d2dbce38a0b67e58f32eb30a707666293c24399ae15f6d6606941508ad"
    elsif Hardware::CPU.intel?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.23.2/fetch-linux-amd64.tar.gz"
      sha256 "4ad474c677db78ad4c8b2efc6bf127b40587ecf24297d95ee00e5b667d8c8217"
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
