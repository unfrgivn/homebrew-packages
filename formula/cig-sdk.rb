require "formula"

class Cig < Formula
  desc "CLI to deploy CIG Dev Tools"
  homepage "https://github.com/itcig/cig-sdk"
  
  url "https://github.com/itcig/cig-sdk/releases/download/v0.1.0/cig-sdk-0.1.0.tar.gz"
  sha256 "99049e9446d08536223401d73d069edfc4c5f0d94e87c9be5cc44fd1d67f305e"
  head "https://github.com/itcig/cig-sdk.git"
  depends_on "ansible"
  depends_on "docker"
  depends_on "docker-sync"
  depends_on "python3"
  depends_on "pip"
  depends_on "ruby"

  def install    
    # Set correct working directory
    inreplace "bin/cig",
              "CIG_SDK_DIR='/usr/local/cig-sdk'",
              "CIG_SDK_DIR='#{prefix}'"

    # system "./bin/brew-install" 
    bin.install "bin/cig"
  end

  # Homebrew requires tests.
  test do
    assert_match "cig version 1.0.0", shell_output("#{bin}/cig -v", 2)
  end
end
