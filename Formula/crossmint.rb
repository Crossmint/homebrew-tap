class Crossmint < Formula
  desc "Crossmint CLI"
  homepage "https://github.com/Crossmint/homebrew-tap"
  license "MIT"
  version "1.1.11"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Crossmint/homebrew-tap/releases/download/v1.1.11/crossmint-macos-x64.zip"
      sha256 "ccb601e21173f70f59f7e66d603de309f23252621d80591576ccbd65d7fe2800"
    else
      url "https://github.com/Crossmint/homebrew-tap/releases/download/v1.1.11/crossmint-macos-arm64.zip"
      sha256 "c61c54741f8965b01f902dfabbc427d8a33a00927b4b969b8340abeefbf0faec"
    end
  end

  on_linux do
    url "https://github.com/Crossmint/homebrew-tap/releases/download/v1.1.11/crossmint-linux-x64.tar.gz"
    sha256 "9dea52899088242d8db8cbe1a6b305747f2faf9a4f10455eb1665eb9a229a7be"
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
