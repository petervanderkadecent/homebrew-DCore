class Dcore < Formula
  desc "Fast, powerful and cost-efficient blockchain"
  homepage "https://decent.ch/dcore"
  url "https://github.com/DECENTfoundation/DECENT-Network.git", :using => :git, :tag => "1.4.0", :revision => "6c6b0f7241e1cb3cec68fd60a41c4185dbc64f4e"
  head "https://github.com/DECENTfoundation/DECENT-Network.git", :branch => "develop", :shallow => false

  bottle do
    root_url "https://dl.bintray.com/decentfoundation/homebrew"
    cellar :any_skip_relocation
    sha256 "d7671829bf1d5af2ea5d40d230a50ba7b8a90abf93252e72cf7ce8795c923976" => :mojave
    sha256 "4c8988d11340759b86821e64591d80aafd2834e8452ae40d69836da439008fc6" => :high_sierra
  end

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "boost" => :build
  depends_on "cmake" => :build
  depends_on "doxygen" => :build
  depends_on "libtool" => :build
  depends_on "nlohmann/json/nlohmann_json" => ["with-cmake", :build]
  depends_on "cryptopp"
  depends_on "ipfs"
  depends_on "openssl"
  depends_on "pbc"
  depends_on "qt"
  depends_on "readline"

  def install
    system "cmake", ".", *std_cmake_args
    system "make", ENV["MAKEFLAGS"], "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    # system "#{bin}/decentd", "--version"
    system "true"
  end
end
