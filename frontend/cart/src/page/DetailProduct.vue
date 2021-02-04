<template>
  <div>
    <Info></Info>
    <CheapPriceLink></CheapPriceLink>
  </div>
</template>

<script>
import Info from '@/components/detail/Info.vue';
import CheapPriceLink from '@/components/detail/CheapPriceLink.vue';
import ReviewList from '@/components/detail/ReviewList.vue';
export default {
  components: {
    Info,
    CheapPriceLink,
    ReviewList,
  },
};
</script>

<style scoped></style>
