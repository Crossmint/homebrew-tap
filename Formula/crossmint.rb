class Crossmint < Formula
  desc "Crossmint CLI"
  homepage "https://github.com/Crossmint/homebrew-tap"
  license "MIT"
  
  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Crossmint/homebrew-tap/releases/download/v0.2.0/crossmint-macos-x64.tar.gz"
      sha256 "8a58f6d694ee9a48ad5537bea6bfc126c94a28d73db7cefd0b0330941fc93d01"
    else
      url "https://github.com/Crossmint/homebrew-tap/releases/download/v0.2.0/crossmint-macos-arm64.tar.gz"
      sha256 "61d20efc56b3e2665dbeb33d29fd3c023b2ecf7d731e4a35e56f0c49deb07f14"
    end
  end
  
  on_linux do
    url "https://github.com/Crossmint/homebrew-tap/releases/download/v0.2.0/crossmint-linux-x64.tar.gz"
    sha256 "c54a65393d45d26e726a8b57ce8bc698f8458deea4fc66b9e7460870a7b94d5e"
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
