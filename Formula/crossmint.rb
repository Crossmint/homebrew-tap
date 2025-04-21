class Crossmint < Formula
  desc "Crossmint CLI"
  homepage "https://github.com/Crossmint/homebrew-tap"
  license "MIT"
  version "0.3.0"
  
  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Crossmint/homebrew-tap/releases/download/v0.3.0/crossmint-macos-x64.zip"
      sha256 "f1ef351c1dbfab2f87c0970d01b3afe6652641701cea7b0b97cc90c379b7892b"
    else
      url "https://github.com/Crossmint/homebrew-tap/releases/download/v0.3.0/crossmint-macos-arm64.zip"
      sha256 "4d95cdeb12911954a071217dcda7eef9a3479dde1e657646ac3661d974bd8b30"
    end
  end
  
  on_linux do
    url "https://github.com/Crossmint/homebrew-tap/releases/download/v0.3.0/crossmint-linux-x64.tar.gz"
    sha256 "8ec75237037c7e6bd35c5548b539ed6a2833c50a54c103c2740a0ac9cdcb0c38"
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
