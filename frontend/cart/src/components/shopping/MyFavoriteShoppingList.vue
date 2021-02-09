<template>
  <div id="container">
    <h1 class="mt-3">상품 즐겨찾기</h1>
  </div>
</template>

<script>
import http from '@/util/http-common.js';
import SuggestSearch from '@/components/shopping/SuggestSearch.vue';
export default {
  created() {
    console.log('dd');
    http
      .get('/myProduct', {
        withCredentials: true,
      })
      .then((response) => {
        console.log(response);
      })
      .catch((error) => {
        console.log(error);
      });
  },
  props: ['addData'],
  components: {
    SuggestSearch,
  },
  data() {
    return {
      productName: '',
      productPrice: '',
      searchedProducts: [],
      searchedState: false,
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
          let item = {
            checked: false,
            memberId: this.$store.getters.getMemberId,
            productName: this.productName,
            productPrice: this.productPrice,
            shoppingListNo: response.data, // 백엔드에서 받아온 No 값으로 변경
          };
          this.$attrs.add(item);
          this.$store.commit('TOGGLE_MODAL_STATE');
          this.$modal.hide('AddShoppingList-modal');
        })
        .catch((error) => {
          console.log(error);
        });
    },
    cancel() {
      this.$store.commit('TOGGLE_MODAL_STATE');
      this.$modal.hide('AddShoppingList-modal');
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
.addform {
  font-size: 1.2em;
  padding: 0px 20%;
}
.centered-input >>> input {
  text-align: center;
}
.searchedArea {
  position: absolute;
  left: 0;
  right: 0;
  z-index: 10;
  background-color: white;
  max-height: 150px;
  overflow-y: scroll;
  text-align: left;
  width: 60%;
  margin: auto;
}
</style>
