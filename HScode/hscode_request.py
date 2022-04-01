import time
starttime = time.time()

import sys
import hscode_object

hscodetree = hscode_object.hscode_tree()

print(hscodetree.find(sys.argv[1]))
print("Running Time : ", time.time() - starttime)