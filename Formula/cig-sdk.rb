class CigSdk < Formula
  desc "CLI to deploy CIG Dev Tools"
  homepage "https://github.com/itcig/cig-sdk"  
  url "https://github.com/itcig/cig-sdk/archive/v0.1.3.tar.gz"
  sha256 "e490670275a1e383d420fffb593d372d5f8691e466ef8b5065bb3e00a380986e"
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

    bin.install "bin/cig-sdk" => "cig"
    libexec.install Dir["*"]

    system "./bin/brew-install"
  end

  # Homebrew requires tests.
  test do
    assert_match "CIG SDK 0.1.2", shell_output("#{bin}/cig version", 2)
  end
end
