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
        console.dir(naverLogin.user);
        const email = naverLogin.user.getEmail();
        const nickname = naverLogin.user.getNickName();
        const uniqId = naverLogin.user.getId();
        console.log(email);
        console.log(nickname);
        console.log(uniqId);
      } else {
        console.log('AccessToken이 올바르지 않습니다.');
        this.$router.push('/login')
      }
      that.$router.push({ name: 'categorize' });
    });
  },
};
</script>
