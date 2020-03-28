<template>
    <div>
        <van-swipe indicator-color="white" :loop="false">
            <van-swipe-item v-for="(item,index) in imgArr" :key="index">
                <img v-lazy="item" @click="onchange(index)">
            </van-swipe-item>
        </van-swipe>
    </div>
</template>

<script>
import Vue from 'vue'
import { Lazyload, ImagePreview } from 'vant'

Vue.use(ImagePreview)

// 注册时可以配置额外的选项
Vue.use(Lazyload, {
  lazyComponent: true
})
export default {
  data () {
    return {
    }
  },
  props: {
    imgArr: Array
  },
  methods: {
    onchange (index) {
      ImagePreview({
        images: this.imgArr,
        showIndex: true,
        showIndicators: true,
        loop: false,
        closeOnPopstate: true,
        startPosition: index
      })
    }
  }
}
</script>
<style lang="scss">
    img{
        width:100%;
    }
</style>
