import Vue from 'vue'
import BootstrapVue from 'bootstrap-vue'

import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'

Vue.use(BootstrapVue)

import VueAnalytics from 'vue-analytics';

import App from './App.vue'
import router from './router'
import store from './store'

Vue.config.productionTip = false

Vue.use(VueAnalytics, {
  id: 'UA-154575441-1',
  router
});

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
