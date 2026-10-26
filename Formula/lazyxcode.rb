class Lazyxcode < Formula
  desc "Terminal interface for building, running, and testing Xcode projects"
  homepage "https://github.com/rigbyworks/lazyxcode"
  url "https://github.com/rigbyworks/lazyxcode/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "44b79d8e65d7b887199323a979b44bb35322154836e57b17df7061bdce56efca"
  license "MIT"

  depends_on xcode: ["27.0", :build]
  depends_on arch: :arm64
  depends_on macos: :sequoia

  def install
    system "make", "build", "VERSION=v#{version}"
    bin.install "lazyxcode"
  end

  def caveats
    <<~EOS
      Full Xcode 16.3 or newer is required to build and run projects.
      Select Xcode with xcode-select or DEVELOPER_DIR, then run lazyxcode
      from a directory containing an .xcodeproj or .xcworkspace.
    EOS
  end

  test do
    assert_equal "lazyxcode v#{version}", shell_output("#{bin}/lazyxcode --version").strip
    assert_match "Usage: lazyxcode", shell_output("#{bin}/lazyxcode --help")
    assert_match "unknown argument", shell_output("#{bin}/lazyxcode --invalid 2>&1", 2)
    assert_match "no .xcworkspace or .xcodeproj", shell_output("#{bin}/lazyxcode 2>&1", 1)
  end
end
