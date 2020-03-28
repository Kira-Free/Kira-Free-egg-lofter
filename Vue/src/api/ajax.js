import axios from 'axios'

export default function ajax (url = '', params = {}, type = 'GET') {
  let promise
  return new Promise((resolve, reject) => {
    if (type === 'GET') { // 判断请求的方式
      let paramsStr = ''// 拼接请求字符串
      Object.keys(params).forEach(key => {
        paramsStr += key += '=' + params[key] + '&'
      })
      // 过滤最后的&
      if (paramsStr !== '') {
        paramsStr = paramsStr.substr(0, paramsStr.lastIndexOf('&'))
      }
      // 完整路径
      url += '?' + paramsStr
      // 发送GET请求
      promise = axios(url)
    } else if (type === 'POST') {
      promise = axios.post(url, params)
    }
    promise.then((result) => {
      resolve(result.data)
    }).catch((err) => {
      console.log(err)
    })
  })
}
