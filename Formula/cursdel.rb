class Cursdel < Formula
  desc "Blazing-fast, native, cross-platform deletion for files and directory trees that refuse to die"
  homepage "https://github.com/repasscloud/cursedelete-2"
  version "2.0.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/repasscloud/cursedelete-2/releases/download/v2.0.0/cursdel-2.0.0-aarch64-apple-darwin.tar.gz"
      sha256 "7f040c22306453ff3553f2e5e30dc69dab73a583869623ffefbfd9bf9bd51fb4"
    end

    on_intel do
      url "https://github.com/repasscloud/cursedelete-2/releases/download/v2.0.0/cursdel-2.0.0-x86_64-apple-darwin.tar.gz"
      sha256 "3600fe9035c6ab9f2cbefec6a6a34fd0c99d65a3af1ffbb562a0c16bc923b29c"
    end
  end

  def install
    bin.install "cursdel"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cursdel --version")
  end
end
