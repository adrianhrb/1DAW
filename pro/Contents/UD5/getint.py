# Versión recursiva
def getint():
    value = input("Give me an integer number: ")
    try:
        return int(value)
    except ValueError:
        print("Not a valid integer. Try it again!")
        getint()


# Versión con iteración
# def getint():
#    while True:
#        value = input("Give me an integer number: ")
#        try:
#            return int(value)
#        except ValueError:
#            print("Not a valid integer. Try it again!")
getint()
