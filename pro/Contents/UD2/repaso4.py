word = "hello-world"

for letter in word:
    if not letter.isalpha():
        print("Cracteres no alfabéticos")
        break
else:
    print("Todo ok")