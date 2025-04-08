class Crossmint < Formula
  desc "Crossmint CLI"
  homepage "https://github.com/Crossmint/homebrew-tap"
  license "MIT"
  
  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Crossmint/homebrew-tap/releases/download/v0.0.15/crossmint-macos-x64.tar.gz"
      sha256 "36053782e4cc3246e77bc2b3dd0ad1520d65b980a8e89fd6e4a9fc8ad9cf45d3"
    else
      url "https://github.com/Crossmint/homebrew-tap/releases/download/v0.0.15/crossmint-macos-arm64.tar.gz"
      sha256 "d235d68318845d9e133b9edefa42767d5eebe7738aca2258564f6e38970e502e"
    end
  end
  
  on_linux do
    url "https://github.com/Crossmint/homebrew-tap/releases/download/v0.0.15/crossmint-linux-x64.tar.gz"
    sha256 "659621926aff45cfd27da07fe9405e5f64d88cc8d81b6300f5d64d3e95efe29b"
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
