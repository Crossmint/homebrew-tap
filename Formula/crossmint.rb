class Crossmint < Formula
  desc "Crossmint CLI"
  homepage "https://github.com/Crossmint/homebrew-tap"
  license "MIT"
  version "1.4.3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Crossmint/homebrew-tap/releases/download/v1.4.3/crossmint-macos-x64.zip"
      sha256 "09c9f9a0ae5b902271b4385bcbeefe1e0ef791631ea331f6751646de47c9a9d2"
    else
      url "https://github.com/Crossmint/homebrew-tap/releases/download/v1.4.3/crossmint-macos-arm64.zip"
      sha256 "55054a25d0396384ee277eda4a26f7431f1eb9cac11e47326d2b53d861d02c72"
    end
  end

  on_linux do
    url "https://github.com/Crossmint/homebrew-tap/releases/download/v1.4.3/crossmint-linux-x64.tar.gz"
    sha256 "dbade445ca7132c8cadc4821a6f156952763f742912d3e80503b64ac6b84d5e5"
  end

  def install
    if OS.mac?
      if Hardware::CPU.intel?
        bin.install "crossmint-macos-x64" => "crossmint"
      else
        bin.install "crossmint-macos-arm64" => "crossmint"
      end
    else
      bin.install "crossmint-linux-x64" => "crossmint"
    end
  end

  test do
    system "#{bin}/crossmint", "--version"
  end
end
