def toJsonGeneral(itemId, name, date, comment, rate, price):
    return {
        'itemId': itemId,
        'name': name,
        'date': str(date),
        'comment': comment,
        'rate': rate,
        'price': price
    }


def toJsonItem(itemId, name, brief, date, comment, rate, price, publisher: list, developer: list, tag: list):
    return {
        'itemId': itemId,
        'name': name,
        'brief': brief,
        'date': str(date),
        'comment': comment,
        'rate': rate,
        'price': price,
        'publisher': publisher,
        'developer': developer,
        'tag': tag
    }
