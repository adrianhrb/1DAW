# *************************
# MOVIMIENTOS DE INVENTARIO
# *************************


def run(imoves: str) -> dict:
    articles_list = imoves.split(",")
    inventory = {}
    for article in articles_list:
        article_id = article[0]
        amount = int(article[1:])
        inventory[article_id] = inventory.get(article_id, 0) + amount
        """ if article_id in inventory:
            inventory[article_id] += amount
        else:
            inventory[article_id] = amount """
    return inventory


if __name__ == '__main__':
    run('A1,B4,A-2,A7,B1,C4')
