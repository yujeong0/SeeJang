<template>
  <div class="itemWrap" id="container">
    <v-container>
      <v-row no-gutters>
        <v-col>
          <input type="checkbox" :checked="item.checked" />
        </v-col>
        <v-col style="text-align: center">
          {{ item.productName }}
        </v-col>
        <v-col style="text-align: right"> ₩ {{ item.productPrice }} </v-col>
        <v-col style="text-align: right; width: 2%">
          <v-btn text @click="del" depressed color="error"> del </v-btn></v-col
        >
      </v-row>
    </v-container>
  </div>
</template>

<script>
import http from '@/util/http-common.js';
export default {
  name: 'item',
  props: {
    item: Object,
  },
  data() {
    return {};
  },
  created() {
    let money = parseInt(this.item.productPrice);
    this.$store.commit('ADD_TOTAL_MONEY', { money });
  },
  methods: {
    del() {
      let money = parseInt(this.item.productPrice);
      http
        .delete('/shoppingList', {
          params: {
            shoppingListNo: this.item.shoppingListNo,
          },
          withCredentials: true,
        })
        .then((response) => {
          this.$store.commit('DEL_ITEM', { money });
          console.log(response);
          this.$emit('del', this.item.shoppingListNo);
        })
        .catch((error) => {
          console.log(error);
        });
    },
  },
};
</script>

<style scope>
.itemWrap {
  margin: 1% 10%;
  text-align: left;
}
</style>
