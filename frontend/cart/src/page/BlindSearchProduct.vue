<template>
  <div id="container">
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
};
</script>

<style></style>
