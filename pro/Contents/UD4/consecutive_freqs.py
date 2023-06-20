# ************************************
# FRECUENCIA DE ELEMENTOS CONSECUTIVOS
# ************************************


def cfreq(items, /, as_string=False):
    freqs = []
    if len(items) > 0:
        counter = 1
        fitem = items[0]
        for item in items[1:]:
            if item == fitem:
                counter+= 1
            else:
                freqs.append((fitem, counter))
                fitem = item
                counter = 1
        freqs.append((fitem, counter))

    if as_string:
        freqs = ",".join([f'{i}:{f}' for i, f in freqs])

    return freqs
    
    
    

