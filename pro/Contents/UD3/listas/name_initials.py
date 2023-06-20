fullname = "Delgado Quintero, sergio"

este_name_list = fullname.title()
name_list = este_name_list.split(",")
name = name_list[1]
surnames = name_list[0]
surnames_list = surnames.split()
surname1 = surnames_list[0]
if len(surnames_list) > 1:
    surname2 = surnames_list[1]
    initials = f"{name[1]}.{surname1[0]}.{surname2[0]}."
else:
    initials = f"{name[1]}.{surname1[0]}."

print(initials)