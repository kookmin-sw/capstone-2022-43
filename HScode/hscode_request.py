import time
import sys
import re
import pickle
from jamo import h2j, j2hcj

starttime = time.time()

input_value = sys.argv[1]
number_cond = re.compile('\d+')

with open('hscode_object.pkl', 'rb') as f:
    hscode = pickle.load(f)

# Blank
if len(sys.argv) == 1:
    print([])
# Input Number
elif number_cond.search(input_value) != None:
    print(hscode.code_to_data(input_value))
# Input Data
else:
    if len(input_value) > 1:
        new_input_value = ''

        for unigram in input_value:
            new_input_value += unigram

            if input_value[-1] != unigram:
                new_input_value += '.'   

        input_value = j2hcj(h2j(new_input_value))

    print(hscode.data_to_code(input_value))

print("Running Time : ", time.time() - starttime)