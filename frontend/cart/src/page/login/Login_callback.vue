<template>
     <v-layout column> </v-layout>
</template>

<script>
import http from '@/util/http-common.js';
export default {
     async mounted() {
          const that = this;
          const naverLogin = new window.naver.LoginWithNaverId({
               clientId: '9zJZugyWUILEG91zo8TK',
               isPopup: true,
          });
          let userInfo = {};
          let formData = {
               memberId: '',
               memberPassword: '',
               memberName: '',
          };
          naverLogin.init();
          await naverLogin.getLoginStatus((status) => {
               if (status) {
                    console.log('로그인 들어옴');
                    userInfo.loginAPI = 'naver';
                    userInfo.userToken = naverLogin.accessToken.accessToken;
                    formData.memberPassword = naverLogin.user.getId();
                    formData.memberId = naverLogin.user.getEmail();
                    userInfo.memberId = naverLogin.user.getEmail();
                    formData.memberName = naverLogin.user.getNickName();


                    console.log('formdata');
                    console.log(formData);
                    
                    http.post('/user/login/naver', formData, { withCredentials: true })
                         .then((response) => {
                              sessionStorage.setItem('isLogin', true);
                              sessionStorage.setItem('nickName', formData.memberName);
                              sessionStorage.setItem('userId', formData.memberId);
                              that.$store.commit('TOGGLE_LOGIN_STATE');
                              that.$store.commit('SET_USER_INFO', { userInfo });
                              console.log(response);

                              window.close();
                              // this.$router.replace('/shoppingList');
                         })
                         .catch((error) => {
                              console.log(error);
                         });
               } else {
                    console.log('AccessToken이 올바르지 않습니다.');
                    alert('문제가 발생했습니다! 다시 로그인 해주세요!');
                    this.$router.push('/login');
               }
          });
     },
};
</script>
