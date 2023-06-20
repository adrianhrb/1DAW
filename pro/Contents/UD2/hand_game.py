person1_election = input("Persona 1: ¿Piedra, papel o tijeras?: ")
person2_election = input("Persona 2: ¿Piedra, papel o tijeras?: ")
person1 = person1_election.lower()
person2 = person2_election.lower()

if person2 == person1:
        print(f'Hay un empate entre {person1} y {person2}')

if person1 == "piedra":
    if person2 == "tijeras":
        print(f'Gana la persona 1 porque la {person1} aplasta a las {person2}')
    elif person2 == "papel":
        print(f'Gana la persona 2 porque el {person2} envuelve a la {person1}')
    

if person1 == "papel":
    if person2 == "tijeras":
        print(f'Gana la persona 2 porque las {person2} cortan al {person1}')
    elif person2 == "piedra":
        print(f'Gana la persona 1 porque el {person1} envuelve a la {person2}')
    

if person1 == "tijeras":
    if person2 == "papel":
        print(f'Gana la persona 1 porque las {person1} cortan al {person2}')
    elif person2 == "piedra":
        print(f'Gana la persona 2 porque la {person2} aplasta a las {person1}')
    






