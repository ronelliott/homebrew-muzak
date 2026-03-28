class Muzak < Formula
  desc "Minimalist terminal-based music player"
  homepage "https://github.com/ronelliott/muzak"
  version "0.1.3"
  license "MIT"

  on_arm do
    url "https://github.com/ronelliott/muzak/releases/download/v0.1.3/muzak-darwin-arm64"
    sha256 "6f02cd1febe59d6afd3931ee6d9d1d24b27450fb265aa936a5bfe7e2cfc2b86e"
  end

  on_intel do
    url "https://github.com/ronelliott/muzak/releases/download/v0.1.3/muzak-darwin-amd64"
    sha256 "dc4f4a67f3605bfd1d61f1eb4c9fc8a1eb2f74bf0c0caf5678fdbe955a1247d2"
  end

  def install
    binary = Hardware::CPU.arm? ? "muzak-darwin-arm64" : "muzak-darwin-amd64"
    bin.install binary => "muzak"
    chmod 0555, bin/"muzak"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/muzak --version")
  end
end
