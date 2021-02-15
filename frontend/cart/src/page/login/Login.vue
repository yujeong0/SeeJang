<template>
  <v-container id="container" class="mx-auto my-auto">
    <div class="upper">
      <h1> See 장 </h1>
      <img src="@/assets/list.png" style="width: 15%" />
    </div>
    <div>
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
  name: 'login',
  components: {},
  data() {
    return {};
  },
  mounted() {
    const naverLogin = new window.naver.LoginWithNaverId({
      clientId: '9zJZugyWUILEG91zo8TK',
      callbackUrl: `${window.location.origin}/login_callback`,
      isPopup: false,
      loginButton: {
        color: 'green',
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
  },
};
</script>
>

<style scope>
/* .v-application--wrap{
        min-height: 90vh;   
    } */
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
