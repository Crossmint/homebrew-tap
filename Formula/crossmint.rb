class Crossmint < Formula
  desc "Crossmint CLI"
  homepage "https://github.com/Paella-Labs/crossbit-main"
  license "MIT"
  
  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Paella-Labs/crossbit-main/releases/download/v0.0.11/crossmint-macos-x64.tar.gz"
      sha256 "9903861572875c32b2ef603db5f3af900d40fd69993c7cdeea2f9f1d9189afab"
    else
      url "https://github.com/Paella-Labs/crossbit-main/releases/download/v0.0.11/crossmint-macos-arm64.tar.gz"
      sha256 "792211b081296d0a23029a63bcd7ee64d5b7a014d88fd7843e30bc7634d8c6c1"
    end
  end
  
  on_linux do
    url "https://github.com/Paella-Labs/crossbit-main/releases/download/v0.0.11/crossmint-linux-x64.tar.gz"
    sha256 "a925780b14ab94c9bb16f522f42eec93cad95500c393401010ac0dd6dcaf6128"
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
