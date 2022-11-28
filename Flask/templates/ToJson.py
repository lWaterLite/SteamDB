def toJsonGeneral(itemId, name, date, publisher, price):
    return {
        'itemId': itemId,
        'name': name,
        'date': str(date),
        'publisher': publisher,
        'price': price
    }
