class CigSdk < Formula
  desc "CLI to deploy CIG Dev Tools"
  homepage "https://github.com/itcig/cig-sdk"  
  url "https://github.com/itcig/cig-sdk/archive/v0.1.2.tar.gz"
  sha256 "ed65f6a65911db4db66199f78e87a7cd6f80fe25174354e4855e900b9b6f9e46"
  head "https://github.com/itcig/cig-sdk.git"

  depends_on "ansible"
  depends_on "docker"
  depends_on "python@3.9"

  def install    
    # Set correct working directory
    inreplace "bin/cig-sdk",
              "CIG_SDK_DIR='/usr/local/cig-sdk'",
              "CIG_SDK_DIR='#{prefix}'"

    # system "./bin/brew-install" 
    bin.install "bin/cig-sdk" => "cig"
  end

  # Homebrew requires tests.
  test do
    assert_match "CIG SDK 0.1.2", shell_output("#{bin}/cig version", 2)
  end
end
