#!/usr/bin/python

from attack_unpacker import unpack_attack
import sys
import subprocess

pattern, attack_string = unpack_attack(int(sys.argv[1]))

command = ["grep", "-Ez", pattern]
result = subprocess.run(command, input=attack_string, capture_output=True, text=True, shell=False)

print("result:", end="")
if result.returncode == 0:
    print(True)
elif result.returncode == 1:
    print(False)
else:
    raise Exception

