<template>
    <v-container class="mx-auto my-auto">
        <div class="upper">
            <h1>
                ~ ★★장보기★★ ~
            </h1>
            <img src="../assets/list.png" style="width:15%" />
        </div>
        <div>
            <br />
            <h1 style="color:pink">~ 장보기 시작 ~</h1>
            <h1 style="color:pink">~ GIF로 움직움직 할거임 ~</h1>
            <br />
        </div>
        <div class="LinkAreaDiv">
            <div class="LinkArea">
                <v-btn
                    class="ma-2"
                    x-large
                    text
                    outlined
                    color="success"
                    style="width:80%"
                    @click="naver"
                    ><label style="font-size:0.9em">Naver로 로그인 하기</label></v-btn
                >
            </div>
            <div class="LinkArea">
                <v-btn
                    class="ma-2"
                    x-large
                    text
                    outlined
                    color="#FDD835"
                    style="width:80%"
                    @click="kakao"
                    ><label style="font-size:0.9em">KAKAO로 로그인 하기</label></v-btn
                >
            </div>
        </div>
    </v-container>
</template>

<script>
import http from "@util/http-common";
export default {
    name: "login",
    data() {
        return {};
    },
    methods: {
        naver() {
            http.get("/login/naver")
                .then((response) => {})
                .catch((error) => {});

            console.log("click naver");
        },
        kakao() {
            console.log("click kakao");
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
    margin: 1% 0;
}
</style>
