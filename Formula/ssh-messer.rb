class SshMesser < Formula
  desc "SSH tunnel proxy manager with TUI for multi-hop connections."
  homepage "https://github.com/ole3021/ssh-messer"

  url "https://github.com/ole3021/ssh-messer/archive/refs/tags/v0.2.8.tar.gz"

  sha256 "048f45a8331a98a15b1b2e61e5ddd7918c8d082440f705a08bd81a7c724b48c5"
  license "MIT"
  
  depends_on "go" => :build
  
  def install
    system "go", "build", "-ldflags", "-w -s -X ssh-messer/meta.Version=#{version}", "-o", bin/"ssh-messer", "./cmd/tui"
  end
  
  test do
    system "#{bin}/ssh-messer", "--version"
  end
end