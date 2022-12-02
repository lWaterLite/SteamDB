<template>
  {{ detail }}
</template>

<script>
import {httpGet} from "../plugins/axios.js";

export default {
  name: "detail",
  mounted() {
    this.getDetail(this.language, this.itemId)
  },
  data() {
    return {
      detail: []
    }
  },
  props: {
    language: String,
    itemId: String
  },
  methods: {
    getDetail(language, itemId) {
      httpGet.get('/api/' + language + '/item/' + itemId)
          .then((res) => {
            this.detail = res.data
          })
          .catch((err) => {
            console.log(err)
          })
    }
  }
}
</script>

<style scoped>

</style>