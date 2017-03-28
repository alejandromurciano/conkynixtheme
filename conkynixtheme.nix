with import <nixpkgs> {};
stdenv.mkDerivation rec {
  name = "conkynix";
  src = fetchFromGitHub {
    owner = "alejnd";
    repo = "conky_L3F2T_theme";
    rev = "f641e3e76e8fe0213d01ea89949b754269db36a1";
    sha256 = "1k3f3l63gjm6vvxnwnj1gvzs3ickljcqd9hl1mbdxn6lamssw7c2";
  };

  propagatedBuildInputs = [ conky ];
  buildPhase = false;
  installPhase = ''
    mkdir -p $out/bin
    cp conkyrc $out/bin
    cp logo.png $out/bin
    sed -i "s|logo.png|$out/bin/logo.png|" $out/bin/conkyrc
    echo "conky -c $out/bin/conkyrc" > $out/bin/conkynix
    chmod +x $out/bin/conkynix
  '';
}
