<template>
  <div>
    <div class="gridDiv" id="container">
    <v-row no-gutters>
      <v-col><img src="@/assets/fruit.png/" alt="" width="40px" class="mr-4"></v-col>
      <v-col><img src="@/assets/tea.png/" alt="" width="40px" class="ml-4 mr-4"></v-col>
      <v-col><img src="@/assets/instant.png/" alt="" width="40px" class="ml-4 mr-4"></v-col>
      <v-col><img src="@/assets/drink.png/" alt="" width="40px" class="ml-4"></v-col>
    </v-row>
  </div>
    <div class="gridTextDiv">
      <v-row no-gutters>
        <v-col style="font-size: small" class="mr-2">과일</v-col>
        <v-col style="font-size: small" class="ml-2 mr-2">커피/차</v-col>
        <v-col style="font-size: small" class="ml-2 mr-2">냉장/냉동</v-col>
        <v-col style="font-size: small" class="ml-2">생수/음료</v-col>
      </v-row>
    </div>
    <br />
    <div>
      <div class="gridDiv">
        <v-row no-gutters>
          <v-col
            ><img src="@/assets/oil.png/" alt="" width="40px" class="mr-4"
          /></v-col>
          <v-col
            ><img
              src="@/assets/milk.png/"
              alt=""
              width="40px"
              class="ml-4 mr-4"
          /></v-col>
          <v-col
            ><img
              src="@/assets/bread.png/"
              alt=""
              width="40px"
              class="ml-4 mr-4"
          /></v-col>
          <v-col
            ><img src="@/assets/rice.png/" alt="" width="40px" class="ml-4"
          /></v-col>
        </v-row>
      </div>
      <div class="gridTextDiv">
        <v-row no-gutters>
          <v-col
            ><span style="font-size: small" class="mr-2">양념/오일</span></v-col
          >
          <v-col
            ><span style="font-size: small" class="mr-0.5">우유/</span></v-col
          >
          <v-col
            ><span style="font-size: small" class="ml-0.5"
              >베이커리/</span
            ></v-col
          >
          <v-col
            ><span style="font-size: small" class="ml-2">쌀/잡곡</span></v-col
          >
        </v-row>
      </div>
      <div class="gridDiv2">
        <v-row no-gutters>
          <v-col><span style="font-size: small" class="mr-2"></span></v-col>
          <v-col
            ><span style="font-size: small" class="ml-4">유제품</span></v-col
          >
          <v-col><span style="font-size: small" class="mr-6">잼</span></v-col>
          <v-col><span style="font-size: small" class="ml-2"></span></v-col>
        </v-row>
      </div>
    </div>
    <br />
    <hr class="first" />
  </div>
</template>

<script>
export default {};
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
