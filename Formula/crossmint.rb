class Crossmint < Formula
  desc "Crossmint CLI"
  homepage "https://github.com/Crossmint/homebrew-tap"
  license "MIT"
  version "0.3.2"
  
  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Crossmint/homebrew-tap/releases/download/v0.3.2/crossmint-macos-x64.zip"
      sha256 "7fb7d096341964dd442ab73bdd0a8db9f30e14b2389de086bda5ae12caa62560"
    else
      url "https://github.com/Crossmint/homebrew-tap/releases/download/v0.3.2/crossmint-macos-arm64.zip"
      sha256 "62bfc3d9ab2d73edf628ff36edc69fc020874bd03bcc0540644dfa41a935ccf1"
    end
  end
  
  on_linux do
    url "https://github.com/Crossmint/homebrew-tap/releases/download/v0.3.2/crossmint-linux-x64.tar.gz"
    sha256 "28e926289b289fe6fc9a17e3b836f86a34c3ff48066df2419792612d8ba8a81b"
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
