class Crossmint < Formula
  desc "Crossmint CLI"
  homepage "https://github.com/Crossmint/homebrew-tap"
  license "MIT"
  version "1.1.7"
  
  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Crossmint/homebrew-tap/releases/download/v1.1.7/crossmint-macos-x64.zip"
      sha256 "25f0466912f557dcd4bc13795b667ced877cfe6469cf65520a8de3bb726e824e"
    else
      url "https://github.com/Crossmint/homebrew-tap/releases/download/v1.1.7/crossmint-macos-arm64.zip"
      sha256 "d8c50bb9db78d3ea3bfc459d4f9bf44eafab5c20355b4bca62a05676393960af"
    end
  end
  
  on_linux do
    url "https://github.com/Crossmint/homebrew-tap/releases/download/v1.1.7/crossmint-linux-x64.tar.gz"
    sha256 "9627a8f345566498fbf8d9b9e6f1056e4adc011726faacdaf35132bf1282539a"
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
