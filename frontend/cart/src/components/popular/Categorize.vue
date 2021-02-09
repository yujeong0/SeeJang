<template>
  <div id="container">
    <div class="gridDiv">
      <v-row no-gutters>
        <v-col
          ><img
            src="@/assets/fruit_unclick.png/"
            alt=""
            width="40px"
            class="mr-4"
            @click="clickCategory('과일')"
        /></v-col>
        <v-col
          ><img
            src="@/assets/tea_unclick.png/"
            alt=""
            width="40px"
            class="ml-4 mr-4"
            @click="clickCategory('커피/차')"
        /></v-col>
        <v-col @click="clickCategory('냉장/냉동')"
          ><img
            src="@/assets/instant_unclick.png/"
            alt=""
            width="40px"
            class="ml-4 mr-4"
        /></v-col>
        <v-col
          ><img
            src="@/assets/drink_unclick.png/"
            alt=""
            width="40px"
            class="ml-4"
            @click="clickCategory('생수/음료')"
        /></v-col>
      </v-row>
    </div>
    <div class="gridTextDiv">
      <v-row no-gutters>
        <v-col
          style="font-size: small"
          class="mr-2"
          @click="clickCategory('과일')"
          >과일</v-col
        >
        <v-col
          style="font-size: small"
          class="ml-2 mr-2"
          @click="clickCategory('커피/차')"
          >커피/차</v-col
        >
        <v-col
          style="font-size: small"
          class="ml-2 mr-2"
          @click="clickCategory('냉장/냉동')"
          >냉장/냉동</v-col
        >
        <v-col
          style="font-size: small"
          class="ml-2"
          @click="clickCategory('생수/음료')"
          >생수/음료</v-col
        >
      </v-row>
    </div>
    <br />
    <div>
      <div class="gridDiv">
        <v-row no-gutters>
          <v-col @click="clickCategory('양념/오일')"
            ><img src="@/assets/oil_unclick.png/" alt="" width="40px" class="mr-4"
          /></v-col>
          <v-col @click="clickCategory('우유/유제품')"
            ><img
              src="@/assets/milk_unclick.png/"
              alt=""
              width="40px"
              class="ml-4 mr-4"
          /></v-col>
          <v-col @click="clickCategory('베이커리/잼')"
            ><img
              src="@/assets/bread_unclick.png/"
              alt=""
              width="40px"
              class="ml-4 mr-4"
          /></v-col>
          <v-col @click="clickCategory('쌀/잡곡')"
            ><img src="@/assets/rice_unclick.png/" alt="" width="40px" class="ml-4"
          /></v-col>
        </v-row>
      </div>
      <div class="gridTextDiv">
        <v-row no-gutters>
          <v-col
            ><span
              style="font-size: small"
              class="mr-2"
              @click="clickCategory('양념/오일')"
              >양념/오일</span
            ></v-col
          >
          <v-col
            ><span
              style="font-size: small"
              class="mr-0.5"
              @click="clickCategory('우유/유제품')"
              >우유/</span
            ></v-col
          >
          <v-col
            ><span
              style="font-size: small"
              class="ml-0.5"
              @click="clickCategory('베이커리/잼')"
              >베이커리/</span
            ></v-col
          >
          <v-col
            ><span
              style="font-size: small"
              class="ml-2"
              @click="clickCategory('쌀/잡곡')"
              >쌀/잡곡</span
            ></v-col
          >
        </v-row>
      </div>
      <div class="gridDiv2">
        <v-row no-gutters>
          <v-col><span style="font-size: small" class="mr-2"></span></v-col>
          <v-col
            ><span
              style="font-size: small"
              class="ml-4"
              @click="clickCategory('우유/유제품')"
              >유제품</span
            ></v-col
          >
          <v-col
            ><span
              style="font-size: small"
              class="mr-6"
              @click="clickCategory('베이커리/잼')"
              >잼</span
            ></v-col
          >
          <v-col><span style="font-size: small" class="ml-2"></span></v-col>
        </v-row>
      </div>
    </div>
    <br />
    <hr class="first" />
  </div>
</template>

<script>
import http from '@/util/http-common.js';
export default {
  data() {
    return {};
  },
  methods: {
    clickCategory(categorizeItem) {
      http
        .get('/product/category', {
          params: {
            category: categorizeItem,
          },
          withCredentials: true,
        })
        .then((response) => {
          let categorizeItems = response.data;
          this.$store.commit('SET_CATEGORIZE_ITEM', { categorizeItem });
          this.$store.commit('SET_CATEGORIZE_ITEMS', { categorizeItems });
          this.$store.commit('SET_CATEGORY_STATE', true);
        })
        .catch((error) => {
          console.log(error);
        });
    },
  },
};
</script>

<style>
.gridDiv {
  margin: 1% 10%;
}
.gridTextDiv {
  margin: 1% 10%;
  margin-top: -2%;
}
.gridDiv2 {
  text-align: center;
  margin: -3% 0;
}

</style>
