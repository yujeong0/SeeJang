<template>
  <div>
    <v-btn @click="two">상품위치찾기</v-btn>
    <v-btn @click="three">상품확인하기</v-btn>
  </div>
</template>

<script>
export default {
  methods: {
    two() {
      this.toggle(2);
    },
    three() {
      this.toggle(3);
    },
    toggle(mode) {
      this.$store.commit('TOGGLE_CAMERA_CANVAS', { mode });
    },
  },
};
</script>
