#!/bin/sh
nix run nixpkgs#catimg -- -H 30 "${1}" | nix run git+https://git.sr.ht/~zethra/term2alpha > "$(basename "${1%.*}").lua"
