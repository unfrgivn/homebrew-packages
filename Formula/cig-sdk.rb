class CigSdk < Formula
  desc "CLI to deploy CIG Dev Tools"
  homepage "https://github.com/itcig/cig-sdk"  
  url "https://github.com/itcig/cig-sdk/archive/v0.1.5.tar.gz"
  sha256 "3d29dbf8b9ff54bf3ce0c4d8f23d6225c969dcbe92d54c9b994e1b48a166a403"
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
    assert_match "CIG SDK 0.1.5", shell_output("#{bin}/cig version", 2)
  end
end
