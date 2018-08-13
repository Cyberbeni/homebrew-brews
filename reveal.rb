
class Reveal < Formula
  desc "Version 13"
  homepage "https://revealapp.com/"
  url "https://download.revealapp.com/Reveal.app-13.zip"
  sha256 "1cdae698fe0dd3d7d0f457fb572fc063dc006efa0c9a9b59e6beabebb65099ff"
  # depends_on "cmake" => :build

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end
end
