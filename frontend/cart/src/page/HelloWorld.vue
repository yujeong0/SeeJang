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

  created(){
    sessionStorage.setItem('isLogin', false);
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
      }
    },
  },
};
</script>

<style></style>
