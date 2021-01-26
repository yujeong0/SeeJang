<template>
  <v-layout column> </v-layout>
</template>

<script>
export default {
  mounted() {
    const that = this;
    const naverLogin = new naver.LoginWithNaverId({
      clientId: 'clientId',
      isPopup: false,
    });
    naverLogin.init();
    naverLogin.getLoginStatus(function (status) {
      if (status) {
        const email = naverLogin.user.getEmail();
        const name = naverLogin.user.getName();
        const profileImage = naverLogin.user.getProfileImage();
        const birthday = naverLogin.user.getBirthday();
        const uniqId = naverLogin.user.getId();
        const age = naverLogin.user.getAge();
        console.log(email);
        console.log(name);
        console.log(profileImage);
        console.log(birthday);
        console.log(uniqId);
        console.log(age);
      } else {
        console.log('AccessToken이 올바르지 않습니다.');
      }
      that.$router.push({ name: 'login' });
    });
  },
};
</script>
