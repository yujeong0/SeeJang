<template>
     <v-container @click="containerClick" id="container" class="mt-10">
          <div>
               <h1>See 장</h1>
          </div>
          <div>
               <img src="../assets/cart.gif" style="width: 100%; height: 80%" />
          </div>
          <div>
               <h1>현명한 장보기의 시작</h1>
               <v-btn text color="primary">화면을 눌러주세요~</v-btn>
          </div>
     </v-container>
</template>

<script>
export default {
     name: 'HelloWorld',

     created() {
          // sessionStorage.setItem("isLogin", false);
          // // 임시 로그인
          // var formData = {
          //     memberId: "cndtjq145@naver.com",
          //     memberName: "단우아빠",
          //     memberPassword: "48039666",
          // };
          // var userInfo = {
          //     loginAPI: "naver",
          //     userToken: "tmpToken",
          //     memberId: "cndtjq145@naver.com",
          // };
          // sessionStorage.setItem("isLogin", true);
          // sessionStorage.setItem("nickName", formData.memberName);
          // sessionStorage.setItem("userId", formData.memberId);
          // this.$store.commit("SET_USER_INFO", { userInfo });

          // http.post("/user/login/naver", formData, { withCredentials: true })
          //     .then((response) => {
          //         console.log(response);
          //     })
          //     .catch((error) => {
          //         console.log(error);
          //     });
          // 임시 로그인 끝
          if (sessionStorage.getItem('isLogin') == 'true') {
               this.$router.push('/shoppingList');
          }
     },
     data: () => ({
          mode: localStorage.getItem('isBlind'),
     }),
     methods: {
          containerClick() {
               if (this.mode == null || this.mode == 0) {
                    // 처음실행 또는 로그아웃
                    this.$router.push('/modesetting');
               } else if (this.mode == 1) {
                    // 시각장애인
                    this.$router.push('/blindSearchProduct');
               } else {
                    // 비장애인
                    this.$router.push('/login');
                    // 임시 로그인
                    // this.$store.commit("TOGGLE_LOGIN_STATE");
                    // this.$router.push("/shoppingList");
               }
          },
     },
};
</script>

<style></style>
