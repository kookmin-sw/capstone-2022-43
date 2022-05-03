import time
import pickle
import hscode_object_class
import sys

starttime = time.time()

if len(sys.argv) == 1:
    print("Argument input is required. ( -1 : Update hscode file, -2 : Update hscode object, -3 : Update all )")
    sys.exit()
elif sys.argv[1] == '-1':
    # hscode file
    with open('HScode02.txt', 'r', encoding='utf-8') as f02:
        file02 = f02.readlines()

    with open('HScode04.txt', 'r', encoding='utf-8') as f04:
        file04 = f04.readlines()

    with open('HScode06.txt', 'r', encoding='utf-8') as f06:
        file06 = f06.readlines()

    with open('HScode02.pkl', 'wb') as f2:
        pickle.dump(file02, f2)

    with open('HScode04.pkl', 'wb') as f4:
        pickle.dump(file04, f4)

    with open('HScode06.pkl', 'wb') as f6:
        pickle.dump(file06, f6)

elif sys.argv[1] == '-2':
    # hscode object
    hscode = hscode_object_class.hscode_linkedlist()

    with open('hscode_object.pkl', 'wb') as f:
        pickle.dump(hscode, f)

elif sys.argv[1] == '-3':
    # hscode file
    with open('HScode02.txt', 'r', encoding='utf-8') as f02:
        file02 = f02.readlines()

    with open('HScode04.txt', 'r', encoding='utf-8') as f04:
        file04 = f04.readlines()

    with open('HScode06.txt', 'r', encoding='utf-8') as f06:
        file06 = f06.readlines()

    with open('HScode02.pkl', 'wb') as f2:
        pickle.dump(file02, f2)

    with open('HScode04.pkl', 'wb') as f4:
        pickle.dump(file04, f4)

    with open('HScode06.pkl', 'wb') as f6:
        pickle.dump(file06, f6)

    # hscode object
    hscode = hscode_object_class.hscode_linkedlist()

    with open('hscode_object.pkl', 'wb') as f:
        pickle.dump(hscode, f)

else:
    print("Please enter appropriate argument")

print("Update Completed.")
print("Running Time : ", time.time() - starttime)