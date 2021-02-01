<template>
  <div id="container">
    <v-row no-gutters>
      <v-col class="product">
        <img class="image" :src="popular.img" alt="Image" />
        <p class="product-info">
          <strong>{{ popular.name }}</strong>
        </p>
        <p>
          <small>{{ popular.info }}</small>
        </p>
      </v-col>
      <v-col class="product">
        <img class="image" :src="popular.img" alt="Image" />
        <p class="product-info">
          <strong>{{ popular.name }}</strong>
        </p>
        <span
          ><small>{{ popular.info }}</small></span
        >
      </v-col>
    </v-row>
  </div>
</template>

<script>
export default {
  props: {
    popular: Object,
  },
};
</script>

<style scoped>
.product {
  text-align: center;
}
.image {
  border-radius: 8px;
  width: 60%;
}
.product-info {
  margin-bottom: -5px;
  max-width: 90px;
  font-size: 0.8rem;
}
</style>
