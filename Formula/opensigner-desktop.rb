class OpensignerDesktop < Formula
  desc "Secure Enclave-backed macOS signing CLI"
  homepage "https://github.com/Paella-Labs/crossbit-main"
  version "0.1.0"

  on_macos do
    url "https://github.com/Crossmint/homebrew-tap/releases/download/opensigner-desktop-v0.1.0/OpenSigner.app.zip"
    sha256 "023ac72a894ffde33eef8496b0865e8a7cf33c9eb22877e75ef5a705a0221f67"
  end

  def install
    odie "opensigner-desktop currently supports Apple Silicon Macs only" if Hardware::CPU.intel?

    libexec.install "OpenSigner.app"
    bin.install_symlink libexec/"OpenSigner.app/Contents/MacOS/opensigner" => "opensigner-desktop"
  end

  test do
    system "#{bin}/opensigner-desktop", "--help"
  end
end
