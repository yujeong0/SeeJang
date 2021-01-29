<template>
  <v-layout column> </v-layout>
</template>

<!--네이버-->
<script
  type="text/javascript"
  src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"
  charset="utf-8"
></script>

<script>
import constants from '@/lib/constants';
export default {
  mounted() {
    const that = this;
    const naverLogin = new naver.LoginWithNaverId({
      clientId: '9zJZugyWUILEG91zo8TK',
      isPopup: false,
    });
    naverLogin.init();
    naverLogin.getLoginStatus(function (status) {
      if (status) {
        constants.VALUE.loginAPI = 'naver';
        constants.LS_KEY.userToken = naverLogin.accessToken;
        constants.VALUE.isLogin = !constants.VALUE.isLogin;
        constants.VALUE.userId = naverLogin.user.getId();
        constants.VALUE.userEmail = naverLogin.user.getEmail();
        constants.VALUE.userNickName = naverLogin.user.getNickName();
        console.dir(constants.VALUE);
      } else {
        console.log('AccessToken이 올바르지 않습니다.');
        alert('문제가 발생했습니다! 다시 로그인 해주세요!');
        this.$router.push('/login');
      }
    });
    this.$router.push('/popularproduct');
  },
};
</script>
