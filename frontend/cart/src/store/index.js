import Vue from 'vue';
import Vuex from 'vuex';

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    /** 로그인 **/
    login: {
      user_token: '',
      login_platform: '',
      isLogin:
        sessionStorage.getItem('isLogin') == 'false' || sessionStorage.getItem('isLogin') == null
          ? false
          : true,
      member_id: sessionStorage.getItem('userId'),
    },
    /** 로그인 **/

    /** 카메라 **/
    camera: {
      isPhotoTaken: false,
      isClicked: false,
      mode: '',
      item: '',
    },

    /** 카메라 **/

    /** 상품 **/
    product: {
      total: 0,
      category: "",
      productName: "",
      productNo: 0,
      productPrice: "",
      categorize: false,
      checkedList: [],
      categorizeItems: [],
      categorizeItem: "",
      searchName: "",
    },

    /** 상품 **/

    /** 쇼핑리스트 **/
    shoppingList: {
      shoppingListName: "",
      shoppingListPrice: "",
    },

    /** 쇼핑리스트 **/

    /** 통합검색 **/

    integratedSearch: []

    /** 통합검색 **/
  },
  mutations: {
    //** 통합검색 Set **/
    SET_INTEGRATED_SEARCH(state, payload) {
      state.integratedSearch.splice(0); //배열 내용 초기화해주기
      state.integratedSearch = payload.response.data;
    },
    SET_SERACH_NAME(state, payload) {
      console.log(payload.searchName);
      state.product.searchName = payload.searchName;
    },
    //** 통합검색 Set **/

    //** 상품정보 **/
    //상품정보 넣어주기
    SET_PRODUCT_INFO(state, payload) {
      state.product.productName = payload.productInfo.productName
      state.product.productNo = payload.productInfo.productNo
      state.product.productPrice = payload.productInfo.productPrice
    },
    // ** 로그인 시작 **//
    TOGGLE_LOGIN_STATE(state) {
      if (sessionStorage.getItem('isLogin') == 'false') {
        state.login.isLogin = false;
      } else {
        state.login.isLogin = true;
      }
    },
    INIT(state) {
      state.login.user_token = '';
      state.login.login_platform = '';
      state.login.member_id = '';
    },
    SET_USER_INFO(state, payload) {
      state.login.user_token = payload.userInfo.userToken;
      state.login.login_platform = payload.userInfo.loginAPI;
      state.login.member_id = payload.userInfo.memberId;
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
    TOGGLE_CATEGORIZE_STATE(state) {
      state.product.categorize = !state.product.categorize
    },
    ADD_CHECK_ITEM(state, payload) {
      state.product.checkedList.push(payload.payload);
    },
    DEL_CHECK_ITEM(state, payload) {
      var length = state.product.checkedList.length;
      for (var i = 0; i < length; i++) {
        if (state.product.checkedList[i].shoppingListNo == payload.no) {
          state.product.checkedList.splice(i, 1);
          break;
        }
      }
    },
    SET_CATEGORY_STATE(state, payload) {
      state.product.categorize = payload;
    },
    SET_CATEGORIZE_ITEMS(state, payload) {
      state.product.categorizeItems = payload.categorizeItems;
    },
    SET_CATEGORIZE_ITEM(state, payload) {
      state.product.categorizeItem = payload.categorizeItem;
    },
    INIT_CHECKLIST(state) {
      state.product.checkedList.splice(0);
    }
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
    getCategorizeItems(state) {
      return state.product.categorizeItems;
    },
    getCategorizeItem(state) {
      return state.product.categorizeItem;
    },
    getCategorizeState(state) {
      return state.product.categorize;
    },
    getCheckedList(state) {
      return state.product.checkedList;
    },
    // ** 상품 관련 끝 ** //
    SET_SERACH_NAME(state, payload) {
      console.log(payload.serachName);
      state.product.searchName = payload.serachName;
    },

    //** 통합검색 **/
    getintegratedSearch(state) {
      return state.integratedSearch;
    },

    getSearchName(state) {
      return state.product.searchName;
    }
    //** 통합검색 **/
  },
});
