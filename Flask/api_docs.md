## API DOCs

### /api/<string: language>/general

- 用来主界面获取全部(分页中)的所有item条目的部分信息

- param: language

  此处填入语言代码，示例：en-us, zh-cn

  请注意此处的语言代码必须是数据库中已经录入的代码，任何尝试访问未经录入代码的操作都会返回500，而不是404

  请自主设计重定向功能，例如数据库中不存在zh-hk语言代码，请自动将zh-hk重定向为zh-tw

- return: array

  array中的每个元素为object

  每个object构成如下：

  - itemId: item的id，int
  
  - name: item的名称，string
  - date: item的发行日期, 格式为yyyy-mm-dd的string
  - publisher：item的发行商，string
  - price：item的售价，float
  
  另外array的最后一个元素为int，代表后端在检索item时遇到的无效itemId个数