#!/usr/bin/python3.10
from attack_unpacker import unpack_attack
import sys
import re

pattern, attack_string = unpack_attack(int(sys.argv[1]))

match = re.search(pattern, attack_string)

print("result:",end="")
print(match is not None)

