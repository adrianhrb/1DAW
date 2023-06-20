# ******************
# SUMA CRIPTOGRÁFICA
# ******************
from pathlib import Path


def run(crypto_path: Path) -> float:
    c = {"sd":"-", "vo":".", "ax": "0", "gh":"1", "hj":"2", "uv":"3", "ws":"4", "pk":"5", "et":"6", "mc":"7", "rh":"8", "wb":"9"}
    numbers = []
    with open(crypto_path, "r") as codes:
        for line in codes:
            buffer = []
            line = line.strip()
            for i in range(0, len(line), 2):
                code = line[i:i+2]
                crypto_code = c.get(code, "")
                buffer.append(crypto_code)
            num = "".join(buffer)
            numbers.append(float(num))
    
    sum_cr = sum(numbers)
                
    return sum_cr


if __name__ == '__main__':
    run('data/sum_crypto/data1.crypto')