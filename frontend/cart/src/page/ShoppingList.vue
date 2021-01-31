<template>
  <div class="wrap" id="container">
    <div class="titleLabel mb-30">My Shopping List</div>
    <hr class="SLHR" />
    <item></item>
    <hr class="SLHR" />
    <v-container class="totalpriceArea">
      <v-row no-gutters>
        <v-col> 예상 총 가격 </v-col>
        <v-col> ₩ {{ total }} </v-col>
      </v-row>
    </v-container>
    <div style="text-align: left">
      <v-btn class="ma-2" text style="width: 50%">
        <img src="@/assets/plus.png" alt="" width="4%" />
        <label style="font-size: 0.9em">쇼핑리스트 추가</label></v-btn
      >
    </div>
  </div>
</template>

<script>
import item from '@/components/item.vue';
export default {
  name: 'ShoppingList',
  components: {
    item,
  },
  props: [],
  data() {
    return {
      total: 0,
    };
  },
};
</script>

<style>
.titleLabel {
  text-align: left;
  margin: 2% 10%;
  font-weight: 1000;
  font-size: large;
  width: 80%;
}
.SLHR {
  margin: 0 auto;
  width: 80%;
}
.totalpriceArea {
  margin: 2% 10%;
}
</style>
