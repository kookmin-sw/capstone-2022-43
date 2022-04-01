import sys
import hscode_object

hscodetree = hscode_object.hscode_linkedlist()

print(hscodetree.code_to_data(sys.argv[1]))
