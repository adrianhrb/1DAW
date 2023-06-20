recognized_text = "Hola 50y un amig0 de 1sabel"
misinterpreted_char5 = "5"
misinterpreted_char1 = "1"
misinterpreted_char0 = "0"
normal_char = " abcdefghijklmnopqrstuvwxyz" 
corrected_text = ""

for char in recognized_text:
    if char.lower() in normal_char:
        corrected_text += char
        continue
    elif char.lower() in misinterpreted_char0:
        char_0 = char.replace(char, "o")
        corrected_text += char_0
    elif char.lower() in misinterpreted_char1:
        char_1 = char.replace(char, "i")
        corrected_text += char_1
    else:
        char_5 = char.replace(char, "s")
        corrected_text += char_5

print(corrected_text)