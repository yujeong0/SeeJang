<template>
  <div class="itemWrap" id="container">
    <v-container>
      <v-row no-gutters>
        <v-col>
          <input type="checkbox" />
        </v-col>
        <v-col>
          {{ itemName }}
        </v-col>
        <v-col style="text-align: right"> ₩ {{ itemPrice }} </v-col>
      </v-row>
    </v-container>
  </div>
</template>

<script>
export default {
  name: 'item',
  prop: [],
  data() {
    return {
      itemName: '',
      itemPrice: 0,
    };
  },
};
</script>

<style scope>
.itemWrap {
  margin: 1% 10%;
  text-align: left;
}
</style>
