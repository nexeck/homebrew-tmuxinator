class Tmuxinator < Formula
  desc "Manage complex tmux sessions easily"
  homepage "https://github.com/tmuxinator/tmuxinator"
  url "https://github.com/tmuxinator/tmuxinator/archive/v1.1.1.tar.gz"
  sha256 "cc293578bca43ba5cf0d60c1355c6aa1da9d923a0acc274a47ceab03812a6ef4"
  head "https://github.com/tmuxinator/tmuxinator.git"

  depends_on "ruby" => "2.4.6"

  def install
    ENV["GEM_HOME"] = libexec
    system "gem", "build", "tmuxinator.gemspec"
    system "gem", "install", "tmuxinator-1.1.1.gem"
    bin.install libexec/"bin/tmuxinator"
    bin.env_script_all_files(libexec/"bin", :GEM_HOME => ENV["GEM_HOME"])
  end

  test do
    system "#{bin}/tmuxinator", "help"
  end
end
