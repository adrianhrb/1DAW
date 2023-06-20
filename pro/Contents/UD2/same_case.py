char1 = input("Dime algo: ")
char2 = input("Dime algo: ")
upper = char1.isupper() and char2.isupper()
lower = char1.islower() and char2.islower()
if upper or lower:
    print("1")
elif char1.isalpha() and char2.isalpha():
    print("0")
elif not char1.isalpha() or char2.isalpha():
    print("-1")