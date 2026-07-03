class Fetch < Formula
  desc "Modern HTTP(S) client for the command line"
  homepage "https://github.com/ryanfowler/fetch"
  version "0.25.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.25.1/fetch-darwin-arm64.tar.gz"
      sha256 "2fd278b939e9397a60b70b3a1e6bac6c57046d64adb2f62314500a59ed2e2781"
    elsif Hardware::CPU.intel?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.25.1/fetch-darwin-amd64.tar.gz"
      sha256 "38e2081c2028cc3aa5f3765ffc478678e10104d8aaa48342cff805a6dec0833e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.25.1/fetch-linux-arm64.tar.gz"
      sha256 "318f0279202640bb032b8bb07be334df14f24846ff31bba251904b1e42025e5c"
    elsif Hardware::CPU.intel?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.25.1/fetch-linux-amd64.tar.gz"
      sha256 "a48febab210cfed90a611c1e30775c2631c4f785f2d000ae7ad8e1399d201a91"
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
