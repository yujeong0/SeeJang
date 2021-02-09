<template>
  <div id="container">
    <h1 style="margin-bottom: 10px">상품 즐겨찾기</h1>
    <hr />
    <v-row style="height: 50px; margin: auto">
      <v-col> <h2>상품정보</h2></v-col>
      <v-col> <h2>추가/삭제</h2></v-col>
    </v-row>
    <hr />
    <div v-for="(item, i) in myProduct" :key="i" style="margin-top: 10px">
      <v-row>
        <v-col style="margin: auto"> {{ item.productName }}</v-col>
        <v-col style="margin: auto"
          ><v-btn @click="AddShoppingList(i)" style="width: 65%"
            >쇼핑리스트 담기</v-btn
          ></v-col
        >
      </v-row>
      <v-row>
        <v-col style="margin: auto; color: blue">
          {{ item.productPrice | comma }}원</v-col
        >
        <v-col style="margin: auto">
          <v-btn @click="deleteMyProduct(i)" style="width: 65%"
            >즐겨찾기 삭제</v-btn
          ></v-col
        >
      </v-row>

      <!-- <div style="margin-top: 10px"><v-btn>쇼핑리스트에 추가하기</v-btn></div>
      <div style="margin-top: 10px; margin-bottom: 10px">
        <v-btn>즐겨찾기에서 삭제하기</v-btn>
      </div> -->
      <hr style="margin-top: 10px" />
    </div>
  </div>
</template>

<script>
import http from '@/util/http-common.js';
export default {
  data() {
    return {
      myProduct: [],
    };
  },
  filters: {
    comma(val) {
      let num = new Number(val);
      return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
    },
  },
  created() {
    console.log('상품즐겨찾기!!!!');
    http
      .get('/myProduct', {
        params: {
          id: sessionStorage.getItem('userId'),
        },
        withCredentials: true,
      })
      .then((response) => {
        this.myProduct = response.data;
        console.log(this.myProduct);
      })
      .catch((error) => {
        console.log(error);
      });
  },
  methods: {
    deleteMyProduct(index) {
      console.log(index);
      http
        .delete('/myProduct', {
          params: {
            myProductNo: this.myProduct[index].myProductNo,
          },
          withCredentials: true,
        })
        .then((response) => {
          console.log('삭제성공~');
          console.log(response);
        })
        .catch((error) => {
          console.log('삭제실패~');
          console.log(error);
        });

      this.myProduct.splice(index, 1);
    },
    AddShoppingList(index) {
      let formData = new FormData();
      formData.append('checked', false);
      formData.append('memberId', this.$store.getters.getMemberId);
      formData.append('productName', this.myProduct[index].productName);
      formData.append('productPrice', this.myProduct[index].productPrice);
      http
        .post('/shoppingList', formData, {
          withCredentials: true,
        })
        .then((response) => {
          let item = {
            checked: false,
            memberId: this.$store.getters.getMemberId,
            productName: this.myProduct[index].productName,
            productPrice: this.myProduct[index].productPrice,
            shoppingListNo: response.data, // 백엔드에서 받아온 No 값으로 변경
          };
          this.$attrs.add(item);
          this.$store.commit('TOGGLE_MODAL_STATE');
        })
        .catch((error) => {
          console.log(error);
        });
    },
    cancel() {
      this.$store.commit('TOGGLE_MODAL_STATE');
      this.$modal.hide('MyFavoriteShoppingList-modal');
    },
    search() {
      if (this.productName != '') {
        http
          .get('/product/name', {
            params: {
              name: this.productName,
            },
            withCredentials: true,
          })
          .then((response) => {
            this.searchedProducts.splice(0);
            this.searchedState = true;
            this.searchedProducts = response.data;
          })
          .catch((error) => {
            console.log(error);
          });
      } else {
        this.searchedState = false;
        this.searchedProducts.splice(0);
      }
    },
    selSelf() {
      this.searchedState = false;
    },
    sel(selecteditem) {
      console.log(selecteditem);
      for (let i = 0; i < this.searchedProducts.length; i++) {
        if (this.searchedProducts[i].productName == selecteditem.name) {
          this.productName = this.searchedProducts[i].productName;
          this.productPrice = this.searchedProducts[i].productPrice;
          break;
        }
      }
      this.searchedState = false;
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
