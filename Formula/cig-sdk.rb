class CigSdk < Formula
  desc "CLI to deploy CIG Dev Tools"
  homepage "https://github.com/itcig/cig-sdk"  
  url "https://github.com/itcig/cig-sdk/archive/v0.2.2.tar.gz"
  sha256 "580f698c525a766b4ba5c561b52ad10040559b240124ff2de0a4cd5e6157a593"
  head "https://github.com/itcig/cig-sdk.git", branch: "main"

  depends_on "ansible@2.9"
  depends_on "docker"
  depends_on "python@3.9"

  def install    
    prefix.install "ansible"
    prefix.install "docker"
    bin.install "bin/cig-sdk" => "cig"

    system "/usr/local/bin/cig", "self", "update"
  end

  # Homebrew requires tests.
  test do
    assert_match "CIG SDK 0.2.2", shell_output("#{bin}/cig version", 2)
  end
end
