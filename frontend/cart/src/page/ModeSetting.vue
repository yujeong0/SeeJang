<template>
  <div id="container">
    <h1>장보기 모드를<br />선택해주세요.</h1>
    <br />
    <br />
    <br />
    <br />
    <v-btn rounded color="#7986CB" dark large class="btn" @click="blindMode">
      <label class="mode">시각장애인 모드</label>
    </v-btn>
    <br />
    <br />
    <v-btn rounded color="#7CB342" dark large class="btn" @click="notblindMode">
      <label class="mode">비장애인 모드</label>
    </v-btn>
  </div>
</template>

<script>
export default {
  methods: {
    blindMode() {
      // 시각장애인 모드
      localStorage.setItem('isBlind', 1);
      sessionStorage.setItem('isLogin', false);
      this.$store.commit('TOGGLE_LOGIN_STATE');
      this.$router.push('/blindSearchProduct');
    },
    notblindMode() {
      // // 비장애인 모드
      localStorage.setItem('isBlind', 2);
      // console.log(sessionStorage.getItem("userId"));
      if(sessionStorage.getItem("userId") == "null"){
        this.$router.push('/login');
      }
      else{
        sessionStorage.setItem('isLogin', true);
        this.$store.commit('TOGGLE_LOGIN_STATE');
        this.$router.push('/shoppingList');
      }
      // this.$router.push('/login');
      // 임시 로그인 사용
    },
  },
};
</script>

<style scoped>
#container {
  margin: auto;
}
.mode {
  font-size: 1.5rem;
  font: bolder;
}
.btn {
  width: 300px;
}
</style>
