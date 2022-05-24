import pickle

def extension():

    with open('hs_extension.pkl', 'rb') as ex:
        ex_file = pickle.load(ex)

    alternative_dic = {}

    for elems in ex_file:
        elems = elems.replace('\n', '').split(":")

        alternative_dic[elems[0]] = elems[1]

    return alternative_dic