<template>
  <el-table :data="items" stripe @row-click="rowClickHandler" style="user-select: none">
    <el-table-column prop="itemId" label="游戏 id" width="100px"></el-table-column>
    <el-table-column prop="name" label="游戏名" width="500px"></el-table-column>
    <el-table-column prop="date" label="游戏发行时间"></el-table-column>
    <el-table-column prop="comment" label="好评度"></el-table-column>
    <el-table-column prop="rate" label="好评率"></el-table-column>
    <el-table-column prop="price" label="售价" width="200px"></el-table-column>
  </el-table>
</template>

<script>
import {httpGet} from '../plugins/axios.js'

export default {
  name: "item-list",
  mounted() {
    this.getItems(this.language)
  },
  data() {
    return {
      detail: [],
      items: []
    }
  }, //data
  props: {
    language: String
  },
  watch: {
    language(newLanguage) {
      this.getItems(newLanguage)
    }
  },
  methods: {
    rowClickHandler(row) {
      this.$emit('getItem', row.itemId, row.name) // itemId, name 为后端获取的游戏的 ID 和名
    },
    getItems(language) {
      httpGet.get('/api/' + language + '/general')
          .then((res) => {
            console.log(res)
            this.items = res.data
            this.items.pop()
          })
          .catch((err) => {
            console.log(err)
          })
    },
  }
}
</script>

<style scoped>

</style>