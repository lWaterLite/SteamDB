<template>
  <el-table :data="items" stripe @row-click="rowClickHandler" style="user-select: none;">
    <el-table-column prop="itemId" :label="titles[0]"></el-table-column>
    <el-table-column prop="name" :label="titles[1]" width="400px"></el-table-column>
    <el-table-column prop="date" :label="titles[2]"></el-table-column>
    <el-table-column prop="comment" :label="titles[3]"></el-table-column>
    <el-table-column prop="rate" :label="titles[4]" width="200px"></el-table-column>
    <el-table-column prop="price" :label="titles[5]"></el-table-column>
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
      items: [],
      titles: ['游戏 id', '游戏名', '游戏发行时间', '好评度', '好评率', '售价'],
      languageTitles: [
        {
          language: 'zh-cn',
          titles: ['游戏 id', '游戏名', '游戏发行时间', '好评度', '好评率', '售价']
        },
        {
          language: 'zh-tw',
          titles: ['遊戲 id', '遊戲名', '遊戲發行時間', '好評度', '好評率', '售價']
        },
        {
          language: 'en-us',
          titles: ['Game id',' game name', 'Game launch time',' critical reception', 'critical reception rate',' Price']
        }
      ],
    }
  }, //data
  props: {
    language: String,
    mode: String,
    param: String // param 仅在 mode 不为 all 时有效
  },
  watch: {
    language(newLanguage) {
      this.getItems(newLanguage)
      this.languageTitles.forEach((language) => {
        if (language.language === newLanguage) {
          this.titles = language.titles
        }
      })
    }
  },
  methods: {
    rowClickHandler(row) {
      this.$emit('getItem', row.itemId, row.name) // itemId, name 为后端获取的游戏的 ID 和名
    },
    getItems(language) {
      if (this.mode === 'all') {
        httpGet.get('/api/' + language + '/general')
            .then((res) => {
              this.items = res.data
              this.items.pop()
            })
            .catch((err) => {
              console.log(err)
            })
      } else {
        httpGet.get('/api' + language + '/' + this.mode + '/' + this.param)
            .then((res) => {
              console.log(res)
              this.items = res.data
              this.items.pop()
            })
            .catch((err) => {
              console.log(err)
            })
      }
    },
  }
}
</script>

<style scoped>

</style>