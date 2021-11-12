class CigSdk < Formula
  desc "CLI to deploy CIG Dev Tools"
  homepage "https://github.com/itcig/cig-sdk"  
  url "https://github.com/itcig/cig-sdk/archive/v0.3.1.tar.gz"
  sha256 "f2c7122d4b5437e25c80755dee2471794cd5bf59520135ed771b5aa617061a05"
  head "https://github.com/itcig/cig-sdk.git", branch: "main"

  depends_on "ansible@2.9"
  depends_on "docker"
  depends_on "python@3.9"

  def install    
    prefix.install "ansible"
    prefix.install "docker"
    bin.install "bin/cig-sdk" => "cig"

    system "/usr/local/bin/cig", "self", "update"
  end

  # Homebrew requires tests.
  test do
    assert_match "CIG SDK 0.3.1", shell_output("#{bin}/cig version", 2)
  end
end
