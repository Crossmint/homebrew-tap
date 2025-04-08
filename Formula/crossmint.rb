class Crossmint < Formula
  desc "Crossmint CLI"
  homepage "https://github.com/Crossmint/homebrew-tap"
  license "MIT"
  
  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Crossmint/homebrew-tap/releases/download/v0.0.23/crossmint-macos-x64.tar.gz"
      sha256 "c3403d28b3bf23090e2df46fe2058a9ac59e2f3dcb8efca6c3542200338c789b"
    else
      url "https://github.com/Crossmint/homebrew-tap/releases/download/v0.0.23/crossmint-macos-arm64.tar.gz"
      sha256 "dc16a316027a981694b50d5899cf99910ffcc8980150a48d31b14e69b757cfd4"
    end
  end
  
  on_linux do
    url "https://github.com/Crossmint/homebrew-tap/releases/download/v0.0.23/crossmint-linux-x64.tar.gz"
    sha256 "a2a36ec485c1612778ccbf701e16ec8c6b7a4ca70c71069d8eb519101b479410"
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
