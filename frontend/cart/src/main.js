import Vue from 'vue';
import App from './App.vue';
import router from './router';
import store from './store';
import Vuetify from 'vuetify';
import 'vuetify/dist/vuetify.min.css';
import VueStar from 'vue-star';
Vue.use(Vuetify);
Vue.config.productionTip = false;
Vue.component('VueStar', VueStar)





window.Kakao.init('9408758ec57aaebe1b8dba4464919e72');
window.Kakao.isInitialized();
new Vue({
  vuetify: new Vuetify(),
  router,
  store,
  render: (h) => h(App),
}).$mount('#app');
