# typed: false
# frozen_string_literal: true

class Dcore < Formula
  desc "Fast, powerful and cost-efficient blockchain"
  homepage "https://decent.ch/dcore"
  url "https://github.com/DECENTfoundation/DECENT-Network.git", using: :git, tag: "1.4.2", revision: "00d04c1f6c7cd5b26f8c2648bd634b1f61431527"
  head "https://github.com/DECENTfoundation/DECENT-Network.git", branch: "master", shallow: false

  bottle do
    root_url "https://dl.bintray.com/decentfoundation/homebrew"
    sha256 cellar: :any_skip_relocation, mojave: "3159627a21430bcff25b08e3078e6a07cea11d5c334a677e2038da4d6e40097c"
  end

  depends_on "boost" => :build
  depends_on "cmake" => :build
  depends_on "doxygen" => :build
  depends_on "nlohmann-json" => :build
  depends_on "cryptopp"
  depends_on "ipfs"
  depends_on "openssl@1.1"
  depends_on "pbc"
  depends_on "readline"

  def install
    system "cmake", ".", *std_cmake_args
    system "make", ENV["MAKEFLAGS"], "install"
  end

  plist_options manual: "decentd"

  def plist
    <<~EOS
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
