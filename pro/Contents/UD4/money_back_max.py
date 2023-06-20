# **************************
# AQUÍ TIENE SU VUELTA (MAX)
# **************************


def run(to_give_back: float, available_currencies: dict) -> dict:
    money_back = {}
    currencies = sorted(available_currencies)[::-1]
    exchange = to_give_back
    for i in currencies:
        back = exchange // i
        if back > available_currencies[i]:
            money_back[i] = available_currencies[i]
            exchange -= available_currencies[i] * i
        else:
            exchange %= i
            if back > 0:
                money_back[i] = back
                
    
    if exchange != 0:
        money_back = None

    return money_back


if __name__ == '__main__':
    run(0, {0.5: 5, 0.2: 5, 0.1: 5})