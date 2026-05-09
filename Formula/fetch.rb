class Fetch < Formula
  desc "Modern HTTP(S) client for the command line"
  homepage "https://github.com/ryanfowler/fetch"
  version "0.22.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.22.1/fetch-darwin-arm64.tar.gz"
      sha256 "1d66ce5b5f2c45c71b32ba373b6cfdae052c0218e6abf11a79e913da3edbd1f7"
    elsif Hardware::CPU.intel?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.22.1/fetch-darwin-amd64.tar.gz"
      sha256 "e52da55a87b3c2d1f0ca4c93e3738b00804c078796f83e04e46d78f5fe4ab3ad"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.22.1/fetch-linux-arm64.tar.gz"
      sha256 "05e229e8384e6aa035364fea6020b3bc2c77c88fe59b17ddc62d1135c1a109f7"
    elsif Hardware::CPU.intel?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.22.1/fetch-linux-amd64.tar.gz"
      sha256 "e816bf724506037fd836cb6858d5e7711acd6dbce07def88afb4073af8a989ca"
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
