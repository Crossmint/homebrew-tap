class Crossmint < Formula
  desc "Crossmint CLI"
  homepage "https://github.com/Crossmint/homebrew-tap"
  license "MIT"
  version "0.3.7"
  
  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Crossmint/homebrew-tap/releases/download/v0.3.7/crossmint-macos-x64.zip"
      sha256 "468728341e7ef42994407660241bf363a1178498049352822f0e44d423dd5db2"
    else
      url "https://github.com/Crossmint/homebrew-tap/releases/download/v0.3.7/crossmint-macos-arm64.zip"
      sha256 "63585d8b08649fc6dce03bc2022f0b2b8097ea0e7f51cf51156409dd26d000d7"
    end
  end
  
  on_linux do
    url "https://github.com/Crossmint/homebrew-tap/releases/download/v0.3.7/crossmint-linux-x64.tar.gz"
    sha256 "3f1753a4a5021ac4745b6df442cebf540c55e80db2f742e9e2cbe9d1a155c8aa"
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
