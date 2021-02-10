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
import http from "@/util/http-common.js";
export default {
    mounted() {
        const that = this;
        const naverLogin = new naver.LoginWithNaverId({
            clientId: "9zJZugyWUILEG91zo8TK",
            isPopup: false,
        });
        var userInfo = {};
        var formData = {
            memberId: "",
            memberName: "",
            memberPassword: "",
        };

        naverLogin.init();
        naverLogin.getLoginStatus((status) => {
            if (status) {
                userInfo.loginAPI = "naver";
                userInfo.userToken = naverLogin.accessToken.accessToken;
                formData.memberPassword = naverLogin.user.getId();
                formData.memberId = naverLogin.user.getEmail();
                userInfo.memberId = naverLogin.user.getEmail();
                formData.memberName = naverLogin.user.getNickName();

                sessionStorage.setItem("isLogin", true);
                sessionStorage.setItem("nickName", formData.memberName);
                sessionStorage.setItem("userId", formData.memberId);
                that.$store.commit("TOGGLE_LOGIN_STATE");
                that.$store.commit("SET_USER_INFO", { userInfo });

                console.log(formData);

                http.post("/user/login/naver", formData, { withCredentials: true })
                    .then((response) => {
                        console.log(response);
                    })
                    .catch((error) => {
                        console.log(error);
                    });
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
