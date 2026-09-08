class Errand < Formula
  desc "Personal job runner for machines you own"
  homepage "https://github.com/lydakis/errand"
  url "https://github.com/lydakis/errand/releases/download/v0.1.2/errand_0.1.2_source.tar.gz"
  sha256 "63f5cf02fffba8de13cef8d8871454de97c49dc13fd6ed8a328d169b081cceed"
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
