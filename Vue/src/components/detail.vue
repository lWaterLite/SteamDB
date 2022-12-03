<template>
  {{ detail }}
</template>

<script>
import {httpGet} from "../plugins/axios.js";

export default {
  name: "detail",
  emits:['wrongSearch', 'languageChangeHandler'],
  mounted() {
    this.getDetail(this.language, this.itemId)
  },
  data() {
    return {
      detail: {},
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