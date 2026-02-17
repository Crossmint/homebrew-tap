class Crossmint < Formula
  desc "Crossmint CLI"
  homepage "https://github.com/Crossmint/homebrew-tap"
  license "MIT"
  version "1.2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Crossmint/homebrew-tap/releases/download/v1.2.0/crossmint-macos-x64.zip"
      sha256 "f4f1750e7a6d03b0a914b01d3dc89470b9b88a755c5f2ea8806686cb0ca2d275"
    else
      url "https://github.com/Crossmint/homebrew-tap/releases/download/v1.2.0/crossmint-macos-arm64.zip"
      sha256 "5f48d3e138b3979ba10d9e8fdac5d99520c899e33e3b5d069de70b76a54aad9f"
    end
  end

  on_linux do
    url "https://github.com/Crossmint/homebrew-tap/releases/download/v1.2.0/crossmint-linux-x64.tar.gz"
    sha256 "6c5ffbd2a9905bc878266eb57fd1aec9ee9ea85d34d7f2dc9e999a390b5d8c38"
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
