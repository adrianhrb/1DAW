names = ['ana', 'pepa', 'maria']

total_length = 0
def len_analize(things):
    global total_length
    if len(things) == 0:
        return total_length
    total_length += len(things[0])
    return len_analize(things[1:])

print(len_analize(names))