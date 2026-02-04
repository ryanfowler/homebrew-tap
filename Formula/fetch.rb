class Fetch < Formula
  desc "Modern HTTP(S) client for the command line"
  homepage "https://github.com/ryanfowler/fetch"
  version "0.17.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.17.2/fetch-darwin-arm64.tar.gz"
      sha256 "33db7dac2ca851a78765f15654a8180af95e672f6d6d3f2af5833e6880dba02c"
    elsif Hardware::CPU.intel?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.17.2/fetch-darwin-amd64.tar.gz"
      sha256 "54e4b5f5bf2a9cc0075c1223d7e52be935fa2efb1c4c1796df975c158d369cbe"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.17.2/fetch-linux-arm64.tar.gz"
      sha256 "b86fef2a5c75f588da897c5b84807bb0856ebaef0797da4749fc91ddd0fa3f9c"
    elsif Hardware::CPU.intel?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.17.2/fetch-linux-amd64.tar.gz"
      sha256 "19c442c7ca759d8ac945ebc9fb089bc2eafbf01a9b925bbbef7882fc3e2c2356"
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
