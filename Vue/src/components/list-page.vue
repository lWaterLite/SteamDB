<template>
  <el-tabs
      v-model="value"
      type="card"
      closable
      class="detailPages"
      @tab-remove="deleteElement">
    <el-tab-pane :label="title" name="list">
      <item-list @getItem="getItemId" :language="language" mode="all"></item-list>
    </el-tab-pane>
    <el-tab-pane
        v-for="item in items"
        :label="item.name"
        :name="item.itemId">
      <detail
          :language="language"
          :itemId="item.itemId"
          @wrongSearch="cleanException"
          @languageChangeHandler="(data) => item.name = data"></detail>
    </el-tab-pane>
    <el-tab-pane
        v-for="search in searches"
        :label="search.title"
        :name="search.order">
      <item-list @getItem="getItemId" :language="language" :mode="search.mode" :param="search.param"></item-list>
      <!-- TODO 建立 search 数组，数组元素由 detail 组件的 emit 获得，title 格式为 mode（用 language 翻译过后）: param-->
    </el-tab-pane>
  </el-tabs>

</template>

<script>
import itemList from "./item-list.vue";
import detail from "./detail.vue";
import {ElMessage} from "element-plus";

export default {
  name: "list-page",
  components: {
    itemList,
    detail
  },
  data() {
    return {
      itemsIndex: 0,
      value: 'list',
      title: '游戏列表',
      languageTitles: [
        {
          language: 'zh-cn',
          title: '游戏列表',
        },
        {
          language: 'en-us',
          title: 'Game List'
        },
        {
          language: 'zh-tw',
          title: '遊戲列表'
        }
      ],
      items: [],
      searches: []
    }
  }, //data
  props: {
    language: String
  },
  watch: {
    language(newLanguage) {
      this.languageTitles.forEach((language) => {
        if (language.language === newLanguage) {
          this.title = language.title
        }
      })
    }
  },
  methods: {
    getItemId(data, name) {
      if (!this.items.find(element => element.itemId === data.toString())) {
        this.items.push({
          itemId: data.toString(),//此处 toString() 是为了迎合 name 属性为字符串这一情况，抓取数据直接使用 data 抓取
          name: name
        });
        this.itemsIndex++
      }
    },
    deleteElement(targetName) {
      if (targetName === 'list') {
        ElMessage({
          message: '列表页不可关闭',
          center: true
        })
      } else {
        if (targetName === this.value) {
          this.items.forEach((item, index) => {
            if (item.itemId === targetName) {
              if (this.itemsIndex - 1 === index) {
                if (index === 0) {
                  this.value = 'list'
                } else {
                  this.value = this.items[index - 1].itemId
                }
              } else {
                this.value = this.items[index + 1].itemId
              }
            }
          })
        }
        this.items = this.items.filter((item) => item.itemId !== targetName)
        this.itemsIndex--
      }
    },
    cleanException(itemId) {
      this.deleteElement(itemId)
    }
  }
}
</script>

<style scoped>

</style>