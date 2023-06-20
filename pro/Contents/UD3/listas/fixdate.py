american_date = "12/30/20"
print("La fecha americana es:", american_date)
changed_date = american_date.split("/")
day = changed_date[1]
month = changed_date[0]
year = "20" + changed_date[2]
OUTPUT_SEP = "-"
european_date = [day, month, year]

output_european_date = OUTPUT_SEP.join(european_date)

print("La fecha europea es:", output_european_date)
