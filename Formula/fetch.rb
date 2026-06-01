class Fetch < Formula
  desc "Modern HTTP(S) client for the command line"
  homepage "https://github.com/ryanfowler/fetch"
  version "0.24.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.24.8/fetch-darwin-arm64.tar.gz"
      sha256 "0ad40bc35fcf83ad4273c3579d684eb05963f45b1270683e30aaf662c73f2354"
    elsif Hardware::CPU.intel?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.24.8/fetch-darwin-amd64.tar.gz"
      sha256 "d5a8ac75a5048e4400a599e80810c97848f50eee8ec5a0c88314726cfa816100"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.24.8/fetch-linux-arm64.tar.gz"
      sha256 "cb4a7d2779309750bef087a439f6c8d4023ba285c709562c18f1a5cc7d9cf1ac"
    elsif Hardware::CPU.intel?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.24.8/fetch-linux-amd64.tar.gz"
      sha256 "4ac8d3411675df03948dfa830f093b4043a3eba6b698dc5adc8c321b38baa78e"
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
