class Crossmint < Formula
  desc "Crossmint CLI"
  homepage "https://github.com/Crossmint/homebrew-tap"
  license "MIT"
  
  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Crossmint/homebrew-tap/releases/download/v0.0.29/crossmint-macos-x64.tar.gz"
      sha256 "4b1a79244be0212ba06ee950a1ff6ec066a5015b555076629da826e1296486f5"
    else
      url "https://github.com/Crossmint/homebrew-tap/releases/download/v0.0.29/crossmint-macos-arm64.tar.gz"
      sha256 "10cb33eaaf4f74d4295f57b563b831158538f85fdc4361379a58dd85322a8113"
    end
  end
  
  on_linux do
    url "https://github.com/Crossmint/homebrew-tap/releases/download/v0.0.29/crossmint-linux-x64.tar.gz"
    sha256 "ece125c4a9042556eb03f47a2ee922c119bddd50126739745c4143ec918c8011"
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
