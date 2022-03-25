from tqdm.auto import tqdm
import pandas as pd

file = pd.read_csv('관세청_HS부호_20220101.csv', encoding='cp949')
hscode = file['HS부호'].tolist()

with open('hscode02.txt', 'r', encoding='utf-8') as f:
    hs02_file = f.readlines()

category = []

for code in hscode:
    code = str(code)
    
    if len(code) < 10:
        code = '0' + code
        
    category.append(str(code)[:6])

tmp = []
hs02 = {}

for code in category:
    tmp.append(code[:2])
    
category02 = list(set(tmp))
category02.sort()

for code, data in zip(category02, hs02_file):
    hs02[code] = data.replace('\n', '')

class HSCODE_Node:
    def __init__(self, code, data):
        self.code = code
        self.data = data
        self.left = None
        self.next = None
        
    def get_code(self):
        return self.code
        
    def get_data(self):
        return self.data
    
    def get_left(self):
        return self.left
    
    def get_next(self):
        return self.next
    
    def add_left(self, left_node):
        self.left = left_node
    
    def add_next(self, next_node):
        self.next = next_node
        
    def code_to_category(self, wantcode):        
        present_node = self.left
        
        if len(wantcode) < 2:
            output_data = []
            
            while present_node.code[:1] != wantcode:
                present_node = present_node.get_next()
            
            while present_node.code[:1] == wantcode:
                output_data.append(present_node.data)
                
                if present_node.get_next() == None:
                    break
                
                present_node = present_node.get_next()
            
            return output_data
        
        while (present_node.code != wantcode and present_node.get_next() != None):
            present_node = present_node.get_next()
            
        if present_node.get_next() == None:
            return ''
        
        return present_node.data

class HSCODE_Tree:
    def __init__(self, hscode_list=None, hs02=None):
        self.root = HSCODE_Node('', 'Root')
        
        if hscode_list == None:
            print('Input hscode list')
        else:
            self.hs02 = hs02
            
            self.add(self.root, list(set(hscode_list)))
        
    def add(self, start_node, code_list):
        code_list.sort()
        tmp = []
        code02 = []
        
        for code in code_list:
            if code[:2] not in code02:
                code02.append(code[:2])
                
        for code in code02:
            tmp.append(HSCODE_Node(code, self.hs02[code]))
        
        start_node.add_left(tmp[0])
        
        idx = 1
        for node in tmp[:-1]:
            node.add_next(tmp[idx])
            idx += 1
            
    def get(self, wantcode):
        if wantcode == '':
            return ''
        
        return self.root.code_to_category(wantcode)