from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()  # type: SQLAlchemy


class Item(db.Model):
    __tablename__ = 'item'
    itemId = db.Column('item_id', db.Integer, primary_key=True)
    itemLaunchDate = db.Column('item_launch_date', db.DateTime)


class Comment(db.Model):
    __tablename__ = 'comment'
    commentId = db.Column('comment_id', db.Integer, primary_key=True, autoincrement=True)
    comment = db.Column('comment', db.String(30))


class Currency(db.Model):
    __tablename__ = 'currency'
    currencyId = db.Column('currency_id', db.Integer, primary_key=True, autoincrement=True)
    currency = db.Column('currency', db.String(5))


class Developer(db.Model):
    __tablename__ = 'developer'
    developerId = db.Column('developer_id', db.Integer, primary_key=True, autoincrement=True)
    developer = db.Column('developer', db.String(30))


class Language(db.Model):
    __tablename__ = 'language'
    languageId = db.Column('language_id', db.Integer, primary_key=True, autoincrement=True)
    language = db.Column('language', db.String(15), default='undefined')


class Publisher(db.Model):
    __tablename__ = 'publisher'
    publisherId = db.Column('publisher_id', db.Integer, primary_key=True, autoincrement=True)
    publisher = db.Column('publisher', db.String(30))


class Tag(db.Model):
    __tablename__ = 'tag'
    tagId = db.Column('tag_id', db.Integer, primary_key=True, autoincrement=True)
    tag = db.Column('tag', db.String(20))


class CommentLanguage(db.Model):
    __tablename__ = 'comment_language'
    commentLanguageId = db.Column('comment_language_id', db.Integer, primary_key=True, autoincrement=True)
    commentId = db.Column('comment_id', db.Integer, db.ForeignKey('comment.comment_id'), unique=True, nullable=False)
    languageId = db.Column('language_id', db.Integer, db.ForeignKey('language.language_id'), unique=True,
                           nullable=False)
    comment = db.Column('comment', db.String(30), default='undefined')


class ItemComment(db.Model):
    __tablename__ = 'item_comment'
    itemCommentId = db.Column('item_comment_id', db.Integer, primary_key=True, autoincrement=True)
    itemId = db.Column('item_id', db.Integer, db.ForeignKey('item.item_id'), unique=True, nullable=False)
    commentId = db.Column('comment_id', db.Integer, db.ForeignKey('comment.comment_id'), unique=True, nullable=False)
    rate = db.Column('rate', db.Float, default=0)


class ItemDeveloper(db.Model):
    __tablename__ = 'item_developer'
    itemDeveloperId = db.Column('item_develop_id', db.Integer, primary_key=True, autoincrement=True)
    itemId = db.Column('item_id', db.Integer, db.ForeignKey('item.item_id'), unique=True, nullable=False)
    developerId = db.Column('developer_id', db.Integer, db.ForeignKey('developer.developer_id'), unique=True,
                            nullable=False)


class ItemNameBrief(db.Model):
    __tablename__ = 'item_name_brief'
    nameId = db.Column('name_id', db.Integer, primary_key=True, autoincrement=True)
    itemId = db.Column('item_id', db.Integer, db.ForeignKey('item.item_id'), unique=True, nullable=False)
    languageId = db.Column('language_id', db.Integer, db.ForeignKey('language.language_id'), unique=True,
                           nullable=False)
    name = db.Column('name', db.String(50), default='undefined')
    brief = db.Column('brief', db.Text)


class ItemPrice(db.Model):
    __tablename__ = 'item_price'
    priceId = db.Column('price_id', db.Integer, primary_key=True, autoincrement=True)
    itemId = db.Column('item_id', db.Integer, db.ForeignKey('item.item_id'), unique=True, nullable=False)
    currencyId = db.Column('currency_id', db.Integer, db.ForeignKey('currency.currency_id'), unique=True,
                           nullable=False)
    price = db.Column('price', db.Float, default=0)


class ItemPublisher(db.Model):
    itemPublisherId = db.Column('item_publisher_id', db.Integer, primary_key=True, autoincrement=True)
    itemId = db.Column('item_id', db.Integer, db.ForeignKey('item.item_id'), unique=True, nullable=False)
    publisherId = db.Column('publisher_id', db.Integer, db.ForeignKey('publisher.publisher_id'), unique=True,
                            nullable=False)


class ItemTag(db.Model):
    itemTag = db.Column('item_tag_id', db.Integer, primary_key=True, autoincrement=True)
    itemId = db.Column('item_id', db.Integer, db.ForeignKey('item.item_id'), unique=True, nullable=False)
    tagId = db.Column('tag_id', db.Integer, db.ForeignKey('tag.tag_id'), unique=True, nullable=False)


class TagLanguage(db.Model):
    tagLanguageId = db.Column('tag_language_id', db.Integer, primary_key=True, autoincrement=True)
    tagId = db.Column('tag_id', db.Integer, db.ForeignKey('tag.tag_id'), unique=True, nullable=False)
    languageId = db.Column('language_id', db.Integer, db.ForeignKey('language.language_id'), unique=True,
                           nullable=False)
    tag = db.Column('tag', db.String(20), default='undefined')


class CurrencyLanguage(db.Model):
    currencyLanguageId = db.Column('currency_language_id', db.Integer, primary_key=True, autoincrement=True)
    currencyId = db.Column('currency_id', db.Integer, db.ForeignKey('currency.currency_id'), unique=True,
                           nullable=False)
    languageId = db.Column('language_id', db.Integer, db.ForeignKey('language.language_id'), unique=True,
                           nullable=False)
