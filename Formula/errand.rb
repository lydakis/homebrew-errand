class Errand < Formula
  desc "Personal job runner for machines you own"
  homepage "https://github.com/lydakis/errand"
  url "https://github.com/lydakis/errand/releases/download/v0.8.0/errand_0.8.0_source.tar.gz"
  sha256 "dbd21d3ef15a9b4a8f91750d8b103ef028fb18d9fccecd6dc87e4436c56bd1e9"
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
