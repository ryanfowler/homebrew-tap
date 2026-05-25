class Fetch < Formula
  desc "Modern HTTP(S) client for the command line"
  homepage "https://github.com/ryanfowler/fetch"
  version "0.24.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.24.1/fetch-darwin-arm64.tar.gz"
      sha256 "3dddadcbe5409b6fa76d15520f4b19e5d4290463757f315d23f0c02a1eec781f"
    elsif Hardware::CPU.intel?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.24.1/fetch-darwin-amd64.tar.gz"
      sha256 "88fa823888a4b5232423b147c367c3a943fd85ac8fa1300727e6490a303baa9a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.24.1/fetch-linux-arm64.tar.gz"
      sha256 "bbaaad959f7df5029480a4a607f2ebe18a5b0d31b17289eeae08ccd3269c5846"
    elsif Hardware::CPU.intel?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.24.1/fetch-linux-amd64.tar.gz"
      sha256 "0a897aa9d1e5a79e2589f2f0cd0256de660b379120096b009ae8429012e7bc74"
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
