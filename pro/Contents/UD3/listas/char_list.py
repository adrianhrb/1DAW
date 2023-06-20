text = ['uno', 'dos', 'tres']
chars = []

'''for thing in text:
    for char in thing:
        chars.append(char)'''
for thing in text:
    chars.extend(thing)

print(chars)
