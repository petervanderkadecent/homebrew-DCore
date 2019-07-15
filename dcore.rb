class Dcore < Formula
  desc "Fast, powerful and cost-efficient blockchain"
  homepage "https://decent.ch/dcore"
  url "https://github.com/DECENTfoundation/DECENT-Network.git", :using => :git, :tag => "1.4.0", :revision => "383ecb36e5f7d6d330824b56661549e890122321"
  head "https://github.com/DECENTfoundation/DECENT-Network.git", :branch => "develop", :shallow => false

  bottle do
    root_url "https://dl.bintray.com/decentfoundation/homebrew"
    cellar :any_skip_relocation
    sha256 "3fa7246ac69e7c0cf7196e95945aa7209967e6074c1a044fa690dbf4ed258b64" => :mojave
    sha256 "80aeadc1741ff8d7058561dbad753d6fd2b44419affc6fd4406d96754a2a9103" => :high_sierra
  end

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "boost-python3" => :build
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

  plist_options :manual => "decentd"

  def plist; <<~EOS
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
      <key>Label</key>
      <string>#{plist_name}</string>
      <key>ProgramArguments</key>
      <array>
        <string>#{opt_bin}/decentd</string>
        <string>--daemon</string>
      </array>
      <key>RunAtLoad</key>
      <true/>
    </dict>
    </plist>
  EOS
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
