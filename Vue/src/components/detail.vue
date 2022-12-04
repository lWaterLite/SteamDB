<template>
  {{ detail }}
  <div>{{ detail.name }}</div>
  <div>
    <span>{{ detail.brief }} </span>
    <el-divider></el-divider>
    <span>{{ titles[0] }}:{{ detail.date }}</span>
    <span>{{ titles[1] }}:{{ detail.price }}￥</span>
    <span>{{ titles[2] }}:{{ (detail.rate * 100) }}%</span>
    <span>{{ titles[3] }}:<el-tag v-for="publisher in publishers">{{ publisher }}</el-tag> </span>
    <span>{{ titles[4] }}:<el-tag v-for="developer in developers">{{ developer }}</el-tag> </span>
    <el-divider></el-divider>
    {{ titles[5] }}:
    <el-tag v-for="tag in tags">{{ tag }}</el-tag>
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
      detail: {},
      tags: [],
      titles: ['游戏发行时间', '价格', '好评率', '制作商', '发行商', '标签'],
      publishers: [],
      developers: [],
      languageTitles: [
        {
          language: 'zh-cn',
          titles: ['游戏发行时间', '价格', '好评率', '制作商', '发行商', '标签']
        },
        {
          language: 'en-us',
          titles: ['game release time', 'price', 'rate', 'producers', 'publisher', 'tags']
        },
        {
          language: 'zh-tw',
          titles: ['遊戲發行時間', '價格', '好評率', '製作商', '發行商', '標簽']
        }
      ]
    }
  },
  props: {
    language: String,
    itemId: String
  },
  watch: {
    language(newLanguage) {
      this.getDetail(newLanguage, this.itemId)
      this.titles = this.languageTitles.find((tag) => tag.language === newLanguage).titles
    }
  },
  methods: {
    getDetail(language, itemId) {
      httpGet.get('/api/' + language + '/item/' + itemId)
          .then((res) => {
            this.detail = res.data
            this.$emit('languageChangeHandler', res.data.name)
            this.detail.tag.forEach((tag) => {
              for (name in tag) {
                this.tags.push(tag[name])
              }
            })
            this.detail.developer.forEach((developer) => {
              for (name in developer) {
                this.developers.push(developer[name])
              }
            })
            this.detail.publisher.forEach((publisher) => {
              for (name in publisher) {
                this.publishers.push(publisher[name])
              }
            })
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