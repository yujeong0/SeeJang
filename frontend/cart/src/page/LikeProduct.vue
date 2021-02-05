<template>
  <div id="app" class="columns mt-4">
    <div id="container">
      <h3>나의 찜 목록</h3>
      <div class="column">
        <like v-for="(like , index) in likes" :like="like" :index="index+1" :key="index" @del="del"/>
      </div>
    </div>
  </div>
</template>

<script>
import Like from '@/components/Like.vue';
import http from "@/util/http-common.js";

export default {
  components: {
    Like,
  },
  data() {
    return {
      likes: [],
    };
  },
  created() {
        var member_id = sessionStorage.getItem("userId");
        console.log(member_id)
        http.get("/wishList", {
            params: {
                memberId: member_id,
            },
            withCredentials: true,
        })
            .then((response) => {
                this.likes = response.data;
                console.log(response)
            })
            .catch((error) => {
                console.log(error);
            });
    },
  methods: {
    del(wishNo) {
            for (let i = 0; i < this.likes.length; i++) {
                if (this.likes[i].wishNo == wishNo) {
                    this.likes.splice(i, 1);
                    break;
                }
            }
        },
  }
};
</script>

<style></style>
