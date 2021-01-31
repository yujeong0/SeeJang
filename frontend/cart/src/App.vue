<template>
  <v-app>
    <Header v-if="constants.VALUE.isLogin"></Header>
    <router-view />
  </v-app>
</template>

<script>
import Header from './components/Header.vue';
import constants from '@/lib/constants';

export default {
  name: 'App',

  components: {
    Header,
  },

  data: () => ({
    constants,
  }),
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
