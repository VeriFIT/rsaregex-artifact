#!/bin/bash
cd experiments
sed -i 's|^ATTACK_FILE = ".*"|ATTACK_FILE = "./inputs/lf_nra_constructed.json"|' ./matchers/attack_unpacker.py

cat ./inputs/very_short.input | ./pycobench -c ./config.yaml -j 1 -t 100 -o ./results/lf.output

sed -i 's|^ATTACK_FILE = ".*"|ATTACK_FILE = "./inputs/rengar_nra_constructed.json"|' ./matchers/attack_unpacker.py

cat ./inputs/very_short.input | ./pycobench -c ./config.yaml -j 1 -t 100 -o ./results/rengar.output

cd results
./create-csvs.sh
cd ..
./eval.py
