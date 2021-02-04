<template>
  <div class="wrap" id="container">
    <div class="titleLabel mb-30">My Shopping List</div>
    <hr class="SLHR" />
    <div class="itemArea">
      <item v-for="item in items" :item="item" :key="item.shoppingListNo" @del="del"></item>
    </div>
    <hr class="SLHR" />
    <v-container class="totalpriceArea">
      <v-row no-gutters>
        <v-col> 예상 총 가격 </v-col>
        <v-col> ₩ {{ getTotalMoney }} </v-col>
      </v-row>
    </v-container>
    <div style="text-align: left; margin-left: 9%">
      <v-btn class="" text style="width: 14%" @click="addList">
        <img src="@/assets/plus.png" alt="" width="4%" />
        <label style="font-size: 0.9em">쇼핑리스트 추가</label></v-btn
      >
    </div>
  </div>
</template>

<script>
import item from '@/components/item.vue';
import http from '@/util/http-common.js';
import AddShoppingList from '@/page/AddShoppingList.vue';
import { mapGetters } from 'vuex';

export default {
  name: 'ShoppingList',
  created() {
    this.$store.commit('SET_ZERO_TOTAL');
    var member_id = sessionStorage.getItem('userId');
    http
      .get('/shoppingList', {
        params: {
          MemberId: member_id,
        },
        withCredentials: true,
      })
      .then((response) => {
        this.items = response.data;
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
    addList() {
      this.$modal.show(
        AddShoppingList,
        {
          add: this.add,
          addData: 'data',
          modal: this.$modal,
        },
        {
          name: 'AddShoppingList-modal',

          width: '500px',
          height: '250px',
          draggable: false,
        },
        {
          closeByName() {
            this.$modal.hide('AddShoppingList-modal');
          },
          closeByEvent() {
            this.$emit('close');
          },
        }
      );
    },
    add(item) {
      this.items.push(item);
    },
    del(shoppingListNo) {
      for (let i = 0; i < this.items.length; i++) {
        if (this.items[i].shoppingListNo == shoppingListNo) {
          this.items.splice(i, 1);
          break;
        }
      }
    },
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
.itemArea {
  max-height: 65%;
  overflow-y: scroll;
}
::-webkit-scrollbar {
  display: none;
}
.totalpriceArea {
  margin: 1% 10%;
}
</style>
