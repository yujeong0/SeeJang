<template>
  <div>
    <v-toolbar id="container" class="nav">
      <v-toolbar-title class="grey--text">
        <span class="font-weight-light">장보기</span>
      </v-toolbar-title>
      <v-spacer></v-spacer>
      <v-btn text class="user">
        {{ getUserNickName }} 님
        <i class="fas fa-user-circle fa-lg"></i>
      </v-btn>
      <v-btn text @click="logout" class="mode" >
        <span>모드변경</span>
        <i class="fas fa-blind"></i>
      </v-btn>
      <div>
      <v-btn text @click="logout" class="logout">
        <span>로그아웃</span>
        <v-icon right>exit_to_app</v-icon>
      </v-btn>
      </div>
    </v-toolbar>

    <v-text-field
      label="통합검색"
      placeholder="상품을 검색해주세요."
      outlined
      dense
      style="width: 80%; margin: 1% auto"
      class="text"
    ></v-text-field>
    <div class="gridDiv">
      <v-row no-gutters>
        <v-col @click="shopping_list"
          ><img
            src="@/assets/shoppinglist.png/"
            alt=""
            width="60px"
            class="mr-4"
        /></v-col>
        <v-col @click="popular_product"><img src="@/assets/populer.png/" alt="" width="60px" class="ml-4 mr-4" /></v-col>
        <v-col @click="a"
          ><img src="@/assets/search.png/" alt="" width="60px" class="ml-4"
        /></v-col>
      </v-row>
    </div>
    <div class="gridDiv mb-2">
      <v-row no-gutters>
        <v-col @click="shopping_list" class="selected">
          ><span style="font-size: small" class="mr-3">쇼핑리스트</span></v-col
        >
        <v-col class="selected" @click="popular_product"><span style="font-size: small" class="ml-3 mr-3">이번주 상품</span></v-col>
        <v-col class="selected" @click="a"><span style="font-size: small" class="ml-6 mr-3">상품찾기</span></v-col>
      </v-row>
    </div>
    <hr class="first" />
  </div>
</template>

<script>
import { mapGetters } from 'vuex'; 
export default {
  name: 'Header',
  components: {},
  data(){
    return {
      platform: this.$store.getters.getPlatform
    }
  }, 
  computed: {
    ...mapGetters(['getUserNickName'])
  },
  methods: {
    a() {
      this.$router.push('/searchProduct');
    },
    shopping_list() {
      this.$router.push('/shoppinglist');
    },
    popular_product() {
      this.$router.push('/popularproduct');
    },
    logout() {
      // kakao 로그아웃
      if (this.platform == 'kakao') {
        // window.Kakao.Auth.logout(function () {
        //   console.log(window.Kakao.Auth.getAccessToken());
        // });
        console.log('kakao logout');
        window.Kakao.API.request({
          url: '/v1/user/unlink',
          success: function (response) {
            console.log(response);
          },
          fail: function (error) {
            console.log(error);
          },
        });
      } else if (this.platform == 'naver') {
        console.log('naver logout');
      }
      this.$store.commit('TOGGLE_LOGIN_STATE');
      this.$store.commit('INIT');
      this.$router.push('/login');
    },
  },
};
</script>

<style scoped>
.first {
  background-color: grey;
  height: 0.5px;
  border: 0px;
  width: 85%;
  margin: auto;
}
.navbar {
  width: 100%;
  height: 60px;
  background-color: #192a56;
  bottom: 0;
  position: fixed;
  box-shadow: 0.1px 0.1px 15px 0.1px #273c75;
  border-radius: 10px;
  display: flex;
}
#home {
  margin-left: 0;
  margin-top: 2px;
  color: #ffff;
  transition: width 0.5s, background-color 0.5s, border-radius 0.5s;
}
#check {
  margin-left: 0;
  margin-top: 2px;
  color: #ffff;
  transition: width 0.5s, background-color 0.5s, border-radius 0.5s;
}
#coin {
  margin-left: 0;
  margin-top: 2px;
  color: #ffff;
  transition: width 0.5s, background-color 0.5s, border-radius 0.5s;
}
#user {
  margin-left: 0;
  color: #ffff;
  transition: width 0.5s, background-color 0.5s, border-radius 0.5s;
}
.colum {
  display: flex;
  width: 95%;
  height: 40px;
  margin-top: 10px;
  margin-left: 10px;
}
.home {
  width: 80px;
  height: 34px;
  margin-left: 20px;
  display: flex;
}
.check {
  width: 80px;
  height: 34px;
  margin-left: 20px;
  display: flex;
}
.coin {
  width: 80px;
  height: 34px;
  margin-left: 20px;
  display: flex;
}
.user {
  width: 80px;
  height: 34px;
  margin-left: 20px;
  display: flex;
}
.clicked {
  width: 100px;
  height: 34px;
  background-color: #feca57;
  border-radius: 10px;
  transition: background-color 0.3s, border-radius 0.5s, width 0.5s;
}
.selected {
  background-color: black;
}
.mode {
  margin-right: -12px;
}
.logout {
  margin-left: -20px;
  margin-right: -10px;
}
.user {
  margin-right: -30px;
}
.nav {
  margin-bottom: 10px;
}
</style>
