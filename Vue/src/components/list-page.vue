<template>
  {{ language }}
  <el-tabs
      v-model="value"
      type="card"
      closable
      class="detailPages"
      @tab-remove="deleteElement">
    <el-tab-pane label="游戏列表" name="list">
      <item-list @getItem="getItemId"></item-list>
    </el-tab-pane>
    <el-tab-pane
        v-for="item in items"
        :key="item.order"
        :label="item.item_id"
        :name="item.item_id">
      {{ item.item_id }}
    </el-tab-pane>
  </el-tabs>

</template>

<script>
/*import service from '../plugins/axios.js'*/
import itemList from "./item-list.vue";
import {ElMessage} from "element-plus";

export default {
  name: "list-page",
  components: {
    itemList
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
  watch: {
    language(newLanguage, oldLanguage) {
      console.log(newLanguage, oldLanguage)
    }
  },
  methods: {
    getItemId(data) {
      if (!this.items.find(element => element.item_id === data.toString()))
        this.items.push({
          order: (this.index++).toString(),
          item_id: data.toString(),//此处 toString() 是为了迎合 name 属性为字符串这一情况，抓取数据直接使用 data 抓取
        });
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
            if (item.item_id === targetName) {
              if (this.index - 1 === index) {
                if (index === 0) {
                  this.value = 'list'
                } else {
                  this.value = this.items[index - 1].item_id
                }
              } else {
                this.value = this.items[index + 1].item_id
              }
            }
          })
        }
        this.items = this.items.filter((item) => item.item_id !== targetName)
        this.index--
      }
    }
  }
}
</script>

<style scoped>

</style>