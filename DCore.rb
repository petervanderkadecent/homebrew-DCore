class Dcore < Formula
  desc "Fast, powerful and cost-efficient blockchain"
  homepage "https://decent.ch/dcore"
  url "https://github.com/DECENTfoundation/DECENT-Network.git", :using => :git, :tag => "1.3.4", :revision => "9f7547eacfe20d872a188ed0ae2a4c18f424cbed"
  head "https://github.com/DECENTfoundation/DECENT-Network.git", :branch => "develop"

  bottle do
    root_url "https://dl.bintray.com/decentfoundation/homebrew"
    cellar :any
    sha256 "0000000000000000000000000000000000000000000000000000000000000000" => :mojave
    sha256 "5d4a20f45f16dd0f4a031cc10bf9e10514374e10fdb1894f49ef639bb3605186" => :high_sierra
  end

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "boost" => :build
  depends_on "byacc" => :build
  depends_on "cmake" => :build
  depends_on "doxygen" => :build
  depends_on "flex" => :build
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
