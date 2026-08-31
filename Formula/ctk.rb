class Ctk < Formula
  ARM64_SHA256 = "d75b00313092f87bfba57bc3e382b38ac6e7944ae1d3b4afe413e39d544c000c".freeze
  AMD64_SHA256 = "87b35a1ac1a2ba0695bc0c3851d8bc3def33178be52d40be3a3f2171ca7e1966".freeze

  desc "Compose and reproduce VS Code-family environments"
  homepage "https://github.com/kshrkznr/code-toolkit"
  url "https://github.com/kshrkznr/code-toolkit/releases/download/v0.5.2/ctk_v0.5.2_darwin_#{Hardware::CPU.arm? ? "arm64" : "amd64"}.tar.gz"
  version "0.5.2"
  sha256 Hardware::CPU.arm? ? ARM64_SHA256 : AMD64_SHA256
  license "MIT"

  depends_on :macos

  def install
    bin.install "ctk"
    doc.install "LICENSE", "THIRD_PARTY_NOTICES"
  end

  test do
    assert_match "ctk v#{version}", shell_output("#{bin}/ctk version")
    assert_match "source: packaged", shell_output("#{bin}/ctk docs status")
    assert_match "Usage:", shell_output("#{bin}/ctk --help")
  end
end
