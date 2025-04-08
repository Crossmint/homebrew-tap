class Crossmint < Formula
  desc "Crossmint CLI"
  homepage "https://github.com//Crossmint/homebrew-tap"
  license "MIT"
  
  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com//Crossmint/homebrew-tap/releases/download/v0.0.14/crossmint-macos-x64.tar.gz"
      sha256 "a390f787e38b298e82a6f6860ad40fd4fef3a09973aeda8fb972c54a632f169c"
    else
      url "https://github.com//Crossmint/homebrew-tap/releases/download/v0.0.14/crossmint-macos-arm64.tar.gz"
      sha256 "ac86985df5d5cebeaadc877ec8216068ed625520d263631cac85a6879cae6743"
    end
  end
  
  on_linux do
    url "https://github.com//Crossmint/homebrew-tap/releases/download/v0.0.14/crossmint-linux-x64.tar.gz"
    sha256 "a1d9700dc1cbfe898204f225e94b65f11092fb3aeccacf282d232cc4bc19658d"
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
