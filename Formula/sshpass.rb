class Sshpass < Formula
	desc "Non-interactive ssh password auth"
	homepage "https://sourceforge.net/projects/sshpass/"
	url "https://github.com/Cyberbeni/homebrew-brews/releases/download/downloadable-files/sshpass-1.08.tar.gz"
	sha256 "8bdacb8ca4ecf82c84a5effa2f75a8bf4ed9dd6f9d030f308fe11cffb3830b02"
	license "GPL-2.0"
 
	def install
		system "./configure", "--disable-debug", "--disable-dependency-tracking", "--prefix=#{prefix}"
		system "make", "install"
	end

	def test
		system "sshpass"
	end
 end
 