<template>
    <div class="found">
        <div class="search">
            <p><van-icon name="search" />我有一个朋友</p>
        </div>
        <van-tabs animated sticky swipeable lazy-render>
            <van-tab v-for="(item,index) in arrName" :to="arrTo[index]" :key="index" :title="item">
                <router-view></router-view>
            </van-tab>
        </van-tabs>
        <!-- <van-tabs sticky>
            <van-tab v-for="index in 8" :key="index" :title="'标签 ' + index">
                内容 {{ index }}
            </van-tab>
        </van-tabs> -->
    </div>
</template>

<script>
export default {
  data () {
    return {
      arrName: ['推荐', '影视', '娱乐', '旅行', '视频', '文学', '生活', '二次元', '绘画', '设计', '游戏', '摄影', '时尚'],
      arrTo: ['/found/recommended', '/found/video', '/found/entertainment']
    }
  }
}
</script>
<style lang="scss">
    .found{
        display:flex;
        flex-direction: column;
        flex-wrap: wrap;
        width: 100%;
        .search{
            margin: 1% 5%;
            width:90%;
            border-radius: 70px;
            font-size: 12px;
            height: 24px;
            line-height: 24px;
            background: rgba($color: #ccc, $alpha: 0.5);
            p{
                padding: 0;
                margin: 0;
            }
            // width: 400px;
        }
        .van-tabs{
            width: 100%;
        }
    }
    // .van-tabs{
    //     width:100%;
    // }
</style>
