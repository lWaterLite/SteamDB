<template>
  <div class="common-layout">
    <el-container>
      <el-header class="el-header" height="100px" style="user-select: none">
        steam 游戏管理
        <el-select
            v-model="value"
            class="language"
            placeholder="选择语言"
            size="small"
            style="position: absolute; right: 10px; height: 5px;">
          <el-option v-for="item in languages" :key="item.language_id" :label="item.language_label"
                     :value="item.language_name" style="user-select: none"></el-option>
        </el-select>
      </el-header>
      <el-container>
        <el-aside width="200px" style="height: 300px; user-select: none">
          <el-menu
              default-active="1"
              class="el-menu"
          >
            <el-menu-item index="1" style="font-family: serif; font-size: large">
              <svg height="20px" viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg" data-v-029747aa="">
                <path fill="currentColor"
                      d="M224 704h576V318.336L552.512 115.84a64 64 0 0 0-81.024 0L224 318.336V704zm0 64v128h576V768H224zM593.024 66.304l259.2 212.096A32 32 0 0 1 864 303.168V928a32 32 0 0 1-32 32H192a32 32 0 0 1-32-32V303.168a32 32 0 0 1 11.712-24.768l259.2-212.096a128 128 0 0 1 162.112 0z"></path>
                <path fill="currentColor"
                      d="M512 448a64 64 0 1 0 0-128 64 64 0 0 0 0 128zm0 64a128 128 0 1 1 0-256 128 128 0 0 1 0 256z"></path>
              </svg>
              <span style="margin-left: 10px">游戏列表</span>
            </el-menu-item>
          </el-menu>
        </el-aside>
        <el-main>
          <list-page :language="value"></list-page>
        </el-main>
      </el-container>
    </el-container>
  </div>
</template>


<script>
import listPage from "./components/list-page.vue";

export default {
  name: 'App',
  data() {
    return {
      value: 'zh-cn',
      languages: [
        {
          language_id: 1,
          language_label: 'English',
          language_name: 'en-us'
        },
        {
          language_id: 2,
          language_label: '简体中文',
          language_name: 'zh-cn'
        },
        {
          language_id: 3,
          language_label: '繁体中文',
          language_name: 'zh-tw'
        },

      ]
    }
  },
  components: {
    listPage
  },
  methods: {

  }
}
</script>

<style>
body {
  margin: 0;
  padding: 0;
  background-color: #f2f3f5;
}

.el-header {
  background-color: #79bbff;
  font-size: x-large;
  font-family: serif;
  line-height: 100px;
}
</style>
