<template>
  <div>
    <van-image
      width="100"
      height="100"
      lazy-load
      src="https://img.yzcdn.cn/vant/cat.jpeg"
    />
  </div>
</template>

<script>
// import { Lazyload } from 'vant'
import Vue from 'vue'
import { Lazyload } from 'vant'

Vue.use(Lazyload)

// 注册时可以配置额外的选项
Vue.use(Lazyload, {
  lazyComponent: true
})
export default {

}
</script>
<style lang="scss">

</style>
