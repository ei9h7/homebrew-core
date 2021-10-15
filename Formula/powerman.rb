class Powerman < Formula
  desc "Control (remotely and in parallel) switched power distribution units"
  homepage "https://code.google.com/p/powerman/"
  url "https://github.com/chaos/powerman/releases/download/2.3.26/powerman-2.3.26.tar.gz"
  sha256 "19e213127f468b835165b8e2082ff2dfff62d6832f3332160f2c6ba8b2d286ad"
  license "GPL-2.0"

  bottle do
    sha256 arm64_big_sur: "fad852bdb968ec275c82d4973145d05cd92103d9b144d622304fd70a18ec1989"
    sha256 big_sur:       "4bf4916e05827d1274117637d9a76ea3e6cd3c1165db8cfc587ba777dca1e915"
    sha256 catalina:      "aaa93f0be2fa1d4092c2d06cec0b7fbcc00d4817ff2d6dc4601301a8cb3917fc"
    sha256 mojave:        "a2d26575a0a9816dc1f8b0b212531c8ea455a6c8322a42d5fb2630e3a2f85b1b"
    sha256 high_sierra:   "9dd898b2222ba55a6c2aeb4e4414d6eb68d9c9e19794da533b4d1bd6970e6469"
    sha256 x86_64_linux:  "22d8c104f089a2a5ba9655e2e86cd77929d7f6bab010249884362d6827b25f3a"
  end

  head do
    url "https://github.com/chaos/powerman.git"

    depends_on "autoconf" => :build
    depends_on "automake" => :build
    depends_on "libtool" => :build
  end

  depends_on "curl"

  def install
    system "./autogen.sh" if build.head?
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--localstatedir=#{var}",
                          "--with-httppower",
                          "--with-ncurses",
                          "--without-genders",
                          "--without-snmppower",
                          "--without-tcp-wrappers"
    system "make", "install"
  end

  test do
    system "#{sbin}/powermand", "-h"
  end
end
