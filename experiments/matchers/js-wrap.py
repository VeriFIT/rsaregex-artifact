#!/usr/local/bin/python3.10

from attack_unpacker import unpack_attack
import sys
import subprocess

pattern, attack_string = unpack_attack(int(sys.argv[1]))

command = ["node", "./matchers/regexMatcher.js", attack_string, pattern]
result = subprocess.run(command,
                        capture_output=True,
                        text=True,
                        shell=False)
print("result:",end="")
if result.stdout.strip() == "true":
    print(True)
elif result.stdout.strip() == "false":
    print(False)
else:
    raise Exception
