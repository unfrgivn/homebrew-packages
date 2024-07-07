# typed: true
# frozen_string_literal: true

require_relative "../lib/custom_download_strategy"

# This file was generated by Homebrew Releaser. DO NOT EDIT.
class CliToolTest < Formula
  desc "Testing a generic cli tool that can be installed with homebrew"
  homepage "https://github.com/unfrgivn/cli-tool-test"
  url "https://github.com/unfrgivn/cli-tool-test/archive/refs/tags/v0.2.4.tar.gz"
  sha256 "61f4bfce5c83b60ce6aef5c1a452e0fb4b497a7ef6e3e99818d4430512757dba"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/unfrgivn/cli-tool-test/releases/download/v0.2.4/cli-tool-test-0.2.4-darwin-arm64.tar.gz"
      sha256 "c07b65a87ec313bafa621bd2229e0e4d112bcb81a86620643dad4c9eb0da8e5d"
    end
  end

  def install
    # Install main script as alias wp
bin.install "bin/test-app" => "testapp"
  end
end
