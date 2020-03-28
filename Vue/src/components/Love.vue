<template>
    <div class="love">
        <div class="top"></div>
        <div class="title">
            <div class="img">
                <img :src="item.message[0].portrait"/>
            </div>
            <div class="name-time">
                <div class="name" v-text="item.message[0].w_name"></div>
                <!-- <div class="time">昨天</div> -->
                <div class="time" >{{item.message[0].time|time}}</div>
            </div>
            <div class="span_1"></div>
            <div class="i"><van-icon name="ellipsis" /></div>
        </div>
        <!-- <img src="" alt=""> -->
        <div class="img">
            <div class="img_not_show">
                <images :imgArr="imgArr" />
            </div>
            <div class="number">共{{imgArr.length}}张</div>
            <div class="details">查看完整图片</div>
        </div>
        <div class="label">
            <div class="label_1">
                <div class="label_2" v-for="(item,index) in labelArr" :key="index">{{item}}</div>
            </div>
        </div>
        <div class="icon">
            <div class="icon_left">
                <van-icon @click.stop="love=!love" :name="love?'like':'like-o'" />
                <!-- <van-icon name="like" /> -->
                <van-icon name="chat-o" />
                <!-- <van-icon name="chat" /> -->
                <van-icon :name="praise?'good-job':'good-job-o'" @click.stop="praise=!praise"/>
                <!-- <van-icon name="good-job" /> -->
            </div>
            <div class="icon_span"></div>
            <div class="icon_right">
                <!-- <van-cell is-link >展示弹出层</van-cell> -->
                <van-icon @click.stop="showPopup" name="share" />
            </div>
        </div>
        <div class="hot">22热度</div>
        <!-- {{$store.state.news}} -->
    </div>
</template>

<script>
import Vue from 'vue'
import {
  mapGetters,
  mapActions
} from 'vuex'
import { ImagePreview } from 'vant'
import images from './love/images.vue'
Vue.use(ImagePreview)
export default {
  data () {
    return {
      imgArr: [],
      labelArr: [],
      love: false,
      praise: false,
      show: false
    }
  },
  filters: {
    time: (data) => {
      let newTime = new Date().getTime() - new Date(data).getTime()
      let time = newTime / (24 * 60 * 60 * 1000)
      //   if (new Date().getTime()-newTime>) {
      //   }
      //   console.log(new Date() - newTime.getFullYear())
      //   console.log(new Date().parse())
      //   return newTime.getFullYear()
      return Math.ceil(time) + '天前'
    }
  },
  props: {
    item: Object
  },
  mounted () {
    this.imgArr = this.item.message[0].img.split(',')
    this.labelArr = this.item.message[0].label.split(',')
  },
  methods: {
    ...mapGetters(['newslist']),
    ...mapActions(['newSave']),
    getImg (images, index) {
      ImagePreview({
        images: images,
        showIndex: true,
        loop: false,
        startPosition: index
      })
    },
    showPopup () {
      this.show = true
    }
  },
  components: {
    images
  }
}
</script>

<style lang="scss">
    .love{
        width: 100%;
        display: flex;
        flex:1;
        flex-direction: column;
        .top{
            width:100%;
            height:6px;
            background:#eee;
        }
        .title{
            display:flex;
            margin:1% 3%;
            align-items:center;
            justify-content:center;
            .img{
                text-align:center;
                img{
                    width:40px;
                }
            }
            .name-time{
                flex:6;
                text-align: left;
                margin-bottom:1%;
                margin-left:2%;
                .time{
                    font-size:14px;
                }
            }
            .i{
                transform:rotate(90deg);
                color:#666;
                font-size:24px;
            }
        }
        > .img{
            width:100%;
            height:330px;
            position: relative;
            .img_not_show{
                height:330px;
                overflow:hidden;
                img{
                    margin-top:35%;
                    transform:translate(0,-45%);
                }
            }
            .number{
                position: absolute;
                top:3%;
                left:83%;
                color:#fff;
                background:rgba(3,3,3,0.5);
                border-radius:15px;
                height:22px;
                line-height:22px;
                // width:58px;
                padding: 0 2%;
                font-size:8px;
            }
            .details{
                position: absolute;
                bottom:3%;
                left:50%;
                transform:translate(-50%,0);
                background:rgba(3,3,3,0.5);
                border-radius:15px;
                color:#fff;
                // width:100px;
                font-size:12px;
                // height:24px;
                padding: 0 3%;
                line-height:24px;
            }
        }
        .label{
            height:40px;
            width:100%;
            border-bottom:#eee 1px  solid;
            .label_1{
                display:flex;
                justify-content:center;
                .label_2{
                    font-size:11px;
                    border:1px #ccc solid;
                    padding:0 5px;
                    margin:0 4px;
                    border-radius:10px;
                    height:20px;
                    line-height:20px;
                }
            }
        }
        .icon{
            display:flex;
            font-size:30px;
            margin-top:5px;
            .icon_left{
                flex:3;
                display:flex;
                justify-content:space-around;
            }
            .icon_span{
                flex:4;
            }
            .icon_right{
                flex:1;
                display:flex;
                justify-content:space-around;
            }
            i{
                color:#777;
            }
        }
        .hot{
            color:#ddd;
            font-size:8px;
            display:flex;
            flex:1;
            margin:2%;
        }
    }
    [class=van-icon-like]{
        color:red!important;
    }
</style>
