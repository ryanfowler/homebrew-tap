class Fetch < Formula
  desc "Modern HTTP(S) client for the command line"
  homepage "https://github.com/ryanfowler/fetch"
  version "0.20.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.20.0/fetch-darwin-arm64.tar.gz"
      sha256 "43a4a6140951e809d6563806066c28ecb213dc70a754ed9a6a5f625b64694d84"
    elsif Hardware::CPU.intel?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.20.0/fetch-darwin-amd64.tar.gz"
      sha256 "ce7183815f297125960b0637c3027dacb1098510de78042f3fcc123dbaac2ad2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.20.0/fetch-linux-arm64.tar.gz"
      sha256 "28fe68c941f9083440ba6fa04586ecf601e4bf558be253b08557224dd0d798cb"
    elsif Hardware::CPU.intel?
      url "https://github.com/ryanfowler/homebrew-tap/releases/download/fetch-v0.20.0/fetch-linux-amd64.tar.gz"
      sha256 "b3543930505b190f72cfaaf7f6a7869b161258e2b53918f71f70faa11ca374ab"
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
