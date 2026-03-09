#!/bin/bash
sed -i 's|^ATTACK_FILE = ".*"|ATTACK_FILE = "../lf_nra_constructed.json"|' attack_unpacker.py

cat ../lf_nra_con.input | ./pycobench -c ./config.yaml -j 4 -t 100 -o lf.output

sed -i 's|^ATTACK_FILE = ".*"|ATTACK_FILE = "../rengar_nra_constructed.json"|' attack_unpacker.py

cat ../rengar_nra_con.input | ./pycobench -c ./config.yaml -j 4 -t 100 -o rengar.output
