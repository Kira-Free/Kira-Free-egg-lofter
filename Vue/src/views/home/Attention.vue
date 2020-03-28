<template>
  <div>
    <van-pull-refresh
      v-model="isLoading"
      success-text="刷新成功"
      @refresh="onRefresh"
    >
      <van-swipe :autoplay="3000" indicator-color="white">
        <van-swipe-item><img src="https://img.yzcdn.cn/vant/apple-1.jpg"></van-swipe-item>
        <van-swipe-item><img src="https://img.yzcdn.cn/vant/apple-2.jpg"></van-swipe-item>
        <van-swipe-item><img src="https://img.yzcdn.cn/vant/apple-1.jpg"></van-swipe-item>
        <van-swipe-item><img src="https://img.yzcdn.cn/vant/apple-2.jpg"></van-swipe-item>
      </van-swipe>
      <love v-for="(item,index) in newslist" :item='item' :key="index"/>
    </van-pull-refresh>
    <!-- {{newslist}} -->
  </div>
</template>

<script>
import {
  mapGetters,
  mapActions
} from 'vuex'
import love from '../../components/Love.vue'
export default {
  data () {
    return {
      isLoading: false,
      images: [
        'https://img.yzcdn.cn/vant/apple-1.jpg',
        'https://img.yzcdn.cn/vant/apple-2.jpg'
      ]
    }
  },
  mounted () {
    this.newSave({ index: 1 })
    window.addEventListener('scroll', this.handleScroll)
  },
  methods: {
    ...mapActions(['newSave']),
    onRefresh () {
      console.log(this.newslist.length)
      this.newSave({ index: 1 })
      this.$nextTick(() => {
        setTimeout(() => {
          this.isLoading = false
        }, 500)
      })
      // window.addEventListener('scroll', this.handleScroll)
    },
    async handleScroll (e) {
    //   let scrollTop = document.body.scrollTop
    //   let clientHeight = document.body.clientHeight
      var scrollTop = document.documentElement.scrollTop || document.body.scrollTop
      // 变量windowHeight是可视区的高度
      var windowHeight = document.documentElement.clientHeight || document.body.clientHeight
      // 变量scrollHeight是滚动条的总高度
      var scrollHeight = document.documentElement.scrollHeight || document.body.scrollHeight
      // 滚动条到底部的条件
      // let h = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight
      // 浏览器高度
      if (scrollTop + windowHeight === scrollHeight) {
        // window.removeEventListener('scroll', this.handleScroll)
        // console.log(this.$store.state.news.length)
        // console.log(1111)
        await setTimeout(() => { this.newSave({ index: this.$store.state.news.length + 1 }) }, 1000)
      }
    }
  },
  components: {
    love
  },
  computed: {
    ...mapGetters(['newslist'])
  },
  destroyed () {
    // 页面离开后销毁，防止切换路由后上一个页面监听scroll滚动事件会在新页面报错问题
    window.removeEventListener('scroll', this.handleScroll)
  }
}
</script>
<style lang="scss" scoped>
  img{
    width:100%;
    height: 200px;
  }
  .cell{
    padding:0;
  }
</style>
