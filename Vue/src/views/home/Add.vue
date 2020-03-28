<template>
    <div class="add">
        <van-nav-bar title="添加关注" left-arrow @click-left="onClickLeft">
        </van-nav-bar>
        <van-tabs v-model="active" animated sticky color="blue" swipeable>
          <!-- <div ref="view" class="ref"> -->
            <van-tab  v-for="(item,index) in arrTo" :to="arrTo[index]" :key="index" :title="arrName[index]">
              <router-view ></router-view>
            </van-tab>
          <!-- </div> -->
        </van-tabs>
    </div>
</template>

<script>
export default {
  data () {
    return {
      active: 0,
      arrName: ['小编推荐', '猜你喜欢', '同城热门'],
      arrTo: ['/home/add/recommended', '/home/add/guess', '/home/add/popular']
    }
  },
  methods: {
    onClickLeft () {
      this.$router.push('/home/attention')
    }
  },
  watch: {
    active () {
      if (this.$route.path !== this.arrTo[this.active]) {
        this.$router.push(this.arrTo[this.active])
      }
    }
  }
}
</script>
<style lang="scss" scoped>
    .add{
      display: flex;
      height:100%;
      flex-direction: column;
    }
</style>
