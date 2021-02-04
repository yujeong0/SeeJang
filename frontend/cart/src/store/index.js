import Vue from 'vue';
import Vuex from 'vuex';

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    login: {
      user_token: '',
      login_platform: '',
      isLogin:
        sessionStorage.getItem('isLogin') == 'false' || sessionStorage.getItem('isLogin') == null
          ? false
          : true,
      member_id: sessionStorage.getItem('userId'),
    },
    camera: {
      isPhotoTaken: false,
      isClicked: false,
      mode: '',
      item: '',
    },
    product: {
      total: 0,
      category: "",
      productName: "",
      productNo: 0,
      productPrice: "",
    },
  },
  mutations: {
    //** 상품정보 **/
    SET_PRODUCT_INFO(state, payload) {
      console.log(payload);
      console.dir(payload);
      state.product.category= payload.productInfo.category
      state.product.productName= payload.productInfo.productName
      state.product.productNo= payload.productInfo.productNo
      state.product.productPrice = payload.productInfo.productPrice
      
      console.log("카테고리:"+state.product.category)
      console.log("상품번호:"+ state.product.productName)
      console.log("상품이름:"+state.product.productPrice)
      
    },
    // ** 로그인 시작 **//
    TOGGLE_LOGIN_STATE(state) {
      state.login.isLogin = !state.login.isLogin;
    },
    INIT(state) {
      state.login.user_token = '';
      state.login.login_platform = '';
      state.login.member_id = '';
    },
    SET_USER_INFO(state, payload) {
      console.log(payload);
      state.login.user_token = payload.userInfo.userToken;
      state.login.login_platform = payload.userInfo.loginAPI;
      state.login.member_id = payload.userInfo.memberId;
      console.dir(state.login);
    },
    // ** 로그인 끝 **//

    // ** 카메라 시작 **//
    TOGGLE_CAMERA_CANVAS(state) {
      state.camera.isPhotoTaken = !state.camera.isPhotoTaken;
    },
    TOGGLE_CAMERA_CLICKED(state) {
      state.camera.isClicked = !state.camera.isClicked;
    },

    SET_CAMERA_MODE(state, payload) {
      state.camera.mode = payload.mode;
    },
    SET_CAMERA_ITEM(state, payload) {
      state.camera.item = payload.item;
      console.log('아이템입력들어왔따:' + state.camera.item);
    },
    // ** 카메라 끝 **//

    // ** 상품 관련 시작 ** //
    SET_ZERO_TOTAL(state) {
      state.product.total = 0;
    },
    ADD_TOTAL_MONEY(state, payload) {
      state.product.total += payload.money;
    },
    DEL_ITEM(state, payload) {
      state.product.total -= payload.money;
    },
    // ** 상품 관련 끝 ** //
  },
  actions: {},
  modules: {},
  getters: {
    // ** 로그인 시작 **//
    getMemberId(state) {
      return state.login.member_id;
    },
    getPlatform(state) {
      return state.login.login_platform;
    },
    getIsLogin(state) {
      return state.login.isLogin;
    },
    getUserNickName(state) {
      return state.login.user_nickname;
    },
    getUserToken(state) {
      return state.login.user_token;
    },
    // ** 로그인 끝 **//

    // ** 카메라 시작**//
    getCameraIsPhotoTaken(state) {
      return state.camera.isPhotoTaken;
    },
    getCameraMode(state) {
      return state.camera.mode;
    },
    getCameraItem(state) {
      return state.camera.item;
    },
    getCameraClicked(state) {
      return state.camera.isClicked;
    },
    //** 카메라 끝**//

    // ** 상품 관련 시작 ** //
    getTotalMoney(state) {
      return state.product.total;
    },

    getProductCategory(state) {
      return state.product.category;
    },
    getProductNo(state) {
      return state.product.productNo
    },
    getProductName(state) {
      return state.product.productName
    },
    getProductPrice(state) {
      return state.product.productPrice
    },

    // ** 상품 관련 끝 ** //
  },
});
