<template>
  <div>
    <div>
      <v-app-bar dense>
        <v-tabs>
          <v-tab>장보기</v-tab>
          <v-tab><i class="fab fa-gratipay"></i></v-tab>
        </v-tabs>
      </v-app-bar>
    </div>

    <v-text-field
      label="통합검색"
      placeholder="상품을 검색해주세요."
      outlined
      dense
      style="width: 80%; margin: 3% auto"
      class="text"
    ></v-text-field>
    <div class="gridDiv">
      <v-row no-gutters>
        <v-col
          ><img
            src="@/assets/shoppinglist.png/"
            alt=""
            width="60px"
            class="mr-4"
        /></v-col>
        <v-col
          ><img
            src="@/assets/populer.png/"
            alt=""
            width="60px"
            class="ml-4 mr-4"
        /></v-col>
        <v-col @click="a"
          ><img src="@/assets/search.png/" alt="" width="60px" class="ml-4"
        /></v-col>
      </v-row>
    </div>
    <div class="gridDiv">
      <v-row no-gutters>
        <v-col
          ><span style="font-size: small" class="mr-3">쇼핑리스트</span></v-col
        >
        <v-col
          ><span style="font-size: small" class="ml-3 mr-3"
            >이번주 상품</span
          ></v-col
        >
        <v-col @click="a"
          ><span style="font-size: small" class="ml-6 mr-3"
            >상품찾기</span
          ></v-col
        >
      </v-row>
    </div>
    <hr class="first" />
  </div>
</template>

<script>
export default {
  name: 'Header',
  components: {},
  data: () => ({
    isHeader: false,
  }),
  methods: {
    a() {
      this.$router.push('/serachProduct');
    },
  },
};
</script>

<style>
.first {
  background-color: grey;
  height: 0.5px;
  border: 0px;
  width: 85%;
  margin: auto;
}
</style>
