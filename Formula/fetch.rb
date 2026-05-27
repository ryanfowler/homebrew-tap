class Fetch < Formula
  desc "Modern HTTP(S) client for the command line"
  homepage "https://github.com/ryanfowler/fetch"
  version "0.24.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.24.3/fetch-darwin-arm64.tar.gz"
      sha256 "8f0a150c7641d9d843f42f6ff20074f13bfc3e9328422906943d8c89fa8b6124"
    elsif Hardware::CPU.intel?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.24.3/fetch-darwin-amd64.tar.gz"
      sha256 "c7fcd50b54da4585beecc304a4ab188fba79c328d10d7230d1114c3802392efb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.24.3/fetch-linux-arm64.tar.gz"
      sha256 "62b5e9d65337eeb0935b7d71997686c32bc79cf00fa619f53318fad79ed29c4f"
    elsif Hardware::CPU.intel?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.24.3/fetch-linux-amd64.tar.gz"
      sha256 "d72d915c4a9bab04dd2c127e7baaf551f4cda0b15b3cb91df64b6f0a903f7f4c"
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
