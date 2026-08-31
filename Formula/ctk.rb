class Ctk < Formula
  ARM64_SHA256 = "d425fb6a93ba8a82283aca372c632ad2640437fa11128a3e052ba97f8efcae67".freeze
  AMD64_SHA256 = "c5802c98d363b4a51b404afde06dc2afb8c8283ba315201330bbe550aae5fc43".freeze

  desc "Compose and reproduce VS Code-family environments"
  homepage "https://github.com/kshrkznr/code-toolkit"
  url "https://github.com/kshrkznr/code-toolkit/releases/download/v0.6.0/ctk_v0.6.0_darwin_#{Hardware::CPU.arm? ? "arm64" : "amd64"}.tar.gz"
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
