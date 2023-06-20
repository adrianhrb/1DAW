# *****************
# ALFABETO CIRCULAR
# *****************

def alphabet_gen(limit):
    ALPHABET = "abcdefghijklmnopqrstuvwxyz"
    for i in range(limit):
        current_pos = i % len(ALPHABET)
        yield ALPHABET[current_pos]
            
    
        


def run(max_letters: int) -> str:
    return "".join(alphabet_gen(max_letters))
    



    return 


if __name__ == '__main__':
    run(0)




"""     def alphabet_gen(limit: int):
        alphabet = list("abcdefghijklmnopqrstuvwxyz")
        counter = 0
        while True:
            for char in alphabet:
                counter += 1
                if counter == limit + 1:
                    return
                yield char

    text = ''
    letter_gen = alphabet_gen(max_letters)
    for char in letter_gen:
        text += char """