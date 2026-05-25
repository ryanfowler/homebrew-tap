class Fetch < Formula
  desc "Modern HTTP(S) client for the command line"
  homepage "https://github.com/ryanfowler/fetch"
  version "0.24.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.24.2/fetch-darwin-arm64.tar.gz"
      sha256 "61bdbaf2d661644e5b7ff7f9bc260a5b4668668837521d0cccf1065a931ded6a"
    elsif Hardware::CPU.intel?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.24.2/fetch-darwin-amd64.tar.gz"
      sha256 "ecc53054c54416666a05a526dfdd86a7fc24781252a523a7ac1f3caec3416026"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.24.2/fetch-linux-arm64.tar.gz"
      sha256 "af3d8e904091b8e9ad4e5c9f5673108a2bc5ac30a1980f7b693c139de6a630eb"
    elsif Hardware::CPU.intel?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.24.2/fetch-linux-amd64.tar.gz"
      sha256 "dbf9d932d730316d8985bcb82e311c97b72762c12c18e2dd2bfc2e17f11f2169"
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
