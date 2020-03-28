<template>
    <div class="lor">
        <div class="lofter">
            <h1>LOFTER</h1>
            <h4>让兴趣|更有趣</h4>
        </div>
        <div class="v-btn">
            <van-button @click="login" round type="info">登录</van-button>
            <van-button @click="register" round>注册</van-button>
        </div>
        <p class="p_one">稍后再说</p>
        <div class="agreementreement">
            <van-checkbox v-model="checked" shape="square" @click="!checked">
            </van-checkbox>
             <p class="reading">
                同意<a href="javascript:;">网易LORTER服务协议</a>和<a href="javascript:;">网易LOFTER隐私政策</a> 和<a href="javascript:;">网易LOFTER儿童个人信息保护规则及监护人须知</a>
            </p>
        </div>
    </div>
</template>
<script>
import { Toast } from 'vant'
export default {
  data () {
    return {
      checked: false
    }
  },
  methods: {
    login () {
      if (this.checked !== true) {
        Toast('请阅读网易LORTER协议')
        return
      }
      this.$router.push('/personal/login')
    },
    register () {
      if (this.checked !== true) {
        Toast('请阅读网易LORTER协议')
        return
      }
      this.$router.push('/personal/register')
    }
  }
}
</script>
<style lang="scss" scoped>
    .lor{
        height:100%;
        display: flex;
        flex-direction: column;
        align-items: center;
        background-color:rgba($color: #000000, $alpha: 0.5);
        // padding-bottom: 50px;
        position: relative;
        .lofter{
            margin-top: 15%;
            height: 50%;
            align-items: center;
            justify-content: center;
            color: #fff;
        }
        .v-btn{
            margin: 10% 0;
            width: 100%;
            .van-button{
                width: 35%;
                margin:0 3% ;
            }
            .van-button--default{
                color:#fff;
                background-color:transparent;
            }
        }
        .p_one{
            width: 15%;
            padding: 3px 9px;
            font-size: 12px;
            background: rgba($color: #000000, $alpha: 0.2);
            border-radius: 13px
        }
        .agreementreement{
            display: flex;
            margin:5% 10%;
            // position: absolute;
            // bottom: 88px;
            .van-checkbox{
                flex: 1;
            }
            .reading{
                flex: 6;
                font-size: 9px;
                a{
                    text-decoration: underline;
                    color: #fff;
                }
            }
        }
    }
</style>
