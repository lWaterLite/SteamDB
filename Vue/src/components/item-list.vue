<template>
  <el-table :data="items" stripe>
    <el-table-column prop="item_id" label="游戏 id"></el-table-column>
    <el-table-column prop="item_launch_date" label="游戏发行时间"></el-table-column>
  </el-table>
</template>

<script>
export default {
  name: "item-list",
  data() {
    return {
      items: [
        {
          item_id: 0,
          item_launch_date: '2022/01/01'
        },
        {
          item_id: 1,
          item_launch_date: '2022/02/01'
        }
      ]
    }
  }
}
</script>

<style scoped>

</style>