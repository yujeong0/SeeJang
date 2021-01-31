import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    detail: {
      product_name: "",
      product_price: "",
      link: "",
      score: "",
      comment: "",
    },
    login: {
      user_token: "",
      login_platform: "",
      isLogin: false,
      user_id: "",
      user_email: "",
      user_nickname: "",
    },
  },
  mutations: {
    TOGGLE_LOGIN_STATE(state) {
      state.login.isLogin = !state.login.isLogin;
    },
    INIT(state){
      state.login.user_token = '';
      state.login.login_platform = '';
      state.login.user_id = '';
      state.login.user_email = '';
      state.login.user_nickname = '';
    },
    SET_USER_INFO(state, payload) {
      console.log(payload);
      state.login.user_token = payload.userInfo.userToken;
      state.login.login_platform = payload.userInfo.loginAPI;
      state.login.user_id = payload.userInfo.userId;
      state.login.user_email = payload.userInfo.userEmail;
      state.login.user_nickname = payload.userInfo.userNickName;
      console.dir(state.login);
    },
  },
  actions: {},
  modules: {},
  getters: {
    getPlatform(state){
      return state.login.login_platform;
    },
    getIsLogin(state){
      return state.login.isLogin;
    },
    getUserNickName(state){
      return state.login.user_nickname;
    },
    getUserToken(state){
      return state.login.user_token;
    },
    getProductName(state) {
      return state.detail.product_name;
    },
    getProductPrice(state) {
      return state.detail.product_price;
    },
  },
});
