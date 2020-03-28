<template>
  <div class="register">
    <van-nav-bar title="注册LOFTER" @click-left="onClickLeft" left-arrow/>
    <div class="pop">
      <van-field
      type="tel"
      label="+86"
      name="phone"
      onKeypress="javascript:if(event.keyCode == 32)event.returnValue = false"
      maxlength="11"
      v-model="phone"
      @input="state = !(/^[1][3,4,5,7,8]\d{9}$/.test(phone))"
      placeholder="请输入11位中国大陆手机号码"
      >
        <van-button slot="button" :disabled="state" size="small" @click.prevent="send" type="primary">发送验证码</van-button>
      </van-field>
      <br>
      <!-- 密码输入框 -->
      <van-password-input
        :value="value"
        info="密码为 4 位数字"
        :length="4"
        :focused="showKeyboard"
        @focus="showKeyboard = true"
      />

      <!-- 数字键盘 -->
      <van-number-keyboard
        :show="showKeyboard"
        @input="onInput"
        @delete="onDelete"
        @blur="showKeyboard = false"
      />
    </div>
    <van-button type="info" @click.prevent="register">下一步</van-button>
    <van-dialog
    v-model="show"
    title="图形验证码"
    show-cancel-button
    @confirm="confirm"
    >
      <div class="div">
        <van-field
        class="input"
        maxlength=4
        onKeypress="javascript:if(event.keyCode == 32)event.returnValue = false"
        v-model="captcha"
        autofocus="autofocus"
        />
        <img
        :src="src"
        ref="captcha"
        class="get_verification"
        alt="captcha"
        />
        <van-icon class="refresh" @click="refresh" name="replay" />
      </div>
    </van-dialog>
  </div>
</template>

<script>
import { send, phoneRegister } from '../../api'
import { mapActions } from 'vuex'
import { Toast } from 'vant'
export default {
  data () {
    return {
      phone: '',
      state: true,
      show: false,
      captcha: '',
      src: 'http://localhost:7001/axios/captcha',
      value: '',
      showKeyboard: false
    }
  },
  methods: {
    ...mapActions(['addUser']),
    onClickLeft () {
      this.$router.back(-1)
    },
    async register () {
      // console.log('1')
      let result = await phoneRegister(this.phone, this.value)
      console.log(result)
      if (result.success_code === 200) {
        sessionStorage.setItem('user', JSON.stringify(result.message[0]))
        this.addUser(JSON.parse(JSON.stringify(result.message[0])))
        this.$router.back(-1)
      } else {
        Toast(result.message)
      }
    },
    // 获取验证码
    send () {
      this.show = !this.show
      this.src = `http://localhost:7001/axios/captcha?time=${new Date()}`
    },
    async confirm () {
      if (!this.captcha) {
        Toast('验证码为空')
        return
      } else if (this.captcha.length < 4) {
        Toast('验证码不能少于四位')
        this.captcha = ''
        return
      }
      console.log(this.captcha)
      // this.sendCaptcha(this.captcha)
      let result = await send(this.phone, this.captcha)
      this.captcha = ''
      console.log(result)
      if (result.success_code === 200) {
        this.value = result.message
      } else {
        Toast(result.message)
      }
    },
    refresh () {
      this.src = `http://localhost:7001/axios/captcha?time=${new Date()}`
    },
    onInput (key) {
      this.value = (this.value + key).slice(0, 4)
    },
    onDelete () {
      this.value = this.value.slice(0, this.value.length - 1)
    }
  }
}
</script>
<style lang="scss" scoped>
  .register{
    display:flex;
    flex-direction:column;
    .pop{
        display:flex;
        // align-items:center;
        flex-direction:column;
        margin:  20% 0;
    }
    .div{
        display:flex;
        align-items:center;
        .input{
            flex:3;
        }
        .get_verification{
            flex:4;
        }
        .refresh{
            flex:1;
        }
    }
  }
</style>
