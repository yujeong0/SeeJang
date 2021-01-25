import Vue from "vue";
import VueRouter from "vue-router";

Vue.use(VueRouter);

import Login from "@/page/Login.vue"
import HelloWorld from "@/page/HelloWorld.vue"
import SearchProduct from "@/components/SearchProduct.vue"
import DetailProduct from "@/components/DetailProduct.vue"
import Header from "@/components/Header.vue"
import Categorize from "@/components/Categorize.vue"
import ShoppingList from "@/page/ShoppingList.vue"
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
    path: "/login",
    name: "Login",
    component: Login
  },
  {
    path: "/detailProduct",
    name: "detailProduct",
    component: DetailProduct
  },
  {
    path: "/header",
    name: "header",
    component: Header,
  },
  {
    path: "/categorize",
    name: "categorize",
    component: Categorize,
  },
  {
    path: "/shoppingList",
    name: "shoppingList",
    component: ShoppingList
  }
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes
});

export default router;
