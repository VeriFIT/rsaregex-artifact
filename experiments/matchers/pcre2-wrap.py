#!/usr/local/bin/python3.10

from attack_unpacker import unpack_attack
import sys
import pcre2

REPEAT_COUNT = 1

pattern, attack_string = unpack_attack(int(sys.argv[1]))

try:
    compiled_pattern = pcre2.compile(pattern)
    match = compiled_pattern.match(attack_string)
except Exception as e:
    if str(e) == "No match":
        print("result:False")
        exit(0)
    else:
        raise Exception
print(f"result:True")
