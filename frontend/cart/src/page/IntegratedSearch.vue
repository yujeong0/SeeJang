<template>
  <div id="container">
    <div class="pt-10">
      <div style="text-align: center" v-for="(product, i) in products" :key="i">
        <img
          :src="
            require('@/assets/static/productImg/' + product.productNo + '.png')
          "
          alt="dd"
          width="134px"
          height="140px"
          style="border-radius: 40px 40px"
        />
        <div style="text-align: center; width: 100%" class="ml-30">
          <strong class="target2">{{ product.productName }}</strong>
        </div>
        <div>
          <strong style="color: blue">{{ product.productPrice }} 원</strong>
        </div>
        <v-row no-gutters>
          <v-col style="text-align: right; padding-left: 6%">
            <v-btn text outlined @click="addShoppingList(i)"
              >쇼핑리스트 추가
            </v-btn>
          </v-col>
          <v-col style="text-align: left; padding-left: 3%" md-4 offset-md="4">
            <v-btn style="margin-left: 2%" text outlined @click="detail(i)"
              >상세 보기
            </v-btn>
          </v-col>
        </v-row>
        <hr style="margin: 2% 0px" />
      </div>
    </div>
  </div>
</template>

<script>
import http from '@/util/http-common.js';
export default {
  data() {
    return {
      products: [],
    };
  },
  created() {
    console.log('들어왓냐');
    this.products = this.$store.getters.getintegratedSearch;
    console.log(this.products);
    console.log(this.products.length);
  },
  updated() {
    this.products = this.$store.getters.getintegratedSearch;
  },
  methods: {
    addShoppingList(idx) {
      let formData = new FormData();
      formData.append('checked', false);
      formData.append('memberId', this.$store.getters.getMemberId);
      formData.append('productName', this.products[idx].productName);
      formData.append(
        'productPrice',
        parseInt(this.products[idx].productPrice)
      );
      http
        .post('/shoppingList', formData, {
          withCredentials: true,
        })
        .then((response) => {
          console.log(response);
        })
        .catch((error) => {
          console.log(error);
        });
    },
    detail(idx) {
      let productInfo = {
        productName: this.products[idx].productName,
        productNo: this.products[idx].productNo,
        productPrice: this.products[idx].productPrice,
      };
      this.$store.commit('SET_PRODUCT_INFO', { productInfo });
      this.$router.push('/detailProduct');
    },
  },
};
</script>

<style scope>
.target {
  display: block;
  width: 100px;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}
</style>
