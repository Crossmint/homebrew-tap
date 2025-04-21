class Crossmint < Formula
  desc "Crossmint CLI"
  homepage "https://github.com/Crossmint/homebrew-tap"
  license "MIT"
  version "0.3.1"
  
  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Crossmint/homebrew-tap/releases/download/v0.3.1/crossmint-macos-x64.zip"
      sha256 "cc21d625f16fa68d550c5305f51431e031ce286411cae2920c62343f4ae62677"
    else
      url "https://github.com/Crossmint/homebrew-tap/releases/download/v0.3.1/crossmint-macos-arm64.zip"
      sha256 "71a21b617ad73f845dc9385e898e273585563e67214cab81498699631e6fb6e4"
    end
  end
  
  on_linux do
    url "https://github.com/Crossmint/homebrew-tap/releases/download/v0.3.1/crossmint-linux-x64.tar.gz"
    sha256 "10eade01f42e813189d668cf833751afef2cc8aa95b864ca7bb84b972fb332ae"
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
