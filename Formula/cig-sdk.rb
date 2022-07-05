class CigSdk < Formula
  desc "CLI to deploy CIG Dev Tools"
  homepage "https://github.com/itcig/cig-sdk"  
  url "https://github.com/itcig/cig-sdk/archive/v0.10.1.tar.gz"
  sha256 "08e2a9f617ff6bf543855d5c13ce617c79a10a4e1ea3e0419590e19bf04e49d0"
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
    assert_match "CIG SDK 0.10.1", shell_output("#{bin}/cig version", 2)
  end
end
