class Fetch < Formula
  desc "Modern HTTP(S) client for the command line"
  homepage "https://github.com/ryanfowler/fetch"
  version "0.27.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.27.1/fetch-darwin-arm64.tar.gz"
      sha256 "561e0a5e8cad8a02a1cfd6aa3cb82419cf2cecf1dae6edce4d9f623c3e06f2c1"
    elsif Hardware::CPU.intel?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.27.1/fetch-darwin-amd64.tar.gz"
      sha256 "fb68a5287c3d6c50d49cad30754c6c2402342196504dab3b5b26eb313fd89590"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.27.1/fetch-linux-arm64.tar.gz"
      sha256 "417c9b4735620990978bc11d9eddcc63cad8843a9cdc5bd9eab7ba019a10338c"
    elsif Hardware::CPU.intel?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.27.1/fetch-linux-amd64.tar.gz"
      sha256 "88d8c14ebc526d78e5cc464c676f7ddd504684d4d4317b5fc31a20913321fdb0"
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
