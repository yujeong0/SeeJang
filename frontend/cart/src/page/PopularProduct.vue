<template>
    <div id="app" class="columns mt-4">
        <categorize />
        <br />
        <h3 class="mb-5">이번 주 인기상품</h3>
        <div class="column">
            <popular v-for="popular in populars" :popular="popular" :key="popular.id" />
        </div>
    </div>
</template>

<script>
import http from "@/util/http-common.js";
import Popular from "@/components/Popular.vue";
import Categorize from "@/components/Categorize.vue";

export default {
    components: {
        Popular,
        Categorize,
    },
    created() {
        // 임시 로그인
        var formData = {
            memberId: "cndtjq145@naver.com",
            memberName: "단우아빠",
            memberPassword: "99129129",
        };
        var userInfo = {
          loginAPI: 'naver',
          userToken: 'tmpToken',
          memberId: 'cndtjq145@naver.com'
        };
        sessionStorage.setItem("isLogin", true);
        sessionStorage.setItem("nickName", formData.memberName);
        sessionStorage.setItem("userId", formData.memberId);
        this.$store.commit("TOGGLE_LOGIN_STATE");
        this.$store.commit("SET_USER_INFO", { userInfo });

        http.post("/user/login/naver", formData, { withCredentials: true })
            .then((response) => {
                console.log(response);
            })
            .catch((error) => {
                console.log(error);
            });
        // 임시 로그인 끝
    },
    data() {
        return {
            populars: [
                {
                    id: 1,
                    name: "바나나 정말 맛있는 바나나",
                    img: "https://semantic-ui.com/images/avatar2/large/matthew.png",
                    info: "100g 3000원",
                },
                {
                    id: 2,
                    name: "빵",
                    img: "https://semantic-ui.com/images/avatar2/large/matthew.png",
                    info: "200g 2600원",
                },
                {
                    id: 3,
                    name: "우유",
                    img: "https://semantic-ui.com/images/avatar2/large/matthew.png",
                    info: "1L 1800원",
                },
            ],
        };
    },
};
</script>

<style></style>
