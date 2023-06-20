song = '''You look so beautiful in this light
Your silhouette over me
The way it brings out the blue in your eyes
Is the Tenerife sea
And all of the voices surrounding us here
They just fade out when you take a breath
Just say the word and I will disappear
Into the wilderness'''

caracter_voices = song.find("voices")
length_voices = len("voices")


song_part1 = song[:caracter_voices]

song_part2 = song[caracter_voices + length_voices:]

new_song = song_part1 + "sounds" + song_part2

print(new_song)

