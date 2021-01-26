<template>
  <div class="like">
    <h2>나의 찜 목록</h2>
    <div class="box">
      <article class="media">
        <div class="">
          <v-container class="tweet">
            <v-row no-gutters>
              <v-col class="detailImage">
                <img class="image" :src="like.img" alt="Image"
              /></v-col>
              <v-col class="detail">
                <strong>{{ like.name }}</strong>
                {{ like.tweet }}
                <a :href="like.handle"
                  ><small>{{ like.handle }}</small></a
                >
              </v-col>
            </v-row>
          </v-container>
          <div class="media-content">
            <div class="content"></div>
          </div>
        </div>
      </article>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    like: Object,
  },
};
</script>

<style scoped>
.button {
  margin-bottom: 20px;
}

.like {
  max-width: 500px;
  margin: 0 auto;
  padding-bottom: 15px;
}

.box {
  margin-bottom: 0;
  border-radius: 0;
}

.content small {
  color: #00d1b2;
}

.image {
  border-radius: 8px;
  width: 15%;
  text-align: left;
}

.tweet {
  margin: 0 5%;
}

.level-item {
  padding-left: 10px;
  color: #00d1b2;
}

input:focus {
  border-color: #00d1b2;
}

.likes {
  padding: 0 7.5px;
}

input {
  font-weight: bold;
}

.likes-move {
  transition: transform 1s;
}
.detailImage {
  margin-left: -100px;
}
.detail {
  text-align: left;
  margin-left: -80px;
  margin-right: 5%;
}
</style>
