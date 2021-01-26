<template>
  <div id="naverIdLogin"></div>
</template>

<!--네이버-->
<script
  type="text/javascript"
  src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"
  charset="utf-8"
></script>
<script>
export default {
  data() {
    return {
      naverLogin: '',
    };
  },
  mouted() {
    this.naverLogin = new naver.LoginWithNaverId({
      clientId: '9zJZugyWUILEG91zo8TK',
      callbackUrl: `로그인콜백페이지`,
      isPopup: false,
      loginButton: {
        color: 'green',
        type: 3,
        height: 60,
      },
    });
    naverLogin.init();
    console.log(naverLogin);
  },
};
</script>

<style></style>
