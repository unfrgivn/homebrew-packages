class CigSdk < Formula
  desc "CLI to deploy CIG Dev Tools"
  homepage "https://github.com/itcig/cig-sdk"  
  url "https://github.com/itcig/cig-sdk/archive/v0.3.3.tar.gz"
  sha256 "697025490d554cab85b05d593eb856b83c76827aa893e5a5790f9d5df039fc86"
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
    assert_match "CIG SDK 0.3.3", shell_output("#{bin}/cig version", 2)
  end
end
