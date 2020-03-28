<template>
  <div class="attention">
    <van-nav-bar title="我的关注" left-arrow @click-left="onClickLeft"/>
    <div class="search">
      <van-search class="searchipt" shape="round" value="search" v-model="search" placeholder="请输入搜索关键词" bind:search="onSearch"/>
      <van-button class="searchbtn" type="default">搜索</van-button>
    </div>
    <div class="context">
      <div v-for="(item, index) in getAttentionList" :key="item.id" class="content">
        <div class="img">
          <van-image
            round
            fit="cover"
            width="40"
            height="40"
            lazy-load
            :src="item.image"
          />
        </div>
        <div class="user">
          <div class="name">{{item.name}}</div>
          <div class="introduce van-ellipsis">{{item.introduce}}</div>
        </div>
        <div class="switchbtn">
          <van-button v-show="!item.attention" round size="small" type="info">关注</van-button>
          <van-button v-show="item.attention" @click="notAttention(item.id, index)" round size="small" color="#aaa">已关注</van-button>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import Vue from 'vue'
import { Lazyload, Toast } from 'vant'
import {
  mapGetters,
  mapActions
} from 'vuex'
// 注册时可以配置额外的选项
Vue.use(Lazyload, {
  lazyComponent: true
})
export default {
  data () {
    return {
      search: '',
      Focus: true,
      attentionList: []
    }
  },
  async created () {
    await this.getAttentionAuthor()
  },
  methods: {
    ...mapActions(['getAttentionAuthor', 'cancelAttentionAction']),
    onClickLeft () {
      this.$router.back()
    },
    async notAttention (id, index) {
      await this.cancelAttentionAction({ id, index })
      Toast('取消关注' + index)
      console.log(id)
    }
  },
  computed: {
    ...mapGetters(['getAttentionList'])
  }
}
</script>

<style lang="scss" scoped>
.attention{
  display: flex;
  height: 100%;
  flex-direction: column;
  .search{
    align-items: center;
    display: flex;
    flex-direction: row;
    .searchipt{
      flex: 8;
    }
    .searchbtn{
      flex: 2;
      border: none;
    }
  }
  .context{
    display: flex;
    flex-direction: column;
    .content{
      display: flex;
      flex-direction: row;
      align-items: center;
      padding: 10px;
      border-top: solid 1px #eee;
      // border-bottom: solid 1px #eee;
      .img{
        flex: 3;
      }
      .user{
        text-align: start;
        flex: 8;
        .name{
          font-size: 21px;
        }
        .introduce{
          font-size: 12px;
          color: #888;
        }
      }
      .switchbtn{
        flex: 3;
      }
    }
  }
}
</style>
