class CigSdk < Formula
  desc "CLI to deploy CIG Dev Tools"
  homepage "https://github.com/itcig/cig-sdk"  
  url "https://github.com/itcig/cig-sdk/archive/v0.1.6.tar.gz"
  sha256 "c0de70235fcfbf856f978c67c10f5b753d9a85f0cd5c847f5c08c20dc6de9a94"
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
    bin.install "bin/cig-sdk"

    system "./bin/brew-install"
  end

  # Homebrew requires tests.
  test do
    assert_match "CIG SDK 0.1.6", shell_output("#{bin}/cig version", 2)
  end
end
