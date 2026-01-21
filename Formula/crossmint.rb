class Crossmint < Formula
  desc "Crossmint CLI"
  homepage "https://github.com/Crossmint/homebrew-tap"
  license "MIT"
  version "1.1.12"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Crossmint/homebrew-tap/releases/download/v1.1.12/crossmint-macos-x64.zip"
      sha256 "6a4b8f6d0f650f63ac0d4d1c767d7dc8bfde6ed39cef5a6ce331acb5f090c1e0"
    else
      url "https://github.com/Crossmint/homebrew-tap/releases/download/v1.1.12/crossmint-macos-arm64.zip"
      sha256 "6f46a10260be349940fa065e6f0add220535102f263954baea539fead2f626c4"
    end
  end

  on_linux do
    url "https://github.com/Crossmint/homebrew-tap/releases/download/v1.1.12/crossmint-linux-x64.tar.gz"
    sha256 "cd11082e59998671402fca84e4c650c9690a1e206fb223618063a93f3ca74839"
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
