<template>
<div >{{detail.name}}
</div>
<div>
<span>{{detail.brief}} </span>
  <el-divider></el-divider>
<span><p>date:{{detail.date}}</p>
  <p>price:{{detail.price}}￥</p>
  <p>rate:{{(detail.rate*100)}}%</p>
<p>publisher:<el-tag v-for="publisher in detail.publisher">{{publisher}}</el-tag> </p></span>
<el-divider></el-divider>
<span>tags:<el-tag v-for="tag in detail.tag">{{tag}}</el-tag> </span>
</div>
</template>

<script>
import {httpGet} from "../plugins/axios.js";

export default {
  name: "detail",
  emits: ['wrongSearch', 'languageChangeHandler'],
  mounted() {
    this.getDetail(this.language, this.itemId)
  },
  data() {
    return {
      detail:{}
    }
  },
  props: {
    language: String,
    itemId: String
  },
  watch: {
    language(newLanguage) {
      this.getDetail(newLanguage, this.itemId)
    }
  },
  methods: {
    getDetail(language, itemId) {
      httpGet.get('/api/' + language + '/item/' + itemId)
          .then((res) => {
            this.detail = res.data
            this.$emit('languageChangeHandler', res.data.name)
          })
          .catch(() => {
            this.$emit('wrongSearch', this.itemId)
          })
    }
  }
}
</script>

<style scoped>

</style>