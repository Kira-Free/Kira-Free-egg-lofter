<template>
    <div>
        <div class="img_box" v-for='(item2,index) of images' :key='index'>
            <img :src="item2" alt="" @click="getImg(item2,index)">
        </div>
    </div>
</template>

<script>
import Vue from 'vue'
import { ImagePreview } from 'vant'
Vue.use(ImagePreview)
export default {
  data () {
    return {
      show: false,
      index: 0,
      images: [
        'https://img.yzcdn.cn/1.jpg',
        'https://img.yzcdn.cn/2.jpg'
      ]
    }
  },
  methods: {
    getImg (images, index) {
      ImagePreview({
        images: this.images,
        showIndex: true,
        loop: false,
        startPosition: index
      })
    }
  }
}
</script>
<style lang="scss">

</style>
