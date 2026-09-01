class Ctk < Formula
  ARM64_SHA256 = "a6ff591094cbe26aeb298be40840a243bcdcd80d5ea61ec756d1aa11f5a161bb".freeze
  AMD64_SHA256 = "40e8bc4d39fdcdc87ec020b2a4bd071587779fa9f6664bb6481ac824cd3b4d7a".freeze

  desc "Compose and reproduce VS Code-family environments"
  homepage "https://github.com/kshrkznr/code-toolkit"
  url "https://github.com/kshrkznr/code-toolkit/releases/download/v0.7.0/ctk_v0.7.0_darwin_#{Hardware::CPU.arm? ? "arm64" : "amd64"}.tar.gz"
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
