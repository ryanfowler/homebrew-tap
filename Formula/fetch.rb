class Fetch < Formula
  desc "Modern HTTP(S) client for the command line"
  homepage "https://github.com/ryanfowler/fetch"
  version "0.23.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.23.1/fetch-darwin-arm64.tar.gz"
      sha256 "25ec1065dd53f3363b40f6342cc52790114189359ce535fc6a065068662748b9"
    elsif Hardware::CPU.intel?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.23.1/fetch-darwin-amd64.tar.gz"
      sha256 "282db6a1e632b821dca72856c5b55a3147e8c07fd6225fc1f86366f7c366b1c7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.23.1/fetch-linux-arm64.tar.gz"
      sha256 "2046db1845ae00ecab50631c17a0bdbf5d765b47a7250e34bc2780a4b0c699b5"
    elsif Hardware::CPU.intel?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.23.1/fetch-linux-amd64.tar.gz"
      sha256 "2422f1719986a3989113b0d62904a79422eed79e1adc95de1c4f9e3ff33a6576"
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
