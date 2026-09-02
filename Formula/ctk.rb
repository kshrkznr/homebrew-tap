class Ctk < Formula
  ARM64_SHA256 = "48871c0b0f160ed7e6bdfad46488d09c19cd2acb8eb3badd2a9fa57a0a5e0b53".freeze
  AMD64_SHA256 = "31ed65ce81c6fafec2001f2b7b079d1ef0cfae9f5c73626ab46465a8710b807b".freeze

  desc "Compose and reproduce VS Code-family environments"
  homepage "https://github.com/kshrkznr/code-toolkit"
  url "https://github.com/kshrkznr/code-toolkit/releases/download/v0.7.1/ctk_v0.7.1_darwin_#{Hardware::CPU.arm? ? "arm64" : "amd64"}.tar.gz"
  sha256 Hardware::CPU.arm? ? ARM64_SHA256 : AMD64_SHA256
  license "MIT"

  depends_on :macos

  def install
    bin.install "ctk"
    doc.install "LICENSE", "THIRD_PARTY_NOTICES"
    generate_completions_from_executable bin/"ctk", shell_parameter_format: :cobra, shells: [:bash, :zsh, :fish]
  end

  test do
    assert_match "ctk v#{version}", shell_output("#{bin}/ctk version")
    assert_match "source: packaged", shell_output("#{bin}/ctk docs status")
    assert_match "Usage:", shell_output("#{bin}/ctk --help")
  end
end
