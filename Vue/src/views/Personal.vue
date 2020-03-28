<template>
  <div class="personal">
    <div class="key" :key="getuser.id" v-if="getuser.id">
      <div class="personal_title">
        <div class="image">
          <van-image
            round
            width="80"
            height="80"
            lazy-load
            :src="getuser.image"
          />
        </div>
        <div class="name">
          <p>{{getuser.name}}</p>
          <span>ID:nian9832</span>
        </div>
        <div class="i">
          <van-icon name="arrow" />
        </div>
      </div>
      <div class="hobby">
        <router-link tag="div" :to="item.path" v-for="(item,key,index) in obj" :key="index" class="focus">
          <div class="num">{{item.number}}</div>
          <div class="name">{{item.name}}</div>
        </router-link>
      </div>
      <div class="iconList">
        <div v-for="(item,index) in arrname" :key="index" class="like">
          <div class="like_1">
            <div class="like_2">
              <van-icon class="icon" :class="'icon'+index" :name="arrnumber[index]" />
              <div>{{item}}</div>
            </div>
          </div>
        </div>
      </div>
      <div class="collapse">
        <van-collapse class="cplist" v-model="activeNameo" accordion>
          <van-collapse-item title="我的收藏" name="1">内容</van-collapse-item>
          <van-collapse-item title="达人认证" name="2">内容</van-collapse-item>
          <!-- <van-collapse-item title="设置" name="3"><van-button @click.prevent="logOut" square type="danger">退出登录</van-button></van-collapse-item> -->
        </van-collapse>
      </div>
      <div class="collapse">
        <van-collapse class="cplist" v-model="activeNamet" accordion>
          <van-collapse-item title="打赏记录" name="1">内容</van-collapse-item>
          <van-collapse-item title="个人应用" name="2">内容</van-collapse-item>
          <van-collapse-item title="设置" name="3"><van-button @click.prevent="logOut" square type="danger">退出登录</van-button></van-collapse-item>
        </van-collapse>
      </div>
    </div>
    <LoR v-else></LoR>
  </div>
</template>

<script>
import LoR from './personal/LoR.vue'
import {
  mapGetters,
  mapActions
} from 'vuex'
import Vue from 'vue'
import { Lazyload } from 'vant'
// 注册时可以配置额外的选项
Vue.use(Lazyload, {
  lazyComponent: true
})
export default {
  data () {
    return {
      activeNameo: '1',
      activeNamet: 'o',
      obj: [
        { name: '关注', number: 0, path: '/personal/attention' },
        { name: '粉丝', number: 6, path: '/personal/fan' },
        { name: '推荐', number: 2, path: '/personal/recommend' }
      ],
      arrname: ['收到的喜欢', '评论', '聊天', '通知'],
      arrnumber: ['like-o', 'chat-o', 'friends-o', 'volume-o']
    }
  },
  components: {
    LoR
  },
  async created () {
    let user = 'user'
    if (sessionStorage.getItem(user)) {
      await this.$store.dispatch('addUser', JSON.parse(sessionStorage.getItem(user)))
      // console.log([JSON.parse(sessionStorage.getItem(user))][0].id)
      // console.log(this.$store.state.user)
      // console.log(this.getuser.id)
      await this.getAttentionAuthor()
      this.obj[0].number = this.$store.state.attentionList.length
    }
  },
  computed: {
    ...mapGetters(['getuser'])
  },
  methods: {
    ...mapActions(['getAttentionAuthor']),
    logOut () {
      this.$store.dispatch('addUser', '')
      sessionStorage.removeItem('user')
    }
  }
}
</script>
<style lang="scss">
.personal{
  overflow-x: hidden;
  display:flex;
  height:100%;
  // justify-content:center;
  align-items:center;
  flex-direction:column;
  .key{
    width:100%;
  }
  .personal_title{
    width:100%;
    display:flex;
    justify-content:center;
    align-items:center;
    margin:8px;
    .image{
      flex:2;
      // background:red;
    }
    .name{
      padding-left:7px;
      text-align:left;
      flex:5;
      font-size:12px;
      color:#bbb;
      // background:blue;
      p{
        font-size:18px;
        margin:0;
        color:#000;
      }
    }
    .i{
      flex:1;
      font-size:25px;
      color:#bbb;
    }
  }
  .hobby{
    margin-top:3%;
    margin-bottom:4%;
    display:flex;
    font-size: 14px;
    width:100%;
    align-items:center;
    justify-content:space-around;
    .focus{
      flex:1;
    }
  }
  .iconList{
    box-shadow: 1px 1px 15px 1px #ddd;
    padding:8px;
    margin:2%;
    width:92%;
    display:flex;
    justify-content:center;
    align-items:center;
    border-radius: 5px;
    .like{
      font-size:10px;
      flex:1;
      text-align:center;
      .like_1{
        // background-color:red;
        .icon{
          padding:8px;
          background: linear-gradient(to bottom right,  #f00410 0%,#cf7932 80%,#f7f3f6 100%);
          border-radius:50%;
          font-size:18px;
          color:#fff;
          margin: 9px;
        }
        .icon1{
          background: linear-gradient(to bottom right,  #62f004 0%,#a5ec89 80%,#f7f3f6 100%);
        }
        .icon2{
          background: linear-gradient(to bottom right,  #0486f0 0%,#71b9e9 80%,#f7f3f6 100%);
        }
        .icon3{
          background: linear-gradient(to bottom right,  #f00410 0%,#cf329b 80%,#f7f3f6 100%);
        }
        // .icon:nth-of-type(1){
          // background-color:blue;
        // }
      }
    }
  }
  .collapse{
    box-shadow: 1px 1px 15px 1px #ddd;
    border-radius: 5px;
    padding:8px;
    margin:2%;
    margin-top:10px;
    .cplist{
      width:100%;
      display:flex;
      flex-direction:column;
    }
  }
}
</style>
