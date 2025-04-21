class Crossmint < Formula
  desc "Crossmint CLI"
  homepage "https://github.com/Crossmint/homebrew-tap"
  license "MIT"
  version "0.3.4"
  
  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Crossmint/homebrew-tap/releases/download/v0.3.4/crossmint-macos-x64.zip"
      sha256 "8cc852d75f181a88894b2835fd68068aa749bf7f07e471d41d4be92a7e487a8b"
    else
      url "https://github.com/Crossmint/homebrew-tap/releases/download/v0.3.4/crossmint-macos-arm64.zip"
      sha256 "4aa83c40ef4906845c305518ff32768851e9db22bd6012322bd6e5933b0164ad"
    end
  end
  
  on_linux do
    url "https://github.com/Crossmint/homebrew-tap/releases/download/v0.3.4/crossmint-linux-x64.tar.gz"
    sha256 "383e10903ae1f2ae370f678a1e4b3c152c3eac3df62eb5d1ac1aec346f3b99c2"
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
