# For local testing only
require_relative "../lib/custom_download_strategy.rb"

class DevSdk < Formula
  desc "Dev Tools SDK"
  homepage "https://github.com/unfrgivn/homebrew-packages"
  url "https://github.com/unfrgivn/dev-sdk/archive/refs/tags/v0.10.1.tar.gz", :using => GitHubPrivateRepositoryReleaseDownloadStrategy
  sha256 "b2909a8845d744a757984ad08869eaba1d7c85f77a4bee9f03c8dd3fa5f935ea"
  head "git@github.com:unfrgivn/dev-sdk.git", :branch => "main"

  # depends_on "python@3.10"

  def install    
    # Migrate files needed by bin to run
    prefix.install "ansible"    
    prefix.install "docker"
    prefix.install "setup"
    
    # Install main script as alias wp
    bin.install "bin/dev-sdk" => "dev" 
  end

  # Homebrew requires tests.
  test do
    # system "#{bin}/wp --help"
    assert_match "Dev SDK version 0.10.1", shell_output("#{bin}/dev version", 2)
  end
end
