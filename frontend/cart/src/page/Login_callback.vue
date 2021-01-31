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
            clientId: "9zJZugyWUILEG91zo8TK",
            isPopup: false,
        });
        var userInfo = {};
        naverLogin.init();
        naverLogin.getLoginStatus( (status) => {
            if (status) {
                userInfo.loginAPI = "naver";
                userInfo.userToken = naverLogin.accessToken.accessToken;
                userInfo.userId = naverLogin.user.getId();
                userInfo.userEmail = naverLogin.user.getEmail();
                userInfo.userNickName = naverLogin.user.getNickName();
                this.$store.commit("TOGGLE_LOGIN_STATE");
                this.$store.commit("SET_USER_INFO", { userInfo });
            } else {
                console.log("AccessToken이 올바르지 않습니다.");
                alert("문제가 발생했습니다! 다시 로그인 해주세요!");
                this.$router.push("/login");
            }
        });

        this.$router.push("/popularproduct");
    },
};
</script>
