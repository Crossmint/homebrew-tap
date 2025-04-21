class Crossmint < Formula
  desc "Crossmint CLI"
  homepage "https://github.com/Crossmint/homebrew-tap"
  license "MIT"
  version "0.3.6"
  
  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Crossmint/homebrew-tap/releases/download/v0.3.6/crossmint-macos-x64.zip"
      sha256 "0dbf40cc48fa859957230c7cfdd78c1b35cdf8d22eb2632eca9dc659fea49ebd"
    else
      url "https://github.com/Crossmint/homebrew-tap/releases/download/v0.3.6/crossmint-macos-arm64.zip"
      sha256 "80f86ddf97962b71cbf2e3105a3921bc35f3aee07e300fbfa3642c3f1578bfd3"
    end
  end
  
  on_linux do
    url "https://github.com/Crossmint/homebrew-tap/releases/download/v0.3.6/crossmint-linux-x64.tar.gz"
    sha256 "b1d9017358ad5a3ca2013c2d4d108998687caa4596b2d5bdbcd0dab7bfe2b1e3"
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
