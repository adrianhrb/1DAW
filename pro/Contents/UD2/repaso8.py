str1 = "0001010011101"
str2 = "0000110010001"
diff_char = 0

for i in range(len(str1)):
    if str1[i] != str2[i]:
        diff_char += 1

print(diff_char)




    
            