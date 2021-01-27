import Vue from 'vue';
import VueRouter from 'vue-router';

Vue.use(VueRouter);

import Login from '@/page/Login.vue';
import HelloWorld from '@/page/HelloWorld.vue';
import SearchProduct from '@/components/SearchProduct.vue';
import DetailProduct from '@/components/DetailProduct.vue';
import Header from '@/components/Header.vue';
import Categorize from '@/components/Categorize.vue';
import ShoppingList from '@/page/ShoppingList.vue';
import LikeProduct from '@/page/LikeProduct.vue';
import PopularProduct from '@/page/PopularProduct.vue';
import Login_callback from '@/page/Login_callback.vue';
import Kakao_callback from '@/page/KakaoLoginCallback.vue';
// import SearchProduct from "@/components/SearchProduct.vue"
Vue.use(VueRouter);

const routes = [
  {
    path: '/',
    name: 'hello',
    component: HelloWorld,
  },
  {
    path: '/serachProduct',
    name: 'serachProduct',
    component: SearchProduct,
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
];

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes,
});

export default router;
