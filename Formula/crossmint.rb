class Crossmint < Formula
  desc "Crossmint CLI"
  homepage "https://github.com/Paella-Labs/crossbit-main"
  license "MIT"
  
  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Paella-Labs/crossbit-main/releases/download/v/crossmint-macos-x64.tar.gz"
      sha256 "f1339f35d7c17a6ccec7f02524e4881d3b49e5d6fd89b4a76d6f2410aac1c282"
    else
      url "https://github.com/Paella-Labs/crossbit-main/releases/download/v/crossmint-macos-arm64.tar.gz"
      sha256 "beb3b7a69d7774270c908173d81e254c510f580a215ab4f11e50b4b71861b462"
    end
  end
  
  on_linux do
    url "https://github.com/Paella-Labs/crossbit-main/releases/download/v/crossmint-linux-x64.tar.gz"
    sha256 "2e734b45fa12e402273d2a38b9be000fe6ca1dd64693d44e922ba31376f346e3"
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
