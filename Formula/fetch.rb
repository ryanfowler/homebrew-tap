class Fetch < Formula
  desc "Modern HTTP(S) client for the command line"
  homepage "https://github.com/ryanfowler/fetch"
  version "0.17.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.17.1/fetch-darwin-arm64.tar.gz"
      sha256 "a2ae9885be9bb38276a79cfe5c47ff373c4836704b36f5a006e26f422ab398c3"
    elsif Hardware::CPU.intel?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.17.1/fetch-darwin-amd64.tar.gz"
      sha256 "afb73138ce09ef9425b885de71d1e8967f84a1d37be6f8bc62ce46fc7c5a6bc5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.17.1/fetch-linux-arm64.tar.gz"
      sha256 "043260ecabbe7d100b2f83057c7e67e72996ddc2e6e9806f2318d173a218ffa6"
    elsif Hardware::CPU.intel?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.17.1/fetch-linux-amd64.tar.gz"
      sha256 "1bcd7a43afbbf7c7c4dc94fc15de7addd1f1dd58ac931d94e3d211def8ca29e6"
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
