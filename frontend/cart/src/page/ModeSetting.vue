<template>
  <div>
    <h1>장보기 모드를<br>선택해주세요.</h1>
    <br>
    <br>
    <br>
    <br>
    <v-btn
      rounded
      color="#7986CB"
      dark
      large
      class="btn"
    >
      <v-text class="mode">시각장애인 모드</v-text>
    </v-btn>
    <br>
    <br>
    <v-btn
      rounded
      color="#7CB342"
      dark
      large
      class="btn"
    >
    <v-text class="mode">비장애인 모드</v-text>
    </v-btn>
  </div>
</template>

<script>
export default {
  
}
</script>

<style scoped>
.mode {
  font-size: 1.5rem;
  font: bolder;
}
.btn {
  width: 300px;
}
</style>