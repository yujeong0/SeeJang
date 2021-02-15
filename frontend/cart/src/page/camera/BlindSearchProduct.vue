<template>
  <div id="container">
    <v-toolbar class="nav" style="height: 45px; text-align: center">
      <v-btn
        text
        @click="changeMode"
        class="mode"
        style="padding: 0; margin-left: 3%; margin-top: -3%"
      >
        모드변경
        <i class="fas fa-blind"></i>
      </v-btn>
    </v-toolbar>
    <Camera></Camera>
    <BlindMode></BlindMode>

    <!-- <mode-choice></mode-choice> -->
  </div>
</template>

<script>
import Camera from '@/components/camera/Camera.vue';
import BlindMode from '@/components/camera/BlindMode.vue';
// import ModeChoice from "../components/camera/ModeChoice.vue"
export default {
  components: {
    Camera,
    BlindMode,
  },
  methods: {
    changeMode() {
      // 비쟁애인 - 시각장애인 모드 변경
      if (
        sessionStorage.getItem('userId') == '' ||
        sessionStorage.getItem('userId') == null
      ) {
        this.$router.push('/login');
      } else {
        //   localStorage.setItem('isBlind', 2);
        //   sessionStorage.setItem('isLogin', true);
        //   setTimeout(() => {
        //     this.$store.commit('TOGGLE_LOGIN_STATE');
        //     this.$router.push('/modesetting');
        //   }, 500);
        this.$router.push('/modesetting');
      }
    },
  },
};
</script>

<style scoped>
#contents {
  margin-top: -150px;
  z-index: -100;
}
</style>
