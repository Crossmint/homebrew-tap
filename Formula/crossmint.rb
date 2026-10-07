class Crossmint < Formula
  desc "Crossmint CLI"
  homepage "https://github.com/Crossmint/homebrew-tap"
  license "MIT"
  version "1.4.2"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Crossmint/homebrew-tap/releases/download/v1.4.2/crossmint-macos-x64.zip"
      sha256 "8a157f08793772a509fb511476b23460db76dea9b962722b45bb30c30b506136"
    else
      url "https://github.com/Crossmint/homebrew-tap/releases/download/v1.4.2/crossmint-macos-arm64.zip"
      sha256 "fc8a42d956aa61f21796b72db0a087b77e7eb78546aa8229bbd1c4357958cfe4"
    end
  end

  on_linux do
    url "https://github.com/Crossmint/homebrew-tap/releases/download/v1.4.2/crossmint-linux-x64.tar.gz"
    sha256 "e3dd47b99cc2e2b86f29a5c26c3e3eee026712979d7715079c58da1e1f72d77d"
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
