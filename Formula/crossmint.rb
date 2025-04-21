class Crossmint < Formula
  desc "Crossmint CLI"
  homepage "https://github.com/Crossmint/homebrew-tap"
  license "MIT"
  version "0.3.3"
  
  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Crossmint/homebrew-tap/releases/download/v0.3.3/crossmint-macos-x64.zip"
      sha256 "f0060681983f4c308107794b1ded5a55a399e4451c2209dfcf1c4cf373bf638d"
    else
      url "https://github.com/Crossmint/homebrew-tap/releases/download/v0.3.3/crossmint-macos-arm64.zip"
      sha256 "cbd99f24c64ac27ba99ce072a801682c1b540cb2fbae65c4948c238af73c3584"
    end
  end
  
  on_linux do
    url "https://github.com/Crossmint/homebrew-tap/releases/download/v0.3.3/crossmint-linux-x64.tar.gz"
    sha256 "791212bfcdce1e2837c65ee3d6ab34b1df5b1a0a569478a5770daf90b12baf39"
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
