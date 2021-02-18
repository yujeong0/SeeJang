<template>
     <v-app>
          <Loader></Loader>
          <Header v-if="this.$store.getters.getIsLogin"></Header>
          <div :class="{ contents: this.$store.getters.getIsLogin }">
               <router-view />
          </div>
     </v-app>
</template>

<script>
import Header from './components/common/Header.vue';
import Loader from './components/common/Loader.vue';
import Swal from 'sweetalert2';
export default {
     updated() {
          // if (this.$router.currentRoute.path == "/blindSearchProduct" ||
          //     this.$router.currentRoute.path == "/modesetting" ||
          //     this.$router.currentRoute.path == "/" ||
          //     this.$router.currentRoute.path == "/login") {
          //      this.isActive = false;
          // } else this.isActive = true;
          console.log(this.$router.currentRoute.path);
     },
     name: 'App',
     components: {
          Header,
          Loader,
     },
     data() {
          return {
               isActive: true,
          };
     },
};
history.pushState(null, null, location.href);
window.onpopstate = function (event) {
     //history.go(1);
     Swal.fire({
          title: '끝내기!',
          text: 'SEE장을 종료하시겠습니까?',
          icon: 'warning',
          showCancelButton: true,
          confirmButtonColor: '#3085d6',
          cancelButtonColor: '#d33',
          confirmButtonText: '네!',
          cancelButtonText: '아니오!',
     }).then((result) => {
          if (result.isConfirmed) {
               // parent.window.close();
               //----
               // top.window.open('about:blank', '_self', '').close();
               // top.window.opener = self;
               // top.window.opener.close();
               // top.self.close();
               //---
               // window.opener = 'Self';
               // window.open('', '_parent', '');
               // window.close();
               //--
               WinClose();
          }
     });
};
function WinClose() {
     window.open('', '_self').close();
}
</script>

<style>
#container {
     font-family: 'Do Hyeon', sans-serif;
}
.contents {
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
