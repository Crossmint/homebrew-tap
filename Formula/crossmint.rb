class Crossmint < Formula
  desc "Crossmint CLI"
  homepage "https://github.com/Paella-Labs/crossbit-main"
  license "MIT"
  
  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Paella-Labs/crossbit-main/releases/download/v0.0.13/crossmint-macos-x64.tar.gz"
      sha256 "5e970a173757196801edca451790476a1f86b7bbbb7b3d0c79567fb94a9acfc3"
    else
      url "https://github.com/Paella-Labs/crossbit-main/releases/download/v0.0.13/crossmint-macos-arm64.tar.gz"
      sha256 "08d235642c3154bd6bd74cd07f591e84c57e946878cb4c7fca53e77afbeb87e4"
    end
  end
  
  on_linux do
    url "https://github.com/Paella-Labs/crossbit-main/releases/download/v0.0.13/crossmint-linux-x64.tar.gz"
    sha256 "5e3ac891c78bee0b274527e9c0689bb1f1a821af31e9ea6b8b899aaeae382a85"
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
