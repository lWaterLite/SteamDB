<template>
  <el-table :data="items" stripe @row-click="rowClickHandler" style="user-select: none">
    <el-table-column prop="item_id" label="游戏 id" width="100px"></el-table-column>
    <el-table-column prop="item_launch_date" label="游戏发行时间"></el-table-column>
    <el-table-column prop="content" label="好评度"></el-table-column>
    <el-table-column prop="price" label="售价" width="200px"></el-table-column>
  </el-table>
</template>

<script>

export default {
  name: "item-list",
  data() {
    return {
      detail: [],
      items: [
        {
          item_id: 77658,
          item_launch_date: '2022/01/01',
          content: '特别好评',
          price: 98
        },
        {
          item_id: 33412,
          item_launch_date: '2022/02/01',
          content: '褒贬参半',
          price: 48
        }
      ]
    }
  }, //data
  methods: {
    rowClickHandler(row) {
      console.log(row.item_id)
      this.$emit('getItem', row.item_id, row)
    }
  }
}
</script>

<style scoped>

</style>