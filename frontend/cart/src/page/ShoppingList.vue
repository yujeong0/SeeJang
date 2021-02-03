<template>
  <div class="wrap" id="container">
    <div class="titleLabel mb-30">My Shopping List</div>
    <hr class="SLHR" />
    <item v-for="item in items" :item="item" :key="item.shoppingListNo"></item>
    <hr class="SLHR" />
    <v-container class="totalpriceArea">
      <v-row no-gutters>
        <v-col> 예상 총 가격 </v-col>
        <v-col> ₩ {{ getTotalMoney }} </v-col>
      </v-row>
    </v-container>
    <div style="text-align: left">
      <v-btn class="ma-2" text style="width: 25%" @click="addList">
        <img src="@/assets/plus.png" alt="" width="4%" />
        <label style="font-size: 0.9em">쇼핑리스트 추가</label></v-btn
      >
    </div>
  </div>
</template>

<script>
import item from '@/components/item.vue';
import http from '@/util/http-common.js';
import { mapGetters } from 'vuex';

export default {
  name: 'ShoppingList',
  created() {
    this.$store.commit('SET_ZERO_TOTAL');
    var member_id = sessionStorage.getItem('userId');
    console.log(member_id);
    http
      .get('/shoppingList', {
        params: {
          MemberId: member_id,
        },
        withCredentials: true,
      })
      .then((response) => {
        console.log(response);
        this.items = response.data;
        console.log(this.items);
      })
      .catch((error) => {
        console.log(error);
      });
  },
  computed: {
    ...mapGetters(['getTotalMoney']),
  },
  components: {
    item,
  },
  props: [],
  data() {
    return {
      items: [],
    };
  },
  methods: {
    addList() {},
  },
};
</script>

<style scoped>
.titleLabel {
  text-align: left;
  margin: 2% 10%;
  font-weight: 1000;
  font-size: large;
  width: 80%;
}
.SLHR {
  background-color: grey;
  height: 1.5px;
  border: 2px;
  width: 80%;
  margin: auto;
}
.totalpriceArea {
  margin: 1% 10%;
}
</style>
