class Apktool < Formula
  desc "Tool for reverse engineering 3rd party, closed, binary Android apps"
  homepage "https://github.com/iBotPeaches/Apktool"
  url "https://github.com/iBotPeaches/Apktool/releases/download/v2.6.0/apktool_2.6.0.jar"
  sha256 "f750a3cd2c1f942f27f5f7fd5d17eada3bdaff0a6643f49db847e842579fdda5"
  license "Apache-2.0"
  revision 1

  bottle do
    sha256 cellar: :any_skip_relocation, all: "684ae13830cc9f99071e6999a261953ab696b4b92d80e78eae97451ae28d5e9b"
  end

  depends_on "openjdk"

  resource "sample.apk" do
    url "https://github.com/downloads/stephanenicolas/RoboDemo/robodemo-sample-1.0.1.apk"
    sha256 "bf3ec04631339538c8edb97ebbd5262c3962c5873a2df9022385156c775eb81f"
  end

  def install
    libexec.install "apktool_#{version}.jar"
    bin.write_jar_script libexec/"apktool_#{version}.jar", "apktool"
  end

  test do
    resource("sample.apk").stage do
      system bin/"apktool", "d", "robodemo-sample-1.0.1.apk"
      system bin/"apktool", "b", "robodemo-sample-1.0.1"
    end
  end
end
