dic1 = {'b':'two','a':'one','c':'three'}                                                 

sorted_dict = sorted(dic1.items(), key=lambda d:d[1])

print(sorted_dict)