<template>
    <v-layout column> </v-layout>
</template>

<script>
import axios from "axios";
export default {
    mounted() {
        const qs = require("qs");
        const parameter = {
            grant_type: "authorization_code",
            client_id: "b3bdce092bdd7e37d7b394bb8c363098",
            code: this.$route.query.code,
        };
        axios
            .post("https://kauth.kakao.com/oauth/token", qs.stringify(parameter), {
                headers: {
                    "Content-Type": "application/x-www-form-urlencoded;charset=utf-8",
                },
            })
            .then((res) => {
                var userInfo = {};
                userInfo.loginAPI = "kakao";
                userInfo.userToken = res.data.access_token;

                window.Kakao.Auth.setAccessToken(res.data.access_token);
                window.Kakao.API.request({
                    url: "/v2/user/me",
                    data: {
                        property_keys: ["properties.nickname", "kakao_account.email"],
                    },
                    success: (response) => {
                        userInfo.userId = response.id;
                        userInfo.userEmail = response.kakao_account.email;
                        userInfo.userNickName = response.properties.nickname;
                        console.log("kakaoCallback");
                        console.dir(userInfo);
                        this.$store.commit("TOGGLE_LOGIN_STATE");
                        this.$store.commit("SET_USER_INFO", { userInfo });
                    },
                    fail: function (error) {
                        console.log(error);
                        alert("문제가 발생했습니다! 다시 로그인 해주세요!");
                        this.$router.push("/login");
                    },
                });
            })
            .catch(() => {
                console.log("error_pre");
            });
            
        sessionStorage.setItem('isLogin', true);
        this.$router.push("/popularproduct");
    },
};
</script>
