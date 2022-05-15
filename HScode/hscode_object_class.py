from jamo import h2j, j2hcj
import pickle
import re

class hscode_node:
    def __init__(self, code, data):
        self.code = code
        self.data = data
        self.sub = None
        self.prev = None
        self.next = None

    def get_code(self):
        return self.code
    
    def get_data(self):
        return self.data
    
    def get_sub(self):
        return self.sub

    def get_prev(self):
        return self.prev

    def get_next(self):
        return self.next

    def set_sub(self, node):
        self.sub = node

    def set_prev(self, node):
        self.prev = node

    def set_next(self, node):
        self.next = node

class hscode_linkedlist:
    def __init__(self):
        with open("HScode02.pkl", 'rb') as f02:
            file02 = pickle.load(f02)
        
        with open("HScode04.pkl", 'rb') as f04:
            file04 = pickle.load(f04)

        with open("HScode06.pkl", 'rb') as f06:
            file06 = pickle.load(f06)

        hscode02_node = []
        hscode04_node = []
        hscode06_node = []

        for code in file02:
            hscode02_node.append(hscode_node(code[:2], code[2:].replace('\n', '')))

        for code in file04:
            hscode04_node.append(hscode_node(code[:4], code[4:].replace('\n', '')))
        
        for code in file06:
            hscode06_node.append(hscode_node(code[:6], code[6:].replace('\n', '')))

        self.coderoot = hscode_node('', '')

        # hscode 0 ~ 2 connect to coderoot
        for node_idx in range(len(hscode02_node)):
            if node_idx == 0:
                self.coderoot.set_sub(hscode02_node[node_idx])
                continue

            hscode02_node[node_idx-1].set_next(hscode02_node[node_idx])
            hscode02_node[node_idx].set_prev(hscode02_node[node_idx-1])

        # hscode 0 ~ 4 connect to hscode 0 ~ 2 connect
        start_node = hscode02_node[0]
        first_cond = 0

        for node in hscode04_node:
            cond = node.get_code()[:2]

            if start_node.get_code() != cond:
                start_node = start_node.get_next()
                first_cond = 0

            if start_node.get_code() == cond:
                if first_cond == 0:
                    start_node.set_sub(node)
                    first_cond = 1 
                else:
                    prev_node.set_next(node)
                    node.set_prev(prev_node)
            
            prev_node = node

        # hscode 0 ~ 6 connect to hscode 0 ~ 2 connect
        start_idx = 0
        start_node = hscode04_node[start_idx]
        first_cond = 0

        for node in hscode06_node:
            cond = node.get_code()[:4]

            if start_node.get_code() != cond:
                start_idx += 1
                start_node = hscode04_node[start_idx]
                first_cond = 0

            if start_node.get_code() == cond:
                if first_cond == 0:
                    start_node.set_sub(node)
                    first_cond = 1 
                else:
                    prev_node.set_next(node)
                    node.set_prev(prev_node)
            
            prev_node = node

        self.hscode_data_dict = {}

        for raw_content in file06:
            content = re.sub('[().]', ',', raw_content.replace('\n', '')).replace(',,', ',')

            if content[-1] == ',':
                content = content[:-1]

            for word in content[6:].split(','):
                jamo_word = ''

                for bigram in word:
                    jamo_word += j2hcj(h2j(bigram))

                    if bigram != word[-1]:
                        jamo_word += '.'

                if jamo_word in self.hscode_data_dict:
                    self.hscode_data_dict[jamo_word].append(content[:6])
                else:
                    self.hscode_data_dict[jamo_word] = [content[:6]]
    
        self.jamo_keys = list(self.hscode_data_dict.keys())
        self.jamo_keys.sort()

    def code_to_data(self, hscode):
        hscode_length = len(hscode)
        start_node = self.coderoot.get_sub()
        output = []

        if hscode_length == 0:
            return output

        elif hscode_length == 1:
            while start_node != None and start_node.get_code()[:1] != hscode:
                start_node = start_node.get_next()

            while start_node != None and start_node.get_code()[:1] == hscode:
                output.append(start_node.get_code() + ' : ' + start_node.get_data())
                start_node = start_node.get_next()

            return output

        elif hscode_length == 2:
            while start_node != None and start_node.get_code() != hscode:
                start_node = start_node.get_next()

            if start_node is not None:
                output.append(start_node.get_code() + ' : ' + start_node.get_data())

            return output

        elif hscode_length == 3:
            while start_node != None and start_node.get_code() != hscode[:2]:
                start_node = start_node.get_next()
            start_node = start_node.get_sub()

            while start_node != None and start_node.get_code()[2] != hscode[2]:
                start_node = start_node.get_next()

            while start_node != None and start_node.get_code()[2] == hscode[2]:
                output.append(start_node.get_code() + ' : ' + start_node.get_data())
                start_node = start_node.get_next()

            return output

        elif hscode_length == 4:
            while start_node != None and start_node.get_code() != hscode[:2]:
                start_node = start_node.get_next()
            start_node = start_node.get_sub()

            while start_node != None and start_node.get_code() != hscode:
                start_node = start_node.get_next()

            if start_node is not None:
                output.append(start_node.get_code() + ' : ' + start_node.get_data())

            return output

        elif hscode_length == 5:
            while start_node != None and start_node.get_code() != hscode[:2]:
                start_node = start_node.get_next()
            start_node = start_node.get_sub()

            while start_node != None and start_node.get_code() != hscode[:4]:
                start_node = start_node.get_next()
            start_node = start_node.get_sub()

            while start_node != None and start_node.get_code()[4] != hscode[4]:
                start_node = start_node.get_next()

            while start_node != None and start_node.get_code()[4] == hscode[4]:
                output.append(start_node.get_code() + ' : ' + start_node.get_data())
                start_node = start_node.get_next()

            return output

        elif hscode_length == 6:
            while start_node != None and start_node.get_code() != hscode[:2]:
                start_node = start_node.get_next()
            start_node = start_node.get_sub()

            while start_node != None and start_node.get_code() != hscode[:4]:
                start_node = start_node.get_next()
            start_node = start_node.get_sub()

            while start_node != None and start_node.get_code() != hscode:
                start_node = start_node.get_next()

            if start_node is not None:
                output.append(start_node.get_code() + ' : ' + start_node.get_data())

            return output

    def data_to_code(self, data):
        tmp = []
        output = []

        for value in self.jamo_keys:
            if data in value:
                tmp.extend(self.hscode_data_dict[value])

        for code in list(set(tmp)):
            output.extend(self.code_to_data(code))

        return output