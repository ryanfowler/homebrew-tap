class Fetch < Formula
  desc "Modern HTTP(S) client for the command line"
  homepage "https://github.com/ryanfowler/fetch"
  version "0.27.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.27.0/fetch-darwin-arm64.tar.gz"
      sha256 "b562b2778d0594bd238671ce5585fdac0db85b9bcfbf90154c3a9113523297f0"
    elsif Hardware::CPU.intel?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.27.0/fetch-darwin-amd64.tar.gz"
      sha256 "153e3d84a6927a1c7e75e2079f46b2ccc360179eece177e902a4d60e0c0aab50"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.27.0/fetch-linux-arm64.tar.gz"
      sha256 "2f1c2d9915c97d7686ec05091f19f68c0a9b31ade366ab1de08eb02814bd413e"
    elsif Hardware::CPU.intel?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.27.0/fetch-linux-amd64.tar.gz"
      sha256 "bcdc691dd78e35577566243cbc46e191d331d930cec34b0b3d95372041fc9504"
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
