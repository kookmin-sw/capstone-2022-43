import re
import pickle
from jamo import h2j, j2hcj

def change_word(word):
    new_input_value = ''

    for unigram in word:
        new_input_value += unigram

        if word[-1] != unigram:
            new_input_value += '.'

    return new_input_value

def get_hscode(argv):
    number_cond = re.compile('[^\d]+')

    with open('hscode_object.pkl', 'rb') as f:
        hscode = pickle.load(f)

    # Blank
    if len(argv) == 0:
        return []
    # Input Number
    elif number_cond.search(argv) == None:
        return hscode.code_to_data(argv)
    # Input Data
    else:
        ext = hscode.get_extension_dict()
        ex = {}
        argv = argv.replace(' ', ',').replace(',,', ',').split(',')
        tmp = []

        for data in argv:
            input_value = change_word(data)
            input_value = j2hcj(h2j(input_value))

            if data in list(ext.keys()):
                ex.update(hscode.data_to_code(j2hcj(h2j(change_word(ext[data])))))

            tmp.append(hscode.data_to_code(input_value))

        tmp_output = []
        tmp_output_dic = {}
        output = {}

        for out in tmp:
            tmp_output.extend(list(out.keys()))

        for out in tmp_output:
            if out in tmp_output_dic:
                tmp_output_dic[out] += 1
            else:
                tmp_output_dic[out] = 1
        
        tmp_output_dic = dict(filter(lambda elem : elem[1] == len(argv), tmp_output_dic.items()))

        for t in tmp_output_dic:
            output.update(hscode.code_to_data(t))

        output.update(ex)

        return output

# test code
"""
import sys

tmp = ''

if len(sys.argv) == 2:
    tmp += sys.argv[1]
elif len(sys.argv) > 2:
    for i in sys.argv[1:]:
        if i != sys.argv[-1]:
            tmp += i + ' '
        else:
            tmp += i

print(get_hscode(tmp))
"""