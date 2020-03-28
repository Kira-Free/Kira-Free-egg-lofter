<template>
  <div class="home">
    <div class="header">
      <van-tabs v-model="active" animated sticky swipeable lazy-render>
        <van-tab v-for="(item,index) in arrTo" :to="arrTo[index]" :key="index" :title="index===3?'':arrName[index]">
          <div v-if="index==2" slot="title">
            <van-icon name="friends" />
          </div>
          <router-view class="van-tabs__content"></router-view>
        </van-tab>
      </van-tabs>
    </div>
  </div>
</template>

<script>
export default {
  data () {
    return {
      active: 0,
      arrName: ['关注', '订阅'],
      arrTo: ['/home/attention', '/home/subscribe', '/home/add']
    }
  },
  // mounted () {
  //   window.addEventListener('scroll', this.handleScroll)
  // },
  name: 'home',
  watch: {
    active () {
      if (this.$route.path !== this.arrTo[this.active]) {
        this.$router.push(this.arrTo[this.active])
      }
    }
  },
  computed: {
    arrToTitle () {
      return this.arrTo.slice(0, 2)
    }
  },
  methods: {
    // handleScroll () {
    // let st = document.documentElement.scrollTop || document.body.scrollTop
    // let ch = document.body.clientHeight
    // let sh = document.body.scrollHeight
    // if (st + ch === sh) {
    //   console.log('it is bottom')
    // }
    // console.log(2)
    // }
  }
}
</script>
<style lang="scss" scoped>
  .home{
    width:100%;
    height:100%;
    display: flex;
    flex-direction: column;
    align-items: center;
    .header{
      width:100%;
      flex:1;
      display: flex;
      flex-direction: column;
      .van-tabs{
        width:100%;
        flex:1;
        display: flex;
        flex-direction: column;
        color: rgba(3, 3, 3,0.5)!important;
      }
      .van-tabs__content{
        width:100%;
        flex:1;
        height:100%;
        display: flex;
        flex-direction: column;
        margin-bottom:50px;
      }
      .van-tab--active  {
        color: rgba(0, 0, 0,0.9)!important;
      }
      i{
        font-size: 21px;
        line-height: 44px;
      }
    }
  }
</style>
