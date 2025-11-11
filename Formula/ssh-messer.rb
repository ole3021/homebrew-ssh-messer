class SshMesser < Formula
  desc "SSH tunnel proxy manager with TUI for multi-hop connections."
  homepage "https://github.com/ole3021/ssh-messer"
  url "https://github.com/ole3021/ssh-messer/archive/refs/tags/v0.2.3.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"  # 需要计算
  license "MIT"
  
  depends_on "go" => :build
  
  def install
    system "go", "build", "-ldflags", "-w -s -X ssh-messer/meta.Version=#{version}", "-o", bin/"ssh-messer", "./cmd/tui"
  end
  
  test do
    system "#{bin}/ssh-messer", "--version"
  end
end