class Lazyxcode < Formula
  desc "Terminal interface for building, running, and testing Xcode projects"
  homepage "https://github.com/rigbyworks/lazyxcode"
  url "https://github.com/rigbyworks/lazyxcode/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "9f5168c0541aec2b5ec825b05601cd2449502a8f06c6accc619192f1b7eac367"
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
