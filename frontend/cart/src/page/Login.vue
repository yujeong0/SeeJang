<template>
  <v-container class="mx-auto my-auto">
    <div class="upper">
      <h1>~ ★★장보기★★ ~</h1>
      <img src="../assets/list.png" style="width: 15%" />
    </div>
    <div>
      <br />
      <h1 style="color: pink">~ 장보기 시작 ~</h1>
      <h1 style="color: pink">~ GIF로 움직움직 할거임 ~</h1>
      <br />
    </div>
    <div class="LinkAreaDiv">
      <div id="naverIdLogin" class="LinkArea"></div>
      <div class="LinkArea">
        <v-btn class="ma-2" x-large text outlined color="#FDD835" style="width: 80%" @click="kakao"
          ><label style="font-size: 0.9em">KAKAO로 로그인 하기</label></v-btn
        >
      </div>
    </div>
  </v-container>
</template>
<!--네이버-->
<script
  type="text/javascript"
  src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"
  charset="utf-8"
></script>
<script>
export default {
  name: 'login',
  components: {},
  data() {
    return {};
  },
  mounted() {
    var naverLogin = new naver.LoginWithNaverId({
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
    kakao() {
      console.log('click kakao');
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
  margin: 1% 0;
}
</style>
