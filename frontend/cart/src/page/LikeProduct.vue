<template>
  <div id="app" class="columns">
    <div class="column">
      <like v-for="like in likes" :like="like" :key="like.id" />
    </div>
  </div>
</template>

<script>
import Like from "@/components/Like.vue";

export default {
  components: {
    Like,
  },
  data() {
    return {
      likes:[
        {
    id: 1,
    name: '바나나',
    handle: 'http://www.coupang.com/',
    img: 'https://semantic-ui.com/images/avatar2/large/matthew.png',
    tweet: "100g 3000원",
 
  },
  { 
    id: 2,
    name: 'Fatima',
    handle: '@fantasticfatima',
    img: 'https://semantic-ui.com/images/avatar2/large/molly.png',
    tweet: 'Better late than never but never late is better.',

  },
  {
    id: 3,
    name: 'Xin',
    handle: '@xeroxin',
    img: 'https://semantic-ui.com/images/avatar2/large/elyse.png',
    tweet: 'Beauty in the struggle, ugliness in the success.',

  }
      ],
    };
  },
};
</script>

<style>

</style>