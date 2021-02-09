<template>
     <v-app>
          <Header v-if="this.$store.getters.getIsLogin"></Header>
          <router-view />
     </v-app>
</template>

<script>
import Header from "./components/common/Header.vue";
export default {
     name: "App",
     components: {
          Header,
     },
     data() {
          return {};
     },
};
</script>

<style>
#container {
     font-family: "Do Hyeon", sans-serif;
}
#app {
     font-family: Avenir, Helvetica, Arial, sans-serif;
     -webkit-font-smoothing: antialiased;
     -moz-osx-font-smoothing: grayscale;
     text-align: center;
     color: #2c3e50;
}
.header {
     width: 100%;
     height: 200px;
     position: fixed;
     top: 0;
     background-color: white;
     left: 0;
     right: 0;
     z-index: 10;
     display: block;
}
body {
     padding-top: 175px;
     overflow-x: hidden;
     overflow-y: scroll;
     overscroll-behavior: contain;
     /* 생략 */
}
</style>
