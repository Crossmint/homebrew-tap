class Crossmint < Formula
  desc "Crossmint CLI"
  homepage "https://github.com/Crossmint/homebrew-tap"
  license "MIT"
  
  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Crossmint/homebrew-tap/releases/download/v0.2.1/crossmint-macos-x64.tar.gz"
      sha256 "82e1a8053d459aa0b7421ce1987d7f0bbc3048a8f68973354788ea6ae4c52010"
    else
      url "https://github.com/Crossmint/homebrew-tap/releases/download/v0.2.1/crossmint-macos-arm64.tar.gz"
      sha256 "90928608c3ba2c0937b44a675a817527e4ed0011c3e9ff6726bbb7946953481f"
    end
  end
  
  on_linux do
    url "https://github.com/Crossmint/homebrew-tap/releases/download/v0.2.1/crossmint-linux-x64.tar.gz"
    sha256 "2637e689455cb1a94648d915bf96e916fb17d9350d1d08fe556f1d6687f755b5"
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
