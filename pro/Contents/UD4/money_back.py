# ********************
# AQUÍ TIENE SU VUELTA
# ********************


def run(to_give_back: float, available_currencies: list) -> dict:
    money_back = {}
    exchange = to_give_back
    currencies = sorted(available_currencies)[::-1]
    for currency in currencies:
        if exchange > 0:
            back = exchange // currency
            back = exchange // currency
            exchange %= currency
            money_back[currency] = back 

                
    if exchange > 0:
        money_back = None
    return money_back


if __name__ == '__main__':
    run(20, [5, 2, 1])

    