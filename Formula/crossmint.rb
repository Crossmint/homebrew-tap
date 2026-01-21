class Crossmint < Formula
  desc "Crossmint CLI"
  homepage "https://github.com/Crossmint/homebrew-tap"
  license "MIT"
  version "refs/tags/test-4"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Crossmint/homebrew-tap/releases/download/vrefs/tags/test-4/crossmint-macos-x64.zip"
      sha256 "f3d39ee802420ff2f5f84f34ae08dad3c3191526ec6986d05205d15dbdaa39c2"
    else
      url "https://github.com/Crossmint/homebrew-tap/releases/download/vrefs/tags/test-4/crossmint-macos-arm64.zip"
      sha256 "7aaad638f7889efffa6f97ae9ae64e60309e89a553006b01d547cc603fa80d0c"
    end
  end

  on_linux do
    url "https://github.com/Crossmint/homebrew-tap/releases/download/vrefs/tags/test-4/crossmint-linux-x64.tar.gz"
    sha256 "474fa32114e5ed19a43bb97a6eea34a6dcf1fb77eeac91e82cecc9011b4c8f75"
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
