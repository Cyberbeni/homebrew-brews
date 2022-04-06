class LastpassCli < Formula
	desc "LastPass command-line interface tool"
	homepage "https://github.com/lastpass/lastpass-cli"
	version "8767b5e53192ad4e72d1352db4aa9218e928cbe1"
	url "https://github.com/Cyberbeni/homebrew-brews/releases/download/downloadable-files/lastpass-cli.tar.gz"
	sha256 "9e081d76853f038b3f83acf372d9da55984555de9467cc3e6ac4f782ea7ca2a1"
	license "GPL-2.0"
	head "https://github.com/lastpass/lastpass-cli.git", branch: "master"
 
	depends_on "automake" => :build
	depends_on "cmake" => :build
	depends_on "curl"
	depends_on "openssl@1.1"
 
	def install
		ENV["PREFIX"] = prefix
		ENV["OPENSSL_ROOT_DIR"] = Formula["openssl@1.1"].opt_prefix
 
		system "make"
		system "make", "install"
 
		bash_completion.install "contrib/lpass_bash_completion"
		zsh_completion.install "contrib/lpass_zsh_completion" => "_lpass"
		fish_completion.install "contrib/completions-lpass.fish" => "lpass.fish"
	end
 
	test do
		assert_equal("Error: Could not find decryption key. Perhaps you need to login with `#{bin}/lpass login`.",
		 shell_output("#{bin}/lpass passwd 2>&1", 1).chomp)
	end
 end
 