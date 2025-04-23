class Crossmint < Formula
  desc "Crossmint CLI"
  homepage "https://github.com/Crossmint/homebrew-tap"
  license "MIT"
  version "1.0.0"
  
  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Crossmint/homebrew-tap/releases/download/v1.0.0/crossmint-macos-x64.zip"
      sha256 "bce716ca09cd95180b4f694bb9923dc4391086ea4a7ba7e74a7964acd1fb470b"
    else
      url "https://github.com/Crossmint/homebrew-tap/releases/download/v1.0.0/crossmint-macos-arm64.zip"
      sha256 "7d4b5b10074bc70b67ee97272b9bf4c154ea7b01fec19eb48db07493bd0a0908"
    end
  end
  
  on_linux do
    url "https://github.com/Crossmint/homebrew-tap/releases/download/v1.0.0/crossmint-linux-x64.tar.gz"
    sha256 "8353844d403bb02678b58213f1c8ce7e88bf70afaa096ea3f0f6e90fad235a10"
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
