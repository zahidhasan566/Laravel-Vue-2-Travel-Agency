import Vue from 'vue'
import App from './App.vue'
import 'bootstrap'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap/dist/js/bootstrap.js'
import VueResource from 'vue-resource'
import VueRouter from 'vue-router'
import {routes} from './routes'
import BootstrapVue from 'bootstrap-vue'
import Toast from "vue-toastification";
import "vue-toastification/dist/index.css";
import vuetify from './plugins/vuetify'
import 'roboto-fontface/css/roboto/roboto-fontface.css'
import '@mdi/font/css/materialdesignicons.css'
import VueSidebarMenu from 'vue-sidebar-menu'
import Pagination from 'vue-pagination-2';
import PusherVue from 'pusher-vue';
import Echo from 'laravel-echo'


window.Pusher = require('pusher-js')
window.Echo = new Echo({
  broadcaster: 'pusher',
  key:'anykey',
  cluster:'ap2',
  wsHost: '127.0.0.1',
  wsPort: 6001,
  wssPort: 6001,
  forceTLS: false,
  disableStats: true,
  enabledTransports: ['ws', 'wss'],
})

const router= new VueRouter({
  routes,
  mode:'history'
})
function isLoggedIn(){

}
Vue.use(VueRouter)
Vue.use(BootstrapVue)
Vue.use(Toast)
Vue.use(VueSidebarMenu)
Vue.use(Pagination)
Vue.component('pagination', require('laravel-vue-pagination'))
Vue.use(PusherVue, {
  appKey: '8d0ff70de61b27f22f3e',
  cluster: 'ap2',
  debug: true,
  debugLevel: 'all'
});

Vue.use(VueResource);
Vue.config.productionTip = false


new Vue({
  router,
  vuetify,
  render: h => h(App)
}).$mount('#app')

Vue.filter('removeText',(value)=>{
  return value.slice(1);
})
