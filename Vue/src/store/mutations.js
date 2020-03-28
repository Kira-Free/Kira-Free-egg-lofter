
export default {
  news_list (state, { newslist, code }) {
    if (newslist) {
      if (code === 1) {
        state.news = [newslist]
      } else {
        state.news.push(newslist)
        // console.log(state.news)
      }
    } else {
      console.log('error')
    }
  },
  add_user (state, { user }) {
    state.user = user
  },
  attention_list (state, { list }) {
    state.attentionList = list
  },
  cancel_attention (state, { index }) {
    state.attentionList.splice(index, 1)
  }
}
