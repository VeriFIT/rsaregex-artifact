import json

ATTACK_FILE = "../rengar_nra_constructed.json"

def unpack_attack(line_num: int):
    file =  open(ATTACK_FILE, 'r')
    line = file.readlines()[line_num]

    data = json.loads(line)
    pattern = data["pattern"]
    for att_str in data["attack_strings"]:
        prefix = att_str["prefix"]
        pump = att_str["pump"]
        pump_n = att_str["pump_n"]
        suffix = att_str["suffix"]
        attack_string =  prefix+pump*pump_n+suffix
    return pattern, attack_string
