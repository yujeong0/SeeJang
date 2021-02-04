<template>
  <div>
    <Info></Info>
    <CheapPriceLink></CheapPriceLink>
  </div>
</template>

<script>
import Info from '@/components/detail/Info.vue';
import CheapPriceLink from '@/components/detail/CheapPriceLink.vue';
export default {
  components: {
    Info,
    CheapPriceLink,
  },
};
</script>

<style scoped></style>
