from flask import Flask
from sqlalchemy import and_
from json import dumps

from templates.Table import *
from templates.ToJson import *

app = Flask(__name__)  # type: Flask
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:root@localhost:3306/steamdb'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = True
app.config['SQLALCHEMY_COMMIT_TEARDOWN'] = True
db.init_app(app)


@app.route('/api/<string:language>/general', methods=['GET'])
def get_general(language):
    """
    This api is to get general items for main page.

    @param language: the requested language code.
    @return: response with Content-Type of application/json, see more in api docs.
    """
    exception_count = 0
    resource = []
    language_id = Language.query.filter_by(language=language).first().languageId
    items = Item.query.all()
    for item in items:
        try:
            itemId = item.itemId
            name = ItemNameBrief.query.filter(
                and_(ItemNameBrief.itemId == itemId, ItemNameBrief.languageId == language_id)).first().name
            date = item.itemLaunchDate
            publisher = Publisher.query.get(
                ItemPublisher.query.filter_by(itemId=itemId).first().publisherId
            ).publisher
            price = ItemPrice.query.filter(and_(ItemPrice.itemId == itemId, ItemPrice.currencyId == (
                CurrencyLanguage.query.filter_by(languageId=language_id).first().currencyId
            ))).first().price
            resource.append(toJsonGeneral(itemId, name, date, publisher, price))
        except AttributeError:
            exception_count += 1

    resource.append(exception_count)
    data = dumps(resource)

    return data, 200, {'Content-Type': 'application/json'}


if __name__ == '__main__':
    app.run()
