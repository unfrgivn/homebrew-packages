class CigSdk < Formula
  desc "CLI to deploy CIG Dev Tools"
  homepage "https://github.com/itcig/cig-sdk"  
  url "https://github.com/itcig/cig-sdk/archive/v0.9.0.tar.gz"
  sha256 "81a2c325a99c3fd3d07496ad8d69918295987697f9e410ecb0710788f28046e0"
  head "https://github.com/itcig/cig-sdk.git", branch: "main"

  depends_on "ansible@2.9"
  depends_on "docker"
  depends_on "python@3.9"

  def install    
    prefix.install "ansible"
    prefix.install "docker"
    prefix.install "setup"
    
    # Install main script as alias cig
    bin.install "bin/cig-sdk" => "cig" 
  end

  # Homebrew requires tests.
  test do
    assert_match "CIG SDK 0.9.0", shell_output("#{bin}/cig version", 2)
  end
end
