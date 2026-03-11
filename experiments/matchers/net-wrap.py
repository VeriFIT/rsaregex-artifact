#!/usr/bin/python

from attack_unpacker import unpack_attack
import os
import sys
import subprocess

pattern, attack_string = unpack_attack(int(sys.argv[1]))

exe_path = os.path.join("matchers", "RegexMatcherApp", "bin", "Debug", "net8.0", "RegexMatcherApp.dll")

command = ["dotnet", exe_path, attack_string, pattern]
result = subprocess.run(command,
                        capture_output=True,
                        text=True,
                        shell=False)

print("result:",end="")
if result.stdout.strip() == "True":
    print(True)
elif result.stdout.strip() == "False":
    print(False)
else:
    print(result.stdout)
    print(result.stderr)
    raise Exception
