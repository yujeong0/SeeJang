import Vue from 'vue';
import VueRouter from 'vue-router';

Vue.use(VueRouter);

import Login from '@/page/login/Login.vue';
import HelloWorld from '@/page/HelloWorld.vue';
import BlindSearchProduct from '@/page/BlindSearchProduct.vue';
import NotBlindSearchProduct from '@/page/NotBlindSearchProduct.vue';
import DetailProduct from '@/components/DetailProduct.vue';
import Header from '@/components/Header.vue';
import Categorize from '@/components/Categorize.vue';
import ShoppingList from '@/page/shopping/ShoppingList.vue';
import LikeProduct from '@/page/LikeProduct.vue';
import PopularProduct from '@/page/PopularProduct.vue';
import ModeSetting from '@/page/ModeSetting.vue';
import BlindProduct from '@/page/BlindProduct.vue';
import Login_callback from '@/page/login/Login_callback.vue';
import Kakao_callback from '@/page/login/KakaoLoginCallback.vue';
// import SearchProduct from "@/components/SearchProduct.vue"
Vue.use(VueRouter);

const routes = [
  {
    path: '/',
    name: 'hello',
    component: HelloWorld,
  },
  {
    path: '/notBlindSearchProduct',
    name: 'NotBlindSearchProduct',
    component: NotBlindSearchProduct,
  },
  {
    path: '/blindSearchProduct',
    name: 'BlindSearchProduct',
    component: BlindSearchProduct,
  },
  {
    path: '/login',
    name: 'Login',
    component: Login,
  },
  {
    path: '/login_callback',
    name: 'login_callback',
    component: Login_callback,
  },
  {
    path: '/kakaologin',
    name: 'kakaologin',
    component: Kakao_callback,
  },
  {
    path: '/detailProduct',
    name: 'detailProduct',
    component: DetailProduct,
  },
  {
    path: '/header',
    name: 'header',
    component: Header,
  },
  {
    path: '/categorize',
    name: 'categorize',
    component: Categorize,
  },
  {
    path: '/shoppingList',
    name: 'shoppingList',
    component: ShoppingList,
  },
  {
    path: '/likeproduct',
    name: 'likeproduct',
    component: LikeProduct,
  },
  {
    path: '/popularproduct',
    name: 'popularproduct',
    component: PopularProduct,
  },
  {
    path: '/modesetting',
    name: 'modesetting',
    component: ModeSetting,
  },
  {
    path: '/blindproduct',
    name: 'blindproduct',
    component: BlindProduct,
  },
];

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes,
});

export default router;
