class Crossmint < Formula
  desc "Crossmint CLI"
  homepage "https://github.com/Crossmint/homebrew-tap"
  license "MIT"
  
  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Crossmint/homebrew-tap/releases/download/v/crossmint-macos-x64.tar.gz"
      sha256 "0ffe933e55a413e24a702d562596c6ff284bbacec944a81367c2b33b73fa666a"
    else
      url "https://github.com/Crossmint/homebrew-tap/releases/download/v/crossmint-macos-arm64.tar.gz"
      sha256 "c350d30ec82d22b0f9cb7a3458031a228a06bbb4a51365fea0fde59b47840709"
    end
  end
  
  on_linux do
    url "https://github.com/Crossmint/homebrew-tap/releases/download/v/crossmint-linux-x64.tar.gz"
    sha256 "0bc1d830e40e3219cfc1999236e77bf2a7ac4955cb33c65dd995bf0d55b8fe5f"
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
