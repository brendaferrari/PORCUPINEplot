#!/bin/bash

echo starting Porcupine Generator;

for dir in input/*; 

do cp porcupineGenerator/{modevectors.py,script.pml} "$dir";

cd "$dir";

shopt -s extglob;

if ls -l *.{pdb,dcd};

then echo Starting "${dir##*/}" Porcupine Generator;

pymol script.pml; 

rm -f {modevectors.py,script.pml};

cd ../..;

echo "${dir##*/}" Porcupine Generator ended;

else echo No .pdb or .dcd files on directory. Please verify; 

cd ../..; fi; done