class Fetch < Formula
  desc "Modern HTTP(S) client for the command line"
  homepage "https://github.com/ryanfowler/fetch"
  version "0.21.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.21.0/fetch-darwin-arm64.tar.gz"
      sha256 "3ebb04e7c53b90419e7c965f450709d9e9d34a2064f61339ebe33829a5aa6d55"
    elsif Hardware::CPU.intel?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.21.0/fetch-darwin-amd64.tar.gz"
      sha256 "eddb84b644ca75388137fbba3ec368d28f49d7975d67b915bb7e416d513c38b2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.21.0/fetch-linux-arm64.tar.gz"
      sha256 "1992da18e4e3202f134f7ff2a15ca4b3bcec45f4fb5ae3d31c055f1e19d3766c"
    elsif Hardware::CPU.intel?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.21.0/fetch-linux-amd64.tar.gz"
      sha256 "8c0740ff8c58ba6d3caa7b87c93b3bed5f7c5940837c4d3fb042f9f7bd3af9b9"
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
