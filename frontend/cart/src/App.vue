<template>
  <v-app>
    <Header v-if="isLogin"></Header>
    <router-view />
  </v-app>
</template>

<script>
import Header from './components/Header.vue';
export default {
  name: 'App',

  components: {
    Header,
  },
  mounted(){
    this.isLogin = sessionStorage.getItem('isLogin')
  },
  data(){
    return {
      isLogin : sessionStorage.getItem('isLogin')
    }
  },
};
</script>

<style>
#container {
  font-family: 'Do Hyeon', sans-serif;
}
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
</style>
