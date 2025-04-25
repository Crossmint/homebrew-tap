class Crossmint < Formula
  desc "Crossmint CLI"
  homepage "https://github.com/Crossmint/homebrew-tap"
  license "MIT"
  version "1.1.1"
  
  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Crossmint/homebrew-tap/releases/download/v1.1.1/crossmint-macos-x64.zip"
      sha256 "ed03bfbfdddbf2c03440da88f6a4a6093f4c9b1b385b99b6a86a6950ab514ac8"
    else
      url "https://github.com/Crossmint/homebrew-tap/releases/download/v1.1.1/crossmint-macos-arm64.zip"
      sha256 "f08e7157ac7ec1d5b8b2097db9d6d947094592a1cdfef7cdb9040ede0ac91b6f"
    end
  end
  
  on_linux do
    url "https://github.com/Crossmint/homebrew-tap/releases/download/v1.1.1/crossmint-linux-x64.tar.gz"
    sha256 "f251733bed277e2d881297900959cae22bb781fe28a27b16ddd5a2b5fc94b236"
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
