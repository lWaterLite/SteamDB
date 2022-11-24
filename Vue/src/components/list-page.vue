<template>
  <el-tabs
      v-model="activeLanguageR"
      class="language-tabs">
    <el-tab-pane label="English" name="en"><item-list language_id="1"></item-list></el-tab-pane>
    <el-tab-pane label="简体中文" name="zh_cn"><item-list language_id="2"></item-list></el-tab-pane>
    <el-tab-pane label="繁体中文" name="zh_tw"><item-list language_id="3"></item-list></el-tab-pane>
  </el-tabs>

</template>

<script>
/*import service from '../plugins/axios.js'*/
import {ref} from 'vue'
import itemList from "./item-list.vue";

export default {
  name: "list-page",
  components: {
    itemList
  },
  data() {
    return {
      activeLanguageR: ref('zh_cn'),
      language: 'zh_cn',
    }
  }, //data
  methods: {
    getItems() {

    },
  }
}
</script>

<style scoped>

</style>