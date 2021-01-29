<template>
  <v-layout column> </v-layout>
</template>

<script>
import axios from 'axios';
import constants from '@/lib/constants';
export default {
  mounted() {
    const qs = require('qs');
    const parameter = {
      grant_type: 'authorization_code',
      client_id: 'b3bdce092bdd7e37d7b394bb8c363098',
      code: this.$route.query.code,
    };
    axios
      .post('https://kauth.kakao.com/oauth/token', qs.stringify(parameter), {
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8',
        },
      })
      .then((res) => {
        constants.VALUE.loginAPI = 'kakao';
        constants.LS_KEY.USER_TOKEN = res.data.access_token;
        constants.VALUE.isLogin = !constants.VALUE.isLogin;
        console.log(constants.LS_KEY.USER_TOKEN);

        window.Kakao.Auth.setAccessToken(constants.LS_KEY.USER_TOKEN);
        window.Kakao.API.request({
          url: '/v2/user/me',
          data: {
            property_keys: ['properties.nickname', 'kakao_account.email'],
          },
          success: function (response) {
            console.log(response);
            constants.VALUE.userId = response.id;
            constants.VALUE.userEmail = response.kakao_account.email;
            constants.VALUE.userNickName = response.properties.nickname;
            console.dir(constants.VALUE);
          },
          fail: function (error) {
            console.log(error);
            alert('문제가 발생했습니다! 다시 로그인 해주세요!');
            this.$router.push('/login');
          },
        });
      })
      .catch(() => {
        console.log('error_pre');
      });
    this.$router.push('/popularproduct');
  },
};
</script>
