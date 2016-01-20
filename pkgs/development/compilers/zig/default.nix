{ clangStdenv, fetchFromGitHub, cmake, clang_37, llvm_37 }:

clangStdenv.mkDerivation rec {
  version = "0.0.0";
  name = "zig-${version}";

  src = /home/andy/dev/zig;

  #src = fetchFromGitHub {
  #  owner = "andrewrk";
  #  repo = "zig";
  #  rev = "${version}";
  #  sha256 = "0xnv0rsan57i07ky823jczylbcpbzjk6j06fw9x0md65arcgcqfy";
  #};

  dontStrip = true;
  cmakeFlags = "-DCMAKE_BUILD_TYPE=Debug -DZIG_LIBC_DIR=${clangStdenv.cc.libc}/lib";

  buildInputs = [ cmake clang_37 llvm_37 ];

  meta = with clangStdenv.lib; {
    description = "zig programming language";
    homepage = http://github.com/andrewrk/zig;
    license = licenses.mit;
    platforms = platforms.unix;
    maintainers = [ maintainers.andrewrk ];
  };
}
