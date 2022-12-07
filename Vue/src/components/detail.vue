<template>
  <el-descriptions
      border
      :column="3"
      size="large"
      :title="detail.name"
  >
    <el-descriptions-item :label="titles[0]" span="3">{{ detail.brief }}</el-descriptions-item>
    <el-descriptions-item :label="titles[1]">{{ detail.date }}</el-descriptions-item>
    <el-descriptions-item :label="titles[2]">{{ detail.price }} ¥</el-descriptions-item>
    <el-descriptions-item :label="titles[3]">{{ detail.rate * 100 }} %</el-descriptions-item>
    <el-descriptions-item :label="titles[4]" span="3">
      <el-tag v-for="publisher in publishers" @click="searchList('publisher', publisher)">{{ publisher }}</el-tag>
    </el-descriptions-item>
    <el-descriptions-item :label="titles[5]" span="3">
      <el-tag v-for="developer in developers" @click="searchList('developer', developer)">{{ developer }}</el-tag>
    </el-descriptions-item>
    <el-descriptions-item :label="titles[6]" span="3">
      <el-tag v-for="tag in tags" @click="searchList('tag', tag)">{{ tag }}</el-tag>
    </el-descriptions-item>
  </el-descriptions>
</template>

<script>
import {httpGet} from "../plugins/axios.js";

export default {
  name: "detail",
  emits: ['wrongSearch', 'languageChangeHandler', 'searchList'],
  mounted() {
    this.getDetail(this.language, this.itemId)
    this.changeTitleByLanguage(this.language)
  },
  data() {
    return {
      detail: {},
      tags: [],
      titles: ['简介', '游戏发行时间', '价格', '好评率', '制作商', '发行商', '标签'],
      publishers: [],
      developers: [],
      languageTitles: [
        {
          language: 'zh-cn',
          titles: ['简介', '游戏发行时间', '价格', '好评率', '制作商', '发行商', '标签']
        },
        {
          language: 'en-us',
          titles: ['Brief Introduction', 'Game Release Time', 'Price', 'Rate', 'Producers', 'Publisher', 'Tags']
        },
        {
          language: 'zh-tw',
          titles: ['簡介', '遊戲發行時間', '價格', '好評率', '製作商', '發行商', '標簽']
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
      this.changeTitleByLanguage(newLanguage)
    }
  },
  methods: {
    getDetail(language, itemId) {
      httpGet.get('/api/' + language + '/item/' + itemId)
          .then((res) => {
            this.tags = []
            this.publishers = []
            this.developers = []
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
    },
    searchList(mode, title) {
      let param
      for (name in this.detail) {
        if (name === mode) {
          const arr = this.detail[name]
          arr.forEach((e) => {
            for (name in e) {
              if (e[name] === title) {
                param = name
              }
            }
          })
          break
        }
      }
      this.$emit('searchList', mode, param, title)
    },
    changeTitleByLanguage(newLanguage) {
      this.languageTitles.forEach((language) => {
        if (language.language === newLanguage) {
          this.titles = language.titles
        }
      })
    }
  }
}
</script>

<style scoped>

</style>