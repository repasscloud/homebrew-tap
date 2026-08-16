class Cursdel < Formula
  desc "Blazing-fast, native, cross-platform deletion for files and directory trees that refuse to die"
  homepage "https://github.com/danijeljw-RPC/cursedelete-2"
  version "2.0.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/danijeljw-RPC/cursedelete-2/releases/download/v2.0.0/cursdel-2.0.0-aarch64-apple-darwin.tar.gz"
      sha256 "PUT_ARM64_SHA256_HERE"
    end

    on_intel do
      url "https://github.com/danijeljw-RPC/cursedelete-2/releases/download/v2.0.0/cursdel-2.0.0-x86_64-apple-darwin.tar.gz"
      sha256 "PUT_X86_64_SHA256_HERE"
    end
  end

  def install
    bin.install "cursdel"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cursdel --version")
  end
end
