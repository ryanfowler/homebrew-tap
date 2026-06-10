class Fetch < Formula
  desc "Modern HTTP(S) client for the command line"
  homepage "https://github.com/ryanfowler/fetch"
  version "0.24.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.24.12/fetch-darwin-arm64.tar.gz"
      sha256 "0a0bc6c6c33a53b28cb04c60175834ee5c6d54221a66f8a6aaaf34e09d7155e5"
    elsif Hardware::CPU.intel?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.24.12/fetch-darwin-amd64.tar.gz"
      sha256 "8d580412e07297068f73488043ae33ab47280ae35d4221cd628a1c6a8d2546b2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.24.12/fetch-linux-arm64.tar.gz"
      sha256 "6b30a60c626200d8affaddde625b51c8da82f02d6fff8b8e55c553ee1e92d7f2"
    elsif Hardware::CPU.intel?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.24.12/fetch-linux-amd64.tar.gz"
      sha256 "6818ad3bc60721506621485c47bab0b2a75824f1161f9e53a579616424275ed7"
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
