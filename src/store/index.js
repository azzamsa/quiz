import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    result: 0
  },
  mutations: {
    updateResult: (state,  numCorrect) => {
      state['result'] = numCorrect
    }
  },
  actions: {
    updateResult: ({ commit }, numCorrect) => {
      // call the mutation
      commit('updateResult', numCorrect)
    }
  },
  modules: {
  }
})
