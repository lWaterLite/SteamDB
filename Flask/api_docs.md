## API DOCs

### /api/<string: language>/general

- 用来主界面获取全部(分页中)的所有item条目的部分信息

- param: language

  此处填入语言代码，示例：en-us, zh-cn

  请注意此处的语言代码必须是数据库中已经录入的代码，任何尝试访问未经录入代码的操作都会返回500，而不是404，同时返回"error with language code"

  请自主设计重定向功能，例如数据库中不存在zh-hk语言代码，请自动将zh-hk重定向为zh-tw

- return: array

  array中的每个元素为object

  每个object构成如下：

  - itemId: item的id，int
  
  - name: item的名称，string
  - date: item的发行日期, 格式为yyyy-mm-dd的string
  - comment: item的评价，string
  - rate: item的好评率，float
  - price：item的售价，float
  
  另外array的最后一个元素为int，代表后端在检索item时遇到的无效itemId个数

### /api/<string: language>/item/<int: item_id>

- 用来详细页获取每个item条目的具体信息

- param: language

  此处填入语言代码，与上述一致

- param: item_id

  此处填入itemId

  请注意任何非法的id请求均会导致返回500，而不是404，同时返回纯文本，内容为后端异常描述。

- return: object

  返回一个object，内容如下：

  - itemId: item的Id，int
  - name：item的名称，string
  - brief：item的简介，string
  - comment：item的评价，string
  - date：item的发行日期, 格式为yyyy-mm-dd的string
  - rate：item的好评率，float
  - price：item的售价，float
  - developer：item的开发商，array，每个元素均为string
  - publisher：item的发行商，array，每个元素均为string
  - tag：item的标签，array，每个元素均为string

### /api/<string: language>/publisher/<int: publisher_id>

- 用来查找含有特定publisher的item

- param: language

  此处填入语言代码，与上述一致

- param: publisher_id

  此处填入publisherId，请注意任何非法的id请求都会导致返回500，而不是404，同时返回文本error with publisher id

- return: array

  array中的每个元素为object

  每个object构成如下：

  - itemId: item的id，int

  - name: item的名称，string
  - date: item的发行日期, 格式为yyyy-mm-dd的string
  - comment: item的评价，string
  - rate: item的好评率，float
  - price：item的售价，float

  另外array的最后一个元素为int，代表后端在检索item时遇到的无效itemId个数

### /api/<string: language>/developer/<int: developer_id>

- 用来查找含有特定developer的item

- param: language

  此处填入语言代码，与上述一致

- param: developer_id

  此处填入developerId，请注意任何非法的id请求都会导致返回500，而不是404，同时返回文本error with developer id

- return: array

  array中的每个元素为object

  每个object构成如下：

  - itemId: item的id，int

  - name: item的名称，string
  - date: item的发行日期, 格式为yyyy-mm-dd的string
  - comment: item的评价，string
  - rate: item的好评率，float
  - price：item的售价，float

  另外array的最后一个元素为int，代表后端在检索item时遇到的无效itemId个数

### /api/<string: language>/tag/<int: tag_id>

- 用来查找含有特定tag的item

- param: language

  此处填入语言代码，与上述一致

- param: tag_id

  此处填入tagId，请注意任何非法的id请求都会导致返回500，而不是404，同时返回文本error with tag id

- return: array

  array中的每个元素为object

  每个object构成如下：

  - itemId: item的id，int

  - name: item的名称，string
  - date: item的发行日期, 格式为yyyy-mm-dd的string
  - comment: item的评价，string
  - rate: item的好评率，float
  - price：item的售价，float

  另外array的最后一个元素为int，代表后端在检索item时遇到的无效itemId个数

