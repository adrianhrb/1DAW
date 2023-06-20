for l_num in range (0, 6 + 1):
    for r_num in range (0, 6 + 1):
        if l_num <= r_num:
            print(f'{l_num}|{r_num}', end=" ")
    print()