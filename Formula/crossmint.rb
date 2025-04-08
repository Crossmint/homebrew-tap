class Crossmint < Formula
  desc "Crossmint CLI"
  homepage "https://github.com/Crossmint/homebrew-tap"
  license "MIT"
  
  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Crossmint/homebrew-tap/releases/download/v0.0.25/crossmint-macos-x64.tar.gz"
      sha256 "72af99aef5c8e5c9d1a5eb4f4a692edba167b2a8fb7180b6f686dd01f39e4889"
    else
      url "https://github.com/Crossmint/homebrew-tap/releases/download/v0.0.25/crossmint-macos-arm64.tar.gz"
      sha256 "4c010ae328054c79f0d09514da56836907c9c10a6bf3937a3ba47cf77de4e848"
    end
  end
  
  on_linux do
    url "https://github.com/Crossmint/homebrew-tap/releases/download/v0.0.25/crossmint-linux-x64.tar.gz"
    sha256 "1b34dd0a0247e47c1901b10c2a5c743e36b7fc8633dcc9ca7a7ad94dbed1139b"
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
