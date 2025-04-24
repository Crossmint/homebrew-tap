class Crossmint < Formula
  desc "Crossmint CLI"
  homepage "https://github.com/Crossmint/homebrew-tap"
  license "MIT"
  version "1.1.0"
  
  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Crossmint/homebrew-tap/releases/download/v1.1.0/crossmint-macos-x64.zip"
      sha256 "896b2388727b148071ecedce8b83d22a5c21bd16e63e47752312d7563dd3b435"
    else
      url "https://github.com/Crossmint/homebrew-tap/releases/download/v1.1.0/crossmint-macos-arm64.zip"
      sha256 "9a6adc019a626be21ae83f0157600d59b4d5a696a758f155943b34312f814e43"
    end
  end
  
  on_linux do
    url "https://github.com/Crossmint/homebrew-tap/releases/download/v1.1.0/crossmint-linux-x64.tar.gz"
    sha256 "7efac665e487d588fdbb6c63fc63e8fdf5a0929ef41530d2d6f4ab27b640f75c"
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
