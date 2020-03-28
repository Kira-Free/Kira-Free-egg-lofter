<template>
  <div class="login">
    <van-nav-bar title="登录LOFTER" @click-left="onClickLeft" left-arrow/>
    <div class="pop">
      <van-field
      type="tel"
      label="手机号"
      name="phone"
      onKeypress="javascript:if(event.keyCode == 32)event.returnValue = false"
      maxlength="11"
      v-model="phone"
      placeholder="请输入手机号"
      />
      <div class="password">
        <van-field class="pass"
        label="密码" name="pass"
        onKeypress="javascript:if(event.keyCode == 32)event.returnValue = false"
        maxlength='16'
        :type="swicth?'tel':'password'"
        v-model="pass"
        placeholder="请输入密码"
        />
        <van-icon class="eye" @click="swicth=!swicth" :name="swicth?'closed-eye':'eye-o'" />
      </div>
      <div class="captcha">
        <van-field
        class="input_captcha"
        v-model="captcha"
        name="captcha"
        type="tel"
        label="验证码"
        placeholder="请输入验证码"
        maxlength="4"
        onKeypress="javascript:if(event.keyCode == 32)event.returnValue = false"
        />
        <div class="img_captcha">
          <img
          src="http://localhost:7001/axios/captcha"
          ref="captcha"
          class="get_verification"
          alt="captcha"
          />
        </div>
        <van-icon class="refresh" @click="refresh" name="replay" />
      </div>
      <span>登录遇到问题 ？</span>
    </div>
    <van-button type="info" @click.prevent="login">登录</van-button>
  </div>
</template>

<script>
import { mapActions } from 'vuex'
import { Toast } from 'vant'
import { pwdLogin } from '../../api'
export default {
  data () {
    return {
      phone: '',
      pass: '',
      swicth: false,
      captcha: '',
      userInfo: []
    }
  },
  methods: {
    ...mapActions(['addUser']),
    onClickLeft () {
      this.$router.back(-1)
    },
    refresh () {
      this.$refs.captcha.src = `http://localhost:7001/axios/captcha?time=${new Date()}`
    },
    async login () {
      if (!this.phone) {
        Toast('手机号不能为空')
        this.refresh()
        return
      } else if (!this.pass) {
        Toast('密码不能为空')
        return
      } else if (!this.captcha) {
        Toast('验证码为空')
        this.refresh()
        return
      } else if (!(/^[1][3,4,5,7,8]\d{9}$/.test(this.phone))) {
        Toast('请输入正确的手机号码')
        this.refresh()
        return
      } else if (this.pass.length < 3) {
        Toast('密码过短')
        this.refresh()
        return
      } else if (this.captcha.length < 4) {
        Toast('验证码过短')
        this.refresh()
        return
      }
      let result = await pwdLogin(this.phone, this.pass, this.captcha)
      console.log(result)
      // if (data.success_code === 200) {
      //   // this.$store.state.user = data.message
      //   sessionStorage.setItem('user', JSON.stringify(data.message[0]))
      //   this.$store.dispatch('addUser', JSON.parse(JSON.stringify(result.message[0])))
      //   console.log(this.$store.state.user)
      //   // this.$router.back(-1)
      // }
      if (result.success_code === 200) {
        this.userInfo = JSON.parse(JSON.stringify(result.message[0]))
        sessionStorage.setItem('user', JSON.stringify(result.message[0]))
        // console.log(result)
        // console.log(this.userInfo)
        // console.log(result.message[0])
        // console.log(JSON.parse(JSON.stringify(result.message[0])))
        // console.log(result.message[0].id)
        // console.log(result.message[0].phone)
      } else {
        this.userInfo = {
          message: '登录失败，密码或验证码不正确'
        }
        this.refresh()
      }
      if (!this.userInfo.id) {
        Toast(this.userInfo.message)
      } else {
        this.addUser(this.userInfo)
        this.$router.back(-1)
      }
    }
  }
}
</script>
<style lang="scss" scoped>
  .login{
    display:flex;
    flex-direction:column;
    .pop{
      // flex:1;
      display:flex;
      flex-direction:column;
      height:55%;
      justify-content:center;
      .password{
        display:flex;
        .pass{
          flex:5;
        }
        .eye{
          flex:1;
          line-height:44px;
        }
      }
      span{
        font-size:13px;
        color:#aaa;
      }
      .captcha{
        display: flex;
        justify-content: center;
        height: 44px;
        line-height: 44px;
        .input_captcha{
          flex:6;
        }
        .img_captcha{
          flex: 3;
          line-height: 44px;
          height: 44px;
          img{
            height: 44px;
          }
        }
        .refresh{
          flex:1;
          line-height: 44px;
        }
      }
    }
  }
</style>
