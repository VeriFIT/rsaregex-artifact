#!/bin/bash

echo "Installing PCRE2..."
tar xzvf pcre2.py.tar.gz
cd ./pcre2.py

python3.10 -m pip install . --no-index --no-build-isolation

