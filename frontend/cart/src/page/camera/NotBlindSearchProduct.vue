<template>
  <div id="container">
    <Camera></Camera>
    <NotBlindMode></NotBlindMode>
    <!-- <mode-choice></mode-choice> -->
  </div>
</template>

<script>
import Camera from '@/components/camera/Camera.vue';
import NotBlindMode from '@/components/camera/NotBlindMode.vue';
// import ModeChoice from "../components/camera/ModeChoice.vue"
export default {
  components: {
    Camera,
    NotBlindMode,
  },
};
</script>

<style></style>
