class Crossmint < Formula
  desc "Crossmint CLI"
  homepage "https://github.com/Crossmint/homebrew-tap"
  license "MIT"
  
  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Crossmint/homebrew-tap/releases/download/v0.0.20/crossmint-macos-x64.tar.gz"
      sha256 "0a0cd171cbda88d8c4d64b41cb914db402d6221b7621f3cf8ecb3b9b5e539495"
    else
      url "https://github.com/Crossmint/homebrew-tap/releases/download/v0.0.20/crossmint-macos-arm64.tar.gz"
      sha256 "7542e73ae5b44f484b2edc5af81390ec7a719200f20b9dbffa3a52db1423b631"
    end
  end
  
  on_linux do
    url "https://github.com/Crossmint/homebrew-tap/releases/download/v0.0.20/crossmint-linux-x64.tar.gz"
    sha256 "6d43e37c7f3e9a1117781df1a1771631116539c0eab802849f3d0c186aabef5d"
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
