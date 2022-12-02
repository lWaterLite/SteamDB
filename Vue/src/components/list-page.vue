<template>
  {{ language }}
  <el-tabs
      v-model="value"
      type="card"
      closable
      class="detailPages"
      @tab-remove="deleteElement">
    <el-tab-pane label="游戏列表" name="list">
      <item-list @getItem="getItemId" :language="language"></item-list>
    </el-tab-pane>
    <el-tab-pane
        v-for="item in items"
        :label="item.name"
        :name="item.itemId">
      <detail :language="language" :itemId="item.itemId"></detail>
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
      index: 0,
      value: 'list',
      items: []
    }
  }, //data
  props: {
    language: String
  },
  methods: {
    getItemId(data, name) {
      if (!this.items.find(element => element.itemId === data.toString())) {
        this.items.push({
          itemId: data.toString(),//此处 toString() 是为了迎合 name 属性为字符串这一情况，抓取数据直接使用 data 抓取
          name: name
        });
        this.index++
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
              if (this.index - 1 === index) {
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
        this.index--
      }
    }
  }
}
</script>

<style scoped>

</style>