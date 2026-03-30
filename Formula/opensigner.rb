class Opensigner < Formula
  desc "Secure Enclave-backed macOS signing CLI"
  homepage "https://github.com/Paella-Labs/crossbit-main"
  version "0.2.0"

  on_macos do
    url "https://github.com/Crossmint/homebrew-tap/releases/download/opensigner-v0.2.0/OpenSigner.app.zip"
    sha256 "9bc208f852d52ef60802c7368ad8b9a3c0677c76d21537b8a5ed22ca4e8d630f"
  end

  def install
    odie "opensigner currently supports Apple Silicon Macs only" if Hardware::CPU.intel?

    app_source = buildpath/"OpenSigner.app"
    if !app_source.exist? && (buildpath/"Contents").exist?
      app_source.mkpath
      mv buildpath/"Contents", app_source/"Contents"
    end

    libexec.install app_source
    bin.install_symlink libexec/"OpenSigner.app/Contents/MacOS/opensigner" => "opensigner"
  end

  test do
    system "#{bin}/opensigner", "--help"
  end
end
