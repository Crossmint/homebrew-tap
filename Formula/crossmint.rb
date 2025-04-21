class Crossmint < Formula
  desc "Crossmint CLI"
  homepage "https://github.com/Crossmint/homebrew-tap"
  license "MIT"
  version "0.3.5"
  
  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Crossmint/homebrew-tap/releases/download/v0.3.5/crossmint-macos-x64.zip"
      sha256 "516a8d40adc5441c20fa58eaa3af9a107e3891b4bfadb8f05c4e2470e217c28e"
    else
      url "https://github.com/Crossmint/homebrew-tap/releases/download/v0.3.5/crossmint-macos-arm64.zip"
      sha256 "f5ad72f7b0bba2a5b1f18b3dc3f5d82fa63ec8fb8f8d571418ea3a8fa0d5a75e"
    end
  end
  
  on_linux do
    url "https://github.com/Crossmint/homebrew-tap/releases/download/v0.3.5/crossmint-linux-x64.tar.gz"
    sha256 "44e8b348b16e83b8350101b2c20f5db3c4796a9dcf11516b4d9b50c88da58783"
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
