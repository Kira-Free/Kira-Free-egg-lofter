<template>
  <div id="app" ref="app">
    <router-view class="view"/>
    <Tabbar class="tab" v-show="$route.meta.showBottomTabBar"/>
  </div>
</template>

<script>
import Tabbar from './components/Tabber.vue'
export default {
  components: {
    Tabbar
  },
  mounted () {
    this.$refs.app.style.height = window.screen.availHeight - 50 + 'px'
  }
}
</script>

<style lang="scss" scoped>
#app {
  text-align: center;
  color: #2c3e50;
  display: flex;
  flex-direction: column;
  .view{
    flex: 1;
    display: flex;
    height:100%;
    // margin-bottom:50px;
  }
}
div::-webkit-scrollbar {
  display: none;
}
</style>
