#!/bin/bash
cd experiments
./run-measurements.sh
cd results
./create-csvs.sh
cd ..
./eval.py > "evaluation-results.txt"
