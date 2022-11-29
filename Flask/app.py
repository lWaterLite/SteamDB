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
    data = []
    try:
        language_id = Language.query.filter_by(language=language).first().languageId
    except AttributeError:
        return 'error with language code', 500, {'Content-Type': 'text/plain'}
    items = Item.query.all()
    for item in items:
        try:
            item_id = item.itemId
            name = ItemNameBrief.query.filter(
                and_(ItemNameBrief.itemId == item_id, ItemNameBrief.languageId == language_id)).first().name
            date = item.itemLaunchDate
            t = ItemComment.query.filter_by(itemId=item_id).first()
            rate = t.rate
            comment = CommentLanguage.query.filter(
                and_(CommentLanguage.commentId == t.commentId,
                     CommentLanguage.languageId == language_id)).first().comment
            price = ItemPrice.query.filter(and_(ItemPrice.itemId == item_id, ItemPrice.currencyId == (
                CurrencyLanguage.query.filter_by(languageId=language_id).first().currencyId
            ))).first().price
            data.append(toJsonGeneral(item_id, name, date, comment, rate, price))
        except AttributeError:
            exception_count += 1

    data.append(exception_count)
    data = dumps(data)

    return data, 200, {'Content-Type': 'application/json'}


@app.route('/api/<string:language>/item/<int:item_id>', methods=['GET'])
def get_item_by_id(language, item_id):
    """
    This api is to get single item details by id.

    @param language: the requested language code.
    @param item_id: the requested item id.
    @return: response with Content-Type of application/json, see more in api docs.
    """
    try:
        language_id = Language.query.filter_by(language=language).first().languageId
    except AttributeError:
        return 'error with language code', 500, {'Content-Type': 'text/plain'}
    try:
        date = Item.query.get(item_id).itemLaunchDate
        t = ItemNameBrief.query.filter(
            and_(ItemNameBrief.itemId == item_id, ItemNameBrief.languageId == language_id)).first()
        name = t.name
        brief = t.brief
        price = ItemPrice.query.filter(and_(ItemPrice.itemId == item_id, ItemPrice.currencyId == (
            CurrencyLanguage.query.filter_by(languageId=language_id).first().currencyId
        ))).first().price
        t = ItemPublisher.query.filter_by(itemId=item_id).all()
        publisher = []
        for i in t:
            publisher.append(
                Publisher.query.get(i.publisherId).publisher
            )
        t = ItemComment.query.filter_by(itemId=item_id).first()
        rate = t.rate
        comment = CommentLanguage.query.filter(
            and_(CommentLanguage.commentId == t.commentId,
                 CommentLanguage.languageId == language_id)).first().comment
        t = ItemDeveloper.query.filter_by(itemId=item_id).all()
        developer = []
        for i in t:
            developer.append(
                Developer.query.get(i.developerId).developer
            )
        t = ItemTag.query.filter_by(itemId=item_id).all()
        tag = []
        for i in t:
            tag.append(
                TagLanguage.query.filter(
                    and_(TagLanguage.tagId == i.tagId, TagLanguage.languageId == language_id)
                ).first().tag
            )
    except AttributeError as e:
        return str(e), 500, {'Content-Type': 'text/plain'}

    data = toJsonItem(item_id, name, brief, date, comment, rate, price, publisher, developer, tag)
    data = dumps(data)

    return data, 200, {'Content-Type': 'application/json'}


if __name__ == '__main__':
    app.run()
