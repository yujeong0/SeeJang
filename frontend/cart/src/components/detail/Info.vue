<template>
  <div id="container">
    <div>{{ getProductName }}</div>
    <div>{{ getProductPrice }}</div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex';
export default {
  computed: {
    ...mapGetters(['getProductName', 'getProductPrice']),
  },
  created() {
    console.log('인포페이지');
    console.log(this.$store.getters.getProductName);
  },
  data() {
    return {
      //productName: this.$store.getters.getProductName,
      //   productPrice: this.$store.getters.getProductPrice,
    };
  },
};
</script>
