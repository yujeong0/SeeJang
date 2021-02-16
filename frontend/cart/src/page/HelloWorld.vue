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
     name: "HelloWorld",

     created() {
     },
     data: () => ({
          mode: localStorage.getItem("isBlind"),
     }),
     methods: {
          containerClick() {
               if (this.mode == null || this.mode == 0) {
                    // 처음실행 또는 로그아웃
                    this.$router.replace("/modesetting");
               } else if (this.mode == 1) {
                    // 시각장애인
                    // 랜덤 memberId 생성
                    let max = 10;
                    let arr = ['@','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
                              'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
                    let str = '';
                    let length = arr.length;

                    for(let i = 0; i < 15; i++){
                         str += (Math.floor(Math.random()* (max+ 1))) + arr[(Math.floor(Math.random()* (length)))];
                    }
                    sessionStorage.setItem('userId',str);
                    this.$router.replace("/blindSearchProduct");
               } else {
                    // 비장애인
                    if (
                         localStorage.getItem("userId") == "" ||
                         localStorage.getItem("userId") == null
                    ) {
                         this.$router.replace("/login");
                    } else {
                         sessionStorage.setItem("isLogin", true);
                         sessionStorage.setItem("userId", localStorage.getItem("userId"));
                         sessionStorage.setItem("nickName", localStorage.getItem("nickName"));
                         sessionStorage.setItem(
                              "loginPlatform",
                              localStorage.getItem("loginPlatform")
                         );

                         this.$store.commit("TOGGLE_LOGIN_STATE");
                         this.$router.replace("/shoppingList");
                    }
                    // 임시 로그인
                    // this.$store.commit("TOGGLE_LOGIN_STATE");
                    // this.$router.push("/shoppingList");
               }
          },
     },
};
</script>

<style></style>
