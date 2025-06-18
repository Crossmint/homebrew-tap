class Crossmint < Formula
  desc "Crossmint CLI"
  homepage "https://github.com/Crossmint/homebrew-tap"
  license "MIT"
  version "1.1.4"
  
  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Crossmint/homebrew-tap/releases/download/v1.1.4/crossmint-macos-x64.zip"
      sha256 "de4894602bee4f311cc48a0adbd9a2ea100ecff9bf1d0db69e9059fa9e84e4f2"
    else
      url "https://github.com/Crossmint/homebrew-tap/releases/download/v1.1.4/crossmint-macos-arm64.zip"
      sha256 "c9519238bde57dcc952a4bcd7487959c3ea487e053e9ba8262f3ef1485056e82"
    end
  end
  
  on_linux do
    url "https://github.com/Crossmint/homebrew-tap/releases/download/v1.1.4/crossmint-linux-x64.tar.gz"
    sha256 "c43156b8c7051da95a2b292e991b7620105cde1eb79976eff576e3cf06ed7463"
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
