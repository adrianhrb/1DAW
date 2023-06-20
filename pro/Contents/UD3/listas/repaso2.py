entry = ["this", "is", "a", "real", "real", "real", "story"]
corrected_list = []

for element in entry:
    if element not in corrected_list:
        corrected_list.append(element)
print(corrected_list)