<template>
  {{language_id}}
  <el-table :data="items" stripe @row-click="rowClickHandler">
    <el-table-column prop="item_id" label="游戏 id" width="100px"></el-table-column>
    <el-table-column prop="item_name" label="游戏名"></el-table-column>
    <el-table-column prop="publisher" label="发行商"></el-table-column>
    <el-table-column prop="item_launch_date" label="游戏发行时间" width="200px"></el-table-column>
  </el-table>
</template>

<script>

export default {
  name: "item-list",
  props: {
    language_id: String
  },
  data() {
    return {
      items: [
        {
          item_id: 0,
          item_launch_date: '2022/01/01',
          item_name: '《使命召唤®：现代战争®II 2022》 | 《战争地带2.0》',
          publisher: 'Activision'
        },
        {
          item_id: 1,
          item_launch_date: '2022/02/01',
          item_name: '饥荒联机版',
          publisher: 'KLei'
        }
      ]
    }
  }, //data
  methods: {
    rowClickHandler(row, event, column) {
      console.log(row.item_id)
    }
  }
}
</script>

<style scoped>

</style>