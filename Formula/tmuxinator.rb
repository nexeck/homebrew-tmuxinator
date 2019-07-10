class Tmuxinator < Formula
  desc "Install Tmuxinator as Homebrew formulae"
  homepage "https://github.com/tmuxinator/tmuxinator"
  version "0.15.0"
  url "https://github.com/tmuxinator/tmuxinator/archive/v#{version}.tar.gz"
  sha256 "e5c121126aebe3afc758c0561b8ef05508712a799d3821453063b87445806ed4"
  head "https://github.com/tmuxinator/tmuxinator.git"

  bottle :unneeded

  def install
    ENV["GEM_HOME"] = libexec
    system "gem", "build", "tmuxinator.gemspec"
    system "gem", "install", "tmuxinator-#{version}.gem"
    bin.install libexec/"bin/tmuxinator"
    bin.env_script_all_files(libexec/"bin", :GEM_HOME => ENV["GEM_HOME"])
  end

  test do
    system "#{bin}/tmuxinator", "help"
  end
end
