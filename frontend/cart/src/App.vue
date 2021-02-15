<template>
     <v-app>
          <Header v-if="this.$store.getters.getIsLogin"></Header>
          <div id="contents">
               <router-view />
          </div>
     </v-app>
</template>

<script>
import Header from './components/common/Header.vue';
export default {
     name: 'App',
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
     font-family: 'Do Hyeon', sans-serif;
}
#contents {
     margin-top: 190px;
     height: 100%;
     overflow-x: hidden;
     overflow-y: hidden;
     overscroll-behavior: contain;
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
     z-index: 100;
     display: block;
}
.highlight {
     border-bottom: 7px solid #feca57;
     width: 30%;
     margin: auto;
     /* filter: alpha(opacity= 40); 투명도 조절*/

     /* 원래코드
      background-color: #ffca28;
     width: 50%;
     margin-left: 0.1px;
     text-align: center;
      */
}
</style>
