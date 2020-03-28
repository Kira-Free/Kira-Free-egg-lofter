import {
  getNewsList,
  getAttentionAuthorList,
  cancelAttention
} from '../api'
import { Toast } from 'vant'

export default {

  async newSave ({ commit }, object) {
    const result = await getNewsList(object.index || 1)
    if (result.success_code === 200) {
      if (object.index === 1) {
        commit('news_list', { newslist: result, code: 1 })
      } else {
        commit('news_list', { newslist: result })
      }
    } else {
      Toast(result.message)
    }
  },
  addUser ({ commit }, user) {
    commit('add_user', { user })
  },
  async getAttentionAuthor ({ commit }) {
    const result = await getAttentionAuthorList()
    if (result.success_code === 200) {
      commit('attention_list', { list: result.message })
    }
  },
  async cancelAttentionAction ({ commit }, object) {
    const result = await cancelAttention(object.id)
    if (result.success_code !== 200) {
      Toast('取消关注失败，请重新刷新')
      return
    }
    commit('cancel_attention', { index: object.index })
  }

}
