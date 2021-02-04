<template>
  <div id="container">
    <div
      style="border-radius: 40px 40px; width: 33%; height: 150px; float: left"
      class="ma-3"
    >
      <img
        :src="require('@/assets/static/productImg/' + getProductNo + '.png')"
        alt="dd"
        width="134px"
        height="140px"
        style="border-radius: 40px 40px"
      />
    </div>
    <div
      style="width: 60%; height: 165px; border: 1px solid white; float: left"
      class="mt-3 pa-13"
    >
      <div>{{ getProductName }}</div>
      <div style="color: blue">{{ getProductPrice }}원</div>
    </div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex';
export default {
  computed: {
    ...mapGetters(['getProductName', 'getProductPrice', 'getProductNo']),
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
