<template>
  <div>
    <!-- 
    <div v-if="isCameraOpen" class="camera-box">
      <video ref="camera" :width="450" :height="337.5" autoplay></video>
    </div> -->
    <h3 class="md-7">검색할 상품</h3>

    <div v-if="isCameraOpen" class="camera-box">
      <video
        v-show="!isPhotoTaken"
        ref="camera"
        :width="360"
        :height="370"
        autoplay
      ></video>
      <canvas
        v-show="isPhotoTaken"
        id="photoTaken"
        ref="canvas"
        :width="360"
        :height="370"
      ></canvas>
    </div>

    <button type="button" class="button" @click="takePhoto">
      <img
        src="https://img.icons8.com/material-outlined/50/000000/camera--v2.png"
      />
    </button>

    <div v-if="isPhotoTaken && isCameraOpen" class="camera-download">
      <a id="downloadPhoto" class="button" role="button" @click="downloadImage">
        최저가 확인하기
      </a>
    </div>
  </div>
</template>

<script>
import http from '@/util/http-common.js';

export default {
  name: 'Post',
  components: {},
  watch: {},
  created() {
    this.isCameraOpen = true;
    this.createCameraElement();
  },
  methods: {
    stopCameraStream() {
      let tracks = this.$refs.camera.srcObject.getTracks();

      tracks.forEach((track) => {
        track.stop();
      });
    },
    toggleCamera() {
      if (this.isCameraOpen) {
        this.isCameraOpen = false;
        this.isPhotoTaken = false;
        //  this.stopCameraStream();
      } else {
        this.isCameraOpen = true;
        this.createCameraElement();
      }
    },
    downloadImage() {
      const download = document.getElementById('photoTaken');
      const imgBase64 = download.toDataURL('image/jpeg', 'image/octet-stream');
      const decodImg = atob(imgBase64.split(',')[1]);

      let array = [];
      for (let i = 0; i < decodImg.length; i++) {
        array.push(decodImg.charCodeAt(i));
      }

      const file = new Blob([new Uint8Array(array)], { type: 'image/jpeg' });
      const fileName = 'canvas_img_' + new Date().getMilliseconds() + '.jpg';
      let formData = new FormData();
      formData.append('file', file, fileName);

      for (var key of formData.keys()) {
        console.log(key);
      }

      for (var value of formData.values()) {
        console.log(value);
      }

      http
        .post('/searchImage', formData, {
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        })
        .then((response) => {
          console.log(response);
        })
        .catch((error) => {
          console.log(error);
        });

      this.$router.push('/detailProduct');
    },
    takePhoto() {
      this.isPhotoTaken = !this.isPhotoTaken;
      const context = this.$refs.canvas.getContext('2d');
      context.drawImage(this.$refs.camera, 0, 0, 360, 370);
    },
    createCameraElement() {
      const constraints = (window.constraints = {
        audio: false,
        video: true,
        // video: {
        //   facingMode: {
        //     exact: 'environment',
        //   },
        // },
      });

      navigator.mediaDevices
        .getUserMedia(constraints)
        .then((stream) => {
          this.$refs.camera.srcObject = stream;
        })
        .catch((error) => {
          console.log(error);
          alert("May the browser didn't support or there is some errors.");
        });
    },
  },
  data() {
    return {
      isCameraOpen: false,
      isPhotoTaken: false,
    };
  },
};
</script>

<style>
.img {
  text-align: center;
}
</style>
