class Fetch < Formula
  desc "Modern HTTP(S) client for the command line"
  homepage "https://github.com/ryanfowler/fetch"
  version "0.22.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.22.0/fetch-darwin-arm64.tar.gz"
      sha256 "3219eed150538854927246ae72180fcd025b532b6ac6c4f8704674a266750472"
    elsif Hardware::CPU.intel?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.22.0/fetch-darwin-amd64.tar.gz"
      sha256 "0057069d228a912cd2c32113dfaa87204703e9ee6669f2f2202bdc4d67b0322f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.22.0/fetch-linux-arm64.tar.gz"
      sha256 "ebc91fd010dbc3b59408ef2c797c6f10762d0a56c5258e6be8c0583f03970ed5"
    elsif Hardware::CPU.intel?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.22.0/fetch-linux-amd64.tar.gz"
      sha256 "fd603b669a90daeeb84fc6a863743f3e8d55eecaeec7348617f28f705e652a7d"
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
