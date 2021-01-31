import Vue from 'vue';
import Vuex from 'vuex';

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    detail: {
      product_name: '',
      product_price: '',
      link: '',
      score: '',
      comment :''
    }
  },
  mutations: {},
  actions: {},
  modules: {},
  getters: {
    getProductName(state) {
      return state.product_name;
    },
    getProductPrice(state) {
      return state.product_price;
    },
  },
});
