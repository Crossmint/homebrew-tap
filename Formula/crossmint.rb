class Crossmint < Formula
  desc "Crossmint CLI"
  homepage "https://github.com/Crossmint/homebrew-tap"
  license "MIT"
  
  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Crossmint/homebrew-tap/releases/download/v0.1.0/crossmint-macos-x64.tar.gz"
      sha256 "2da714d8ee175f655bfe48877173df4123f7eb36fad06890023c74d0c118c2b3"
    else
      url "https://github.com/Crossmint/homebrew-tap/releases/download/v0.1.0/crossmint-macos-arm64.tar.gz"
      sha256 "7edc85c217c6fa7e510bf49e7ace96507345ec19818bcb2bb0c2f491dd14b398"
    end
  end
  
  on_linux do
    url "https://github.com/Crossmint/homebrew-tap/releases/download/v0.1.0/crossmint-linux-x64.tar.gz"
    sha256 "3653137702088397578bc18b2638e597212507b858c7668fbf8aa3d76284629a"
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
