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
    },
    camera: {
      isPhotoTaken: false,
      mode : "",
    }
  },
  mutations: {
   // ** 로그인 시작 **//
    TOGGLE_LOGIN_STATE(state) {
      state.login.isLogin = !state.login.isLogin;
    },
    INIT(state){
      state.login.user_token = '';
      state.login.login_platform = '';
    },
    SET_USER_INFO(state, payload) {
      console.log(payload);
      state.login.user_token = payload.userInfo.userToken;
      state.login.login_platform = payload.userInfo.loginAPI;
      console.dir(state.login);
    },
     // ** 로그인 끝 **//
    
     // ** 카메라 시작 **//
    TOGGLE_CAMERA_CANVAS(state,payload) {
      state.camera.isPhotoTaken = !state.camera.isPhotoTaken;
      state.camera.mode = payload.mode;
    },

     // ** 카메라 끝 **//
  },
  actions: {},
  modules: {},
  getters: {
     // ** 로그인 시작 **//
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
     // ** 로그인 끝 **//
    
    getCameraIsPhotoTaken(state){
      return state.camera.isPhotoTaken;
    },
    getCameraMode(state){
      return state.camera.mode;
    },
  },
});
