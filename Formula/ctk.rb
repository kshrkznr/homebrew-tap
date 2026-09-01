class Ctk < Formula
  ARM64_SHA256 = "309bfda560a5c2794dc9d662d43b7daee1f5206aa41836e5c2ae55bc86843efe".freeze
  AMD64_SHA256 = "84c0ec4b635f69a3a601edf85aa6e80feb34d7cbaf53b09bea010a5b0b4ea3a6".freeze

  desc "Compose and reproduce VS Code-family environments"
  homepage "https://github.com/kshrkznr/code-toolkit"
  url "https://github.com/kshrkznr/code-toolkit/releases/download/v0.6.1/ctk_v0.6.1_darwin_#{Hardware::CPU.arm? ? "arm64" : "amd64"}.tar.gz"
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
