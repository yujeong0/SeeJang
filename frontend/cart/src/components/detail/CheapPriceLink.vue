<template>
  <div id="container">
    <h3 class="mt-4">최저가 링크</h3>
    <div v-for="(item, i) in datas" :key="i">
      <hr />
      <div style="text-align: left" class="pl-4 my-3 target">
        <a target="_blank" :href="item.link"> {{ item.siteName }}</a
        >: {{ item.price }} {{ item.productName }}
      </div>
      <hr />
    </div>

    <hr class="mt-10" />
    <h3 class="pl-4 text-h7" style="text-align: left">상품평</h3>
    <hr />
    <div>
      <div v-for="(item, i) in reviews" :key="i">
        <div class="pl-4" style="text-align: left">
          <strong>{{ item.memberName }}</strong>
          <img
            :src="
              require('@/assets/static/reviewscore/' + item.score + 'star.png')
            "
            alt="dd"
            width="60px"
          />
        </div>
        <div class="pl-4" style="text-align: left">
          {{ item.comment }}
        </div>

        <hr />
      </div>
    </div>
  </div>
</template>

<script>
import http from '@/util/http-common.js';
import { mapGetters } from 'vuex';

export default {
  created() {
    // let name = this.$store.getters.getProductName;
    let name = 'CJ 비비고왕교자1.12kg';
    http
      .get('/product/detail', {
        params: {
          name,
        },
        withCredentials: true,
      })
      .then((response) => {
        // this.datas = resopnse.data.bestPrice;
        console.log(response);
        console.log(response.data.bestPrice.length);

        for (let i = 0; i < response.data.bestPrice.length; i++) {
          this.datas.push(response.data.bestPrice[i]);
          console.log(this.datas[i].link);
          console.log(this.datas[i].price);
          console.log(this.datas[i].productName);
          console.log(this.datas[i].siteName);
        }

        for (let i = 0; i < response.data.review.length; i++) {
          this.reviews.push(response.data.review[i]);
          console.log(this.reviews[i].comment);
        }
      })
      .catch((error) => {
        console.log(error);
      });
  },

  data() {
    return {
      datas: [],
      reviews: [],
    };
  },
  computed: {
    ...mapGetters(['getProductName', 'getProductPrice']),
  },
  updated() {
    console.log(sessionStorage.getItem('userId'));
    console.log(sessionStorage.getItem('nickName'));
  },
  methods: {
    getPic(index) {
      console.log(this.reviews[index]);
      let url =
        '@/assets/static/reviewscore/' + this.reviews[index].score + 'star.png';
      console.log(url);
      return url;
    },
  },
};
</script>

<style scoped>
.target {
  display: block;
  width: 92%;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

hr {
  background-color: rgb(209, 202, 202);
  border: 1px;
  height: 1px;
}
</style>
