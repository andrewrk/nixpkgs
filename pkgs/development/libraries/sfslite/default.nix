{ stdenv, fetchFromGitHub, gnumake, autoconf, automake, libtool, pcre, gmp, bison, flex, procps, perl }:

with stdenv.lib;

stdenv.mkDerivation rec {
  version = "2f368908c58fc3200da80a52d52265ee2591d536";
  name = "sfslite-${version}";

  src = fetchFromGitHub {
    owner = "cavedweller";
    repo = "sfslite";
    rev = "${version}";
    sha256 = "1xbrfrny690s1ix58hrqrxqlsjrmng24v8gdjbbk361mazfk0dl9";
  };

  buildInputs = [
    gnumake
    autoconf
    automake
    libtool
    pcre
    gmp
    bison
    flex
    procps
    perl
  ];

  preConfigure = ''
    export NIX_CFLAGS_COMPILE="$NIX_CFLAGS_COMPILE -Wno-error"
    sh -x setup.gnu -f -i -s
    chmod +x libtame/mkevent.pl
  '';

  meta = {
    homepage = https://github.com/cavedweller/sfslite;
    description = "SFSlite C++ development libraries";
    license = stdenv.lib.licenses.gpl2;
    platforms = stdenv.lib.platforms.unix;
  };
}
