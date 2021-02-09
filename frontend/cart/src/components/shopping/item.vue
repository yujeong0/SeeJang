<template>
  <div class="itemWrap" id="container">
    <v-container>
      <v-row class="mb-6" no-gutters>
        <v-col cols="1" sm>
          <input type="checkbox" v-model="ischecked" :checked="ischecked" @click="check" />
        </v-col>
        <v-col cols="5" sm style="text-align: left; margin-right: 2%" @click="updateForm">
          {{ productName }}
        </v-col>
        <v-col style="text-align: left" @click="updateForm"> ₩ {{ productPrice }} </v-col>
        <v-col style="text-align: right">
          <v-btn text @click="del" depressed color="error" style="padding-bottom: 20%">
            del
          </v-btn></v-col
        >
      </v-row>
    </v-container>
  </div>
</template>

<script>
import http from '@/util/http-common.js';
import UpdateForm from '@/components/shopping/updateForm.vue';
export default {
  name: 'item',
  props: {
    item: Object,
    allCheck: Boolean,
  },
  data() {
    return {
      ischecked: this.item.checked,
      productName: this.item.productName,
      productPrice: this.item.productPrice,
      shoppingListNo: this.item.shoppingListNo,
    };
  },
  created() {
    if (this.ischecked) {
      var payload = this.item;
      let money = parseInt(this.productPrice);
      this.$store.commit('ADD_TOTAL_MONEY', { money });
      this.$store.commit('ADD_CHECK_ITEM', { payload });
    }
    if (this.allCheck) {
      this.update();
    }
  },
  methods: {
    check() {
      let money = parseInt(this.productPrice);
      var payload = this.item;
      var no = this.item.shoppingListNo;
      if (!this.ischecked) {
        console.log('삭제체크입력');
        console.log(no);
        this.$store.commit('ADD_TOTAL_MONEY', { money });
        this.$store.commit('ADD_CHECK_ITEM', { payload });
      } else {
        console.log('삭제체크삭제');
        console.log(no);
        this.$store.commit('DEL_ITEM', { money });
        this.$store.commit('DEL_CHECK_ITEM', { no });
      }
      this.update();
    },
    updateForm() {
      this.$modal.show(
        UpdateForm,
        {
          itemName: this.productName,
          itemPrice: this.productPrice,
          updated: this.updateNamePrice,
          updateForm: 'data',
          modal: this.$modal,
        },
        {
          name: 'UpdateForm-modal',

          width: '70%',
          height: '45%',
          draggable: false,
          shiftY: 0.3,
        },
        {
          closeByName() {
            this.$modal.hide('UpdateForm-modal');
          },
          closeByEvent() {
            this.$emit('close');
          },
        }
      );
    },
    updateNamePrice(updatedItem) {
      console.log(updatedItem);
      let formData = new FormData();
      formData.append('checked', this.ischecked);
      formData.append('memberId', this.$store.getters.getMemberId);
      formData.append('productName', updatedItem.productName);
      formData.append('productPrice', updatedItem.productPrice);
      formData.append('shoppingListNo', this.shoppingListNo);

      http
        .put('/shoppingList', formData, {
          withCredentials: true,
        })
        .then((response) => {
          console.log(response);
          this.productName = updatedItem.productName;
          this.productPrice = updatedItem.productPrice;
        })
        .catch((error) => {
          console.log(error);
        });
    },
    update() {
      let formData = new FormData();
      formData.append('checked', !this.ischecked);
      formData.append('memberId', this.$store.getters.getMemberId);
      formData.append('productName', this.productName);
      formData.append('productPrice', this.productPrice);
      formData.append('shoppingListNo', this.shoppingListNo);

      http
        .put('/shoppingList', formData, {
          withCredentials: true,
        })
        .then((response) => {
          console.log(response);
        })
        .catch((error) => {
          console.log(error);
        });
    },
    async del() {
      let money = parseInt(this.productPrice);
      let no = this.shoppingListNo;
      await http
        .delete('/shoppingList', {
          params: {
            shoppingListNo: this.shoppingListNo,
          },
          withCredentials: true,
        })
        .then((response) => {
          if (this.ischecked) {
            this.$store.commit('DEL_ITEM', { money });
            this.$store.commit('DEL_CHECK_ITEM', { no });
          }
          console.log(response);
          this.$emit('del', this.shoppingListNo);
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
  margin: 0px 10%;
  margin-bottom: -10%;
  text-align: left;
}
</style>
