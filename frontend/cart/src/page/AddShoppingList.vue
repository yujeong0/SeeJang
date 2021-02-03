<template>
  <div id="container">
    <br />
    <br />
    <h1>추가할 물품을 작성해주세요</h1>
    <br />
    <br />
    <div class="textArea">
      <input v-model="productName" style="text-align: center" type="text" placeholder="물품이름" />
      <input v-model="productPrice" style="text-align: center" type="text" placeholder="가격" />
    </div>
    <br />
    <div>
      <v-btn text outlined style="margin: 2%" @click="add" @add="add">확인~!</v-btn>
      <v-btn text outlined @click="cancel">취소~!</v-btn>
    </div>
  </div>
</template>

<script>
import http from '@/util/http-common.js';
export default {
  props: ['addData'],
  data() {
    return {
      productName: '',
      productPrice: '',
    };
  },
  methods: {
    add() {
      let formData = new FormData();
      formData.append('checked', false);
      formData.append('memberId', this.$store.getters.getMemberId);
      formData.append('productName', this.productName);
      formData.append('productPrice', this.productPrice);
      http
        .post('/shoppingList', formData, {
          withCredentials: true,
        })
        .then((response) => {
          console.log(response);
          let item = {
            checked: false,
            memberId: this.$store.getters.getMemberId,
            productName: this.productName,
            productPrice: this.productPrice,
            shoppingListNo: 10, // 백엔드에서 받아온 No 값으로 변경
          };
          this.$attrs.add(item);
          this.$modal.hide('AddShoppingList-modal');
        })
        .catch((error) => {
          console.log(error);
        });
    },
    cancel() {
      this.$modal.hide('AddShoppingList-modal');
    },
  },
};
</script>

<style scoped>
#container {
  text-align: center;
}
.textArea {
  text-align: center;
}
</style>
