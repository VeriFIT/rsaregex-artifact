#!/usr/bin/python3.10
from attack_unpacker import unpack_attack
import sys
import time
sys.path.append("..")
import rsaregex as rsa
import signal
import traceback


def timeout_handler(signum, frame):
    print("\nDet Timeout occurred!", file=sys.stderr)
    print(f"Time:{time.process_time()-t0}", file=sys.stderr)
    traceback.print_stack(frame)
    sys.exit(1)  # Exit immediately


pattern, attack_string = unpack_attack(int(sys.argv[1]))

rsa_result = rsa.create_rsa(pattern)
t0 = time.process_time()
signal.signal(signal.SIGTERM, timeout_handler)
match_rsa = rsa_result.run_word(attack_string)
t1 = time.process_time()

matchtime = t1-t0

print(f"result:{match_rsa}")
print(f"matchtime:{matchtime}")

