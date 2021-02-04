<template>
  <div id="container">
    <h1>장보기 모드를<br />선택해주세요.</h1>
    <br />
    <br />
    <br />
    <br />
    <v-btn rounded color="#7986CB" dark large class="btn" @click="blindMode">
      <v-text class="mode">시각장애인 모드</v-text>
    </v-btn>
    <br />
    <br />
    <v-btn rounded color="#7CB342" dark large class="btn" @click="notblindMode">
      <v-text class="mode">비장애인 모드</v-text>
    </v-btn>
  </div>
</template>

<script>
export default {
  methods: {
    blindMode() {
      // 시각장애인 모드
      localStorage.setItem('isBlind', 1);
      this.$router.push('/blindSearchProduct');
    },
    notblindMode() {
      // 비장애인 모드
      localStorage.setItem('isBlind', 2);
      // this.$router.push('/login');
      // 임시 로그인 사용
      this.$router.push('/popularproduct');
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
