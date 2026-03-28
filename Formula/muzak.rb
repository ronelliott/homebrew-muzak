class Muzak < Formula
  desc "Minimalist terminal-based music player"
  homepage "https://github.com/ronelliott/muzak"
  version "0.1.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ronelliott/muzak/releases/download/v0.1.10/muzak-darwin-arm64.tar.gz"
      sha256 "ff94506efca21ba85345a925d7b55068ce4aad478e5480fb38e21cf19667ed49"
    end

    on_intel do
      url "https://github.com/ronelliott/muzak/releases/download/v0.1.10/muzak-darwin-amd64.tar.gz"
      sha256 "31e0464bbf1e0b7d71cfe6d8d49a9d0f730f66e05c94c46264d8c915861cf3fa"
    end
  end

  on_linux do
    depends_on "alsa-lib"

    on_intel do
      url "https://github.com/ronelliott/muzak/releases/download/v0.1.10/muzak-linux-amd64.tar.gz"
      sha256 "1bbc51f8a64001c8b6ec0d9d6f58c87a8d4d6940b6581b120670a4aa249b83e8"
    end

    on_arm do
      url "https://github.com/ronelliott/muzak/releases/download/v0.1.10/muzak-linux-arm64.tar.gz"
      sha256 "b1187908f0ae5f8674c83781f922736d4371bf3dcb4dae8e906910ee033e5307"
    end
  end

  def install
    bin.install "muzak"
    chmod 0555, bin/"muzak"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/muzak --version")
  end
end
