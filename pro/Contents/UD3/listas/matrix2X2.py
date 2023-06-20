A = [[6, 4], [8, 9]]
B = [[3, 2], [1, 7]]

"""element1_A = A[0][0]
element2_A = A[0][1]
element3_A = A[1][0]
element4_A = A[1][1]
element1_B = B[0][0]
element2_B = B[0][1]
element3_B = B[1][0]
element4_B = B[1][1]

pos1 = element1_A * element1_B + element2_A * element3_B
pos2 = element1_A * element2_B + element2_A * element4_B
pos3 = element3_A * element1_B + element4_A * element3_B
pos4 = element3_A * element2_B + element4_A * element4_B

line1 = [pos1, pos2]
line2 = [pos3, pos4]
new_matrix = [line1, line2]
print(new_matrix)"""

pos1 = A[0][0] * B[0][0] + A[0][1] * B[1][0]
pos2 = A[0][0] * B[0][1] + A[0][1] * B[1][1]
pos3 = A[1][0] * B[0][0] + A[1][1] * B[1][0]
pos4 = A[1][0] * B[0][1] + A[1][1] * B[1][1]

fila1 = [pos1, pos2]
fila2 = [pos3, pos4]
new_matrix = [fila1, fila2]
print(new_matrix)