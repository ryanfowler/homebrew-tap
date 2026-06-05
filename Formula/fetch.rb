class Fetch < Formula
  desc "Modern HTTP(S) client for the command line"
  homepage "https://github.com/ryanfowler/fetch"
  version "0.24.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.24.10/fetch-darwin-arm64.tar.gz"
      sha256 "2b58380f9f5d53566aa7d2f12815f22707ae66fd3d97d9dda7dfafe48fbd0815"
    elsif Hardware::CPU.intel?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.24.10/fetch-darwin-amd64.tar.gz"
      sha256 "ad2613484b984a90770ddfc65076c5c2a3af87343b2d3d20270f04d84a00266c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.24.10/fetch-linux-arm64.tar.gz"
      sha256 "fb9022fea9b6e3dd86f0cd01b3a6940aa0585af2f772e6406d2949e497a87369"
    elsif Hardware::CPU.intel?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.24.10/fetch-linux-amd64.tar.gz"
      sha256 "88c87d44295e1b41664823942120573b1dc4f8a599178f211392642b4e115e9f"
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
