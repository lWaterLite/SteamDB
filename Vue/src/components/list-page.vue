<template>
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
  methods: {
    getItemId(data) {
      if (!this.items.find(element => element.item_id === data.toString()))
        this.items.push({
          order: (this.index++).toString(),
          item_id: data.toString(),
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