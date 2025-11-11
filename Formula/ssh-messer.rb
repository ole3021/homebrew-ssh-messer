class SshMesser < Formula
  desc "SSH tunnel proxy manager with TUI for multi-hop connections."
  homepage "https://github.com/ole3021/ssh-messer"
  url "https://github.com/ole3021/ssh-messer/archive/refs/tags/v0.2.7.tar.gz"
  sha256 "6953379e6aec92788d25e4bad8be21a563144ff23b2173b8af6a0d377781e761"  # 需要计算
  license "MIT"
  
  depends_on "go" => :build
  
  def install
    system "go", "build", "-ldflags", "-w -s -X ssh-messer/meta.Version=#{version}", "-o", bin/"ssh-messer", "./cmd/tui"
  end
  
  test do
    system "#{bin}/ssh-messer", "--version"
  end
end