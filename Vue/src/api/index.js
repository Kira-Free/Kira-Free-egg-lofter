import ajax from './ajax'
const apiUrl = 'http://localhost:7001'

// 请求首页数据
export const getNewsList = (index) => ajax(`${apiUrl}/axios/news`, { index })
// 密码登录
export const pwdLogin = (phone, pass, captcha) => ajax(`${apiUrl}/axios/user`, { phone, pass, captcha }, 'POST')
// 验证码对比 发送密码
export const send = (phone, captcha) => ajax(`${apiUrl}/axios/contrast`, { phone, captcha }, 'POST')
// 用户注册
export const phoneRegister = (phone, pass) => ajax(`${apiUrl}/axios/register`, { phone, pass }, 'POST')
// 获取用户关注列表
export const getAttentionAuthorList = () => ajax(`${apiUrl}/axios/getAuthorList`)
// 取消关注
export const cancelAttention = (id) => ajax(`${apiUrl}/axios/cancelAttention`, { id }, 'POST')
