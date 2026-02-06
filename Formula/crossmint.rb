class Crossmint < Formula
  desc "Crossmint CLI"
  homepage "https://github.com/Crossmint/homebrew-tap"
  license "MIT"
  version "1.1.13"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Crossmint/homebrew-tap/releases/download/v1.1.13/crossmint-macos-x64.zip"
      sha256 "a60beea0af2d9eff221280b2823876b4266610a6e7ef0f9ab1d698e1edbbfad9"
    else
      url "https://github.com/Crossmint/homebrew-tap/releases/download/v1.1.13/crossmint-macos-arm64.zip"
      sha256 "1ee2209cb7d1fa4caadfcc685ab68afca6b092fcf374bba552e45665864729c4"
    end
  end

  on_linux do
    url "https://github.com/Crossmint/homebrew-tap/releases/download/v1.1.13/crossmint-linux-x64.tar.gz"
    sha256 "1dedb81cb805bceb4e224e9e734572de7be4b8e679dd84ac76d16b963aeaf775"
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
