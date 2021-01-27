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
        const name = naverLogin.user.getName();
        const profileImage = naverLogin.user.getProfileImage();
        const birthday = naverLogin.user.getBirthday();
        const uniqId = naverLogin.user.getId();
        const age = naverLogin.user.getAge();
        console.log(email);
        console.log(nickname);
        console.log(name);
        console.log(profileImage);
        console.log(birthday);
        console.log(uniqId);
        console.log(age);
      } else {
        console.log('AccessToken이 올바르지 않습니다.');
      }
      that.$router.push({ name: 'likeproduct' });
    });
  },
};
</script>
