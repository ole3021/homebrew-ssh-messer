class SshMesser < Formula
  desc "SSH tunnel proxy manager with TUI for multi-hop connections."
  homepage "https://github.com/ole3021/ssh-messer"
  url "https://github.com/ole3021/ssh-messer/archive/refs/tags/v0.2.6.tar.gz"
  sha256 "1ac08bb439a099689e025f9feca54b1ed0ca9ee9d43e92ddcd641038da131bda"  # 需要计算
  license "MIT"
  
  depends_on "go" => :build
  
  def install
    system "go", "build", "-ldflags", "-w -s -X ssh-messer/meta.Version=#{version}", "-o", bin/"ssh-messer", "./cmd/tui"
  end
  
  test do
    system "#{bin}/ssh-messer", "--version"
  end
end