<template>
  <div>
    <v-row no-gutters  class="px-5">
      <v-col class="product">
        <img class="image" :src="popular.img" alt="Image"/>
        <div class="icons">
          <vue-star animate="animated bounce" color="#F05654">
              <i slot="icon" class="fas fa-shopping-basket"></i>
          </vue-star>
        </div>
        <p class="pro_name"><strong>{{ popular.name }}</strong></p>
        <p><small>{{ popular.info }}</small></p>
      </v-col>
      <v-col class="product">
        <img class="image" :src="popular.img" alt="Image"/>
        <div class="icons">
          <vue-star animate="animated bounce" color="#F05654">
              <i slot="icon" class="fas fa-shopping-basket"></i>
          </vue-star>
        </div>
        <p class="pro_name"><strong>{{ popular.name }}</strong></p>
        <p><small>{{ popular.info }}</small></p>
      </v-col>
    </v-row>
  </div>
</template>

<script>
import VueStar from 'vue-star'

export default {
  components: {
    VueStar,
  },
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
  width: 90%;
}

.pro_name {
  margin-bottom: -2px;
}

p{
  text-align: left;
  padding-left: 8px;
  padding-right: 8px;
}

.icons {
  
}
</style>
