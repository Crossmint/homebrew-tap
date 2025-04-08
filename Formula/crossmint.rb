class Crossmint < Formula
  desc "Crossmint CLI"
  homepage "https://github.com/Crossmint/homebrew-tap"
  license "MIT"
  
  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Crossmint/homebrew-tap/releases/download/v0.0.21/crossmint-macos-x64.tar.gz"
      sha256 "f3a3ccc4888154410aff401f54fb88af8e2ddfbb79aad232f6c57af5d699ed21"
    else
      url "https://github.com/Crossmint/homebrew-tap/releases/download/v0.0.21/crossmint-macos-arm64.tar.gz"
      sha256 "d2c27a6e93baa730944c07c1090c8335ab72a4227f217d8c3f51b8ac65648066"
    end
  end
  
  on_linux do
    url "https://github.com/Crossmint/homebrew-tap/releases/download/v0.0.21/crossmint-linux-x64.tar.gz"
    sha256 "91aede38ca85a882f3c0bf68ce9106ab17362bf952eb3b6f182204a565c21987"
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
