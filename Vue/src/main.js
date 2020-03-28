import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'

import Vant from 'vant'
import 'vant/lib/index.css'
// 单独引入懒加载
// import Lazyload from 'vant/lib/Lazyload'
// import 'vant/lib/Lazyload/style'
// Vue.use(Lazyload)

// // 注册时可以配置额外的选项
// Vue.use(Lazyload, {
//   lazyComponent: true
// })

Vue.use(Vant)

Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
