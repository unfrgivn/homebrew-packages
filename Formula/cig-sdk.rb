class CigSdk < Formula
  desc "CLI to deploy CIG Dev Tools"
  homepage "https://github.com/itcig/cig-sdk"  
  url "https://github.com/itcig/cig-sdk/archive/v0.2.0.tar.gz"
  sha256 "eb222959fd46b28b58b4c2ff2b49aa1b027dd15ba585ac650d6c280cf2a4457d"
  head "https://github.com/itcig/cig-sdk.git", branch: "main"

  depends_on "ansible"
  depends_on "docker"
  depends_on "python@3.9"

  def install    
    # Set correct working directory
    inreplace "bin/cig-sdk",
              "CIG_SDK_DIR='/usr/local/cig-sdk'",
              "CIG_SDK_DIR='#{prefix}'"
    
    inreplace "bin/brew-install",
              "CIG_SDK_DIR='/usr/local/cig-sdk'",
              "CIG_SDK_DIR='#{prefix}'"
    
    prefix.install "ansible"
    prefix.install "docker"
    bin.install "bin/cig-sdk" => "cig"

    system "./bin/brew-install"
  end

  # Homebrew requires tests.
  test do
    assert_match "CIG SDK 0.2.0", shell_output("#{bin}/cig version", 2)
  end
end
