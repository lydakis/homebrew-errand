class Errand < Formula
  desc "Personal job runner for machines you own"
  homepage "https://github.com/lydakis/errand"
  url "https://github.com/lydakis/errand/releases/download/v0.6.0/errand_0.6.0_source.tar.gz"
  sha256 "5453624e1d42f69e840fe42780f5e2336d428c133b0e452682e4576da0ab7185"
  license "MIT"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "./cmd/errand"
  end

  def caveats
    <<~EOS
      On a runner, use `errand setup` to configure and manage the service.
      After upgrading, run `errand setup` when the runner is idle to restart it.
    EOS
  end

  test do
    assert_equal "errand #{version}", shell_output("#{bin}/errand version").strip
    assert_match "errand peers", shell_output("#{bin}/errand --help")
  end
end
