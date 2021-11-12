class CigSdk < Formula
  desc "CLI to deploy CIG Dev Tools"
  homepage "https://github.com/itcig/cig-sdk"  
  url "https://github.com/itcig/cig-sdk/archive/v0.3.2.tar.gz"
  sha256 "b3e3bb3a867e45cad1672c705de6d7c04f23e1b473c845de845ee0029b23175b"
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
    assert_match "CIG SDK 0.3.2", shell_output("#{bin}/cig version", 2)
  end
end
