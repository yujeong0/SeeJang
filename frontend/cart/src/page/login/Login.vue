<template>
     <v-container id="container" class="mx-auto my-auto">
          <div style="margin-top:20%;">
               <v-toolbar class="nav" style="height: 50px; margin:auto; text-align: center; width: 120px">
                    <v-btn
                         text
                         @click="changeMode"
                         class="mode"
                         style="padding: 0; margin-left: 15%; margin-top: -3%"
                    >
                         모드변경
                         <i class="fas fa-blind"></i>
                    </v-btn>
               </v-toolbar>
          </div>
          <br />
          <br />
          <div class="upper">
               <div style="margin: auto">
                    <img src="@/assets/logo.png" alt="logo" style="width: 62%" />
               </div>
          </div>
          <div>
               <br />
               <br />
               <br />
               <br />
          </div>
          <div class="LinkAreaDiv">
               <div id="naverIdLogin" class="LinkArea"></div>
               <div class="LinkArea">
                    <v-btn text style="width: 278px">
                         <v-img
                              src="@/assets/kakao_login_large_narrow.png"
                              alt="KAKAO_IMAGE"
                              @click="kakaoLogin"
                              width="278px"
                              height="55px"
                         />
                    </v-btn>
               </div>
          </div>
     </v-container>
</template>
<script>
export default {
     name: "login",
     components: {},
     created(){
          sessionStorage.setItem('isLogin', false);
          this.$store.commit('TOGGLE_LOGIN_STATE');
     },
     data() {
          return {};
     },
     mounted() {
          const naverLogin = new window.naver.LoginWithNaverId({
               clientId: "9zJZugyWUILEG91zo8TK",
               callbackUrl: `${window.location.origin}/login_callback`,
               isPopup: true,
               loginButton: {
                    color: "green",
                    type: 3,
                    height: 60,
               },
          });
          naverLogin.init();
     },
     methods: {
          kakaoLogin() {
               window.Kakao.Auth.authorize({
                    redirectUri: `${window.location.origin}/kakaologin`,
               });
          },
          changeMode() {
               // 비쟁애인 - 시각장애인 모드 변경
               this.$router.push("/modesetting");
          },
     },
};
</script>
>

<style scoped>
/* .v-application--wrap{
        min-height: 90vh;   
    } */
#contents {
     margin-top: -200px;
}
.upper {
     margin-top: 10%;
}
.LinkAreaDiv {
     margin-top: 10%;
}
.LinkArea {
     margin: auto;
     margin: 5% 0;
}
</style>
