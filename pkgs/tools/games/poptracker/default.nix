{ lib
, stdenv
, fetchFromGitHub
, SDL2
, SDL2_image
, SDL2_ttf
, openssl
, util-linux
, yad
, which
}:

stdenv.mkDerivation {
    name = "poptracker";

    src = fetchFromGitHub {
        owner = "black-sliver";
        repo = "PopTracker";
        rev = "0eda2e64c4b72288c2ec2209d012c92f26b795f4";
        sha256 = "sha256-VWKpN7b6rV0frMGERThX04jRcddQaf9svvgTfS+Ofek=";
        fetchSubmodules = true;
    };

    nativeBuildInputs = [ SDL2 SDL2_ttf SDL2_image openssl util-linux ];
    buildInputs = [ SDL2 SDL2_ttf SDL2_image openssl yad which ];

    installPhase = ''
    	install -Dm755 -t $out/bin build/linux-x86_64/poptracker
    	cp -r assets $out/bin
    '';

    meta = with lib; {
       homepage = "https://github.com/black-sliver/PopTracker";
       description = "A universal, scriptable tracker for game randomizers";
       license = licenses.gpl3Only;
       platforms = platforms.unix;
       mainProgram = "poptracker";
    };
}
