country_selection = input("Escoge un país entre (Israel, Hungría, Alemania o China): ")
country = country_selection.capitalize()
if country == "Hungria":
    country = country.replace("i", "í")

if country == "España":
    print("🇪🇸")
elif country == "Israel":
    print("🇮🇱")
elif country == "Hungría":
    print("🇭🇺")
elif country == "Alemania":
    print("🇩🇪")
elif country == "China":
    print("🇨🇳")