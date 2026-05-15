class Fetch < Formula
  desc "Modern HTTP(S) client for the command line"
  homepage "https://github.com/ryanfowler/fetch"
  version "0.23.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.23.3/fetch-darwin-arm64.tar.gz"
      sha256 "efa22b05e42ea1bc2a29bec8480c3d96e31205a1d5ee2121a0f0946755c9863c"
    elsif Hardware::CPU.intel?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.23.3/fetch-darwin-amd64.tar.gz"
      sha256 "78ed9d251cea854341c9e41c58c999a9cffcf2cdbd5c75a10501852df5a94961"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.23.3/fetch-linux-arm64.tar.gz"
      sha256 "3e7e317b71e35c5fa5fdd57fe79edf1fb09535ea4686a7663dc3e172b1a72baf"
    elsif Hardware::CPU.intel?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.23.3/fetch-linux-amd64.tar.gz"
      sha256 "5be4e8ed42e7e99b2bb79dfbc69e2be6c8fa66cb3b06b5e971be3f4f3d9d854b"
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
