<template>
  <div>
    <v-btn @click="toggle">최저가 확인하기</v-btn>
  </div>
</template>

<script>
export default {
  methods: {
    toggle() {
      let mode = '1';
      // console.log('item:' + item);
      this.$store.commit('TOGGLE_CAMERA_CANVAS'); //카메라 사진찍기
      this.$store.commit('SET_CAMERA_MODE', { mode }); //카메라 모드 넣어주고
      // this.$store.commit('SET_CAMERA_ITEM', { item }); //아이템 넣어주고
    },
  },
};
</script>
