<template>
    <v-container class="mx-auto my-auto">
        <div class="upper">
            <h1>~ ★★장보기★★ ~</h1>
            <img src="../assets/list.png" style="width: 15%" />
        </div>
        <div>
            <br />
            <h1 style="color: pink">~ 장보기 시작 ~</h1>
            <h1 style="color: pink">~ GIF로 움직움직 할거임 ~</h1>
            <br />
        </div>
        <div class="LinkAreaDiv">
            <div id="naverIdLogin" class="LinkArea"></div>
            <div class="LinkArea">
              <v-btn text style="width:278px">
                    <v-img src="@/assets/kakao_login_large_narrow.png" 
                    alt="KAKAO_IMAGE"
                    @click="kakaoLogin"
                    width="278px"
                    height="55px"
                />
              </v-btn>
            </div>
        </div>
    </v-container>
</template>
<!--네이버-->
<script
    type="text/javascript"
    src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"
    charset="utf-8"
></script>
<!--카카오-->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
export default {
    name: "login",
    components: {},
    data() {
        return {};
    },
    mounted() {
        const naverLogin = new naver.LoginWithNaverId({
            clientId: "9zJZugyWUILEG91zo8TK",
            callbackUrl: `${window.location.origin}/login_callback`,
            isPopup: false,
            loginButton: {
                color: "green",
                type: 3,
                height: 60,
            },
        });
        naverLogin.init();

        Kakao.init("9408758ec57aaebe1b8dba4464919e72");
        Kakao.isInitialized();
    },
    methods: {
        kakaoLogin() {
            Kakao.Auth.authorize({
                redirectUri: `${window.location.origin}/kakaologin`,
            });
        },
    },
};
</script>
>

<style scope>
/* .v-application--wrap{
        min-height: 90vh;   
    } */
.upper {
    margin-top: 10%;
}
.LinkAreaDiv {
    margin-top: 10%;
}
.LinkArea {
    margin: auto;
    margin: 5% 0;
}
</style>
