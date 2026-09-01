class Ctk < Formula
  ARM64_SHA256 = "e021687b42369e57cce1ac8695e363fc1ba346fc02f45e3dc71e68fafbc13407".freeze
  AMD64_SHA256 = "6119d57131b09ea02cbe891c02c3b191ba5df6c556ee604da35d26d144402ccf".freeze

  desc "Compose and reproduce VS Code-family environments"
  homepage "https://github.com/kshrkznr/code-toolkit"
  url "https://github.com/kshrkznr/code-toolkit/releases/download/v0.6.2/ctk_v0.6.2_darwin_#{Hardware::CPU.arm? ? "arm64" : "amd64"}.tar.gz"
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
