<template>
  <div id="container" class="header">
    <v-toolbar class="nav" style="height: 45px">
      <v-toolbar-title
        class="grey--text lastObject"
        style="margin-left: -2%; margin-top: -3%"
      >
        <label>장보기</label>
      </v-toolbar-title>
      <v-btn
        text
        @click="changeMode"
        class="mode"
        style="padding: 0; margin-left: 3%; margin-top: -3%"
      >
        모드변경
        <i class="fas fa-blind"></i>
      </v-btn>
      <v-btn text @click="likeproduct" style="margin: 0 4%; margin-top: -3%">
        {{ nickName }} 님
        <i class="fas fa-user-circle fa-lg"></i>
      </v-btn>
      <v-btn text @click="logout" style="padding: 0; margin-top: -3%">
        <span>로그아웃</span>
        <v-icon right>exit_to_app</v-icon>
      </v-btn>
    </v-toolbar>

    <v-text-field
      label="통합검색"
      placeholder="상품을 검색해주세요."
      outlined
      dense
      @keyup.enter="goDetail"
      v-model="serachName"
      style="width: 80%; margin: 1% auto; margin-bottom: -7%"
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
        <v-col @click="popular_product"
          ><img
            src="@/assets/populer.png/"
            alt=""
            width="60px"
            class="ml-4 mr-4"
        /></v-col>
        <v-col @click="camera"
          ><img src="@/assets/search.png/" alt="" width="60px" class="ml-4"
        /></v-col>
      </v-row>
    </div>
    <div class="gridDiv mb-1" style="margin-top: -16px">
      <v-row no-gutters>
        <v-col @click="shopping_list" class="selected">
          <span style="font-size: small" class="mr-3">쇼핑리스트</span></v-col
        >
        <v-col class="selected" @click="popular_product"
          ><span style="font-size: small" class="ml-3 mr-3"
            >이번주 상품</span
          ></v-col
        >
        <v-col class="selected" @click="camera"
          ><span style="font-size: small" class="ml-6 mr-3"
            >상품찾기</span
          ></v-col
        >
      </v-row>
    </div>
    <hr class="first" />
  </div>
</template>

<script>
import http from '@/util/http-common.js';
export default {
  name: 'Header',
  props: {},
  components: {},
  data() {
    return {
      serachName: '',
      platform: this.$store.getters.getPlatform,
      nickName: sessionStorage.getItem('nickName'),
    };
  },
  methods: {
    goDetail() {
      http
        .get('/product/name', {
          params: {
            name: this.serachName,
          },
          withCredentials: true,
        })
        .then((response) => {
          console.log(response);
          console.log(response.data.length);
          this.$store.commit('SET_INTEGRATED_SEARCH', { response }); //검색한 상품들의 정보를 셋팅
        })
        .catch((error) => {
          console.log(error);
        });
      if (this.$router.currentRoute.path == '/integratedSearch') {
      } else {
        this.$router.push('/integratedSearch');
      }
    },
    camera() {
      this.$router.push('/notBlindSearchProduct');
    },
    shopping_list() {
      this.$router.push('/shoppinglist');
    },
    popular_product() {
      console.log();
      if (this.$router.currentRoute.path == '/popularproduct') {
        this.$store.commit('SET_CATEGORY_STATE', false);
      } else {
        this.$router.push('/popularproduct');
      }
    },
    changeMode() {
      // 비쟁애인 - 시각장애인 모드 변경
      localStorage.setItem('isBlind', 1);
      sessionStorage.setItem('isLogin', false);
      this.$store.commit('TOGGLE_LOGIN_STATE');
      this.$router.push('/blindSearchProduct');
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

      http
        .get('/user/logout', { withCredentials: true })
        .then((response) => {
          console.log(response);
        })
        .catch((error) => {
          console.log(error);
        });

      sessionStorage.setItem('isLogin', false);
      sessionStorage.setItem('nickName', '');
      sessionStorage.setItem('member_id', '');
      localStorage.setItem('isBlind', 0);
      this.$store.commit('TOGGLE_LOGIN_STATE');
      this.$store.commit('INIT');
      this.$router.push('/');
    },
    likeproduct() {
      this.$router.push('/likeproduct');
    },
  },
};
</script>

<style scoped>
.first {
  background-color: grey;
  height: 1.5px;
  border: 2px;
  width: 80%;
  margin: auto;
}
.navbar {
  width: 100%;
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
.leftObject {
  margin-right: 20%;
}
.clicked {
  width: 100px;
  height: 34px;
  background-color: #feca57;
  border-radius: 10px;
  transition: background-color 0.3s, border-radius 0.5s, width 0.5s;
}
.mode {
  margin-right: -12px;
}
.nav {
  margin-bottom: 10px;
}
</style>
