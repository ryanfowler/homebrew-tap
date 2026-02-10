class Fetch < Formula
  desc "Modern HTTP(S) client for the command line"
  homepage "https://github.com/ryanfowler/fetch"
  version "0.19.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.19.0/fetch-darwin-arm64.tar.gz"
      sha256 "751b1ff84d1fd9fa8e5b016bd6f07560bb82039aa967f3193de42521e837c15c"
    elsif Hardware::CPU.intel?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.19.0/fetch-darwin-amd64.tar.gz"
      sha256 "32ce953ce5dad2bc81df434fa57732675c293892114e8fa5b7322b56a465f980"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.19.0/fetch-linux-arm64.tar.gz"
      sha256 "9a0f58f5139e6f91a23a4a5886c6b995f22e8b1223199ed3d4ebb76c2cf199c7"
    elsif Hardware::CPU.intel?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.19.0/fetch-linux-amd64.tar.gz"
      sha256 "f5b3e859ab7d05547bb92561859b5b959b40bef0822c5128d3755d4cf2f39939"
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
