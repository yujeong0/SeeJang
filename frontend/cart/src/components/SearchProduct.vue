<template>
  <div>
    <div class="camera-button">
      <button
        type="button"
        class="button is-rounded"
        :class="{ 'is-primary': !isCameraOpen, 'is-danger': isCameraOpen }"
        @click="toggleCamera"
      >
        <span v-if="!isCameraOpen">Open Camera</span>
        <span v-else>Close Camera</span>
      </button>
    </div>

    <div v-if="isCameraOpen" class="camera-box">
      <video ref="camera" :width="450" :height="337.5" autoplay></video>
    </div>

    <div v-if="isCameraOpen" class="camera-box">
      <video
        v-show="!isPhotoTaken"
        ref="camera"
        :width="450"
        :height="337.5"
        autoplay
      ></video>
      <canvas
        v-show="isPhotoTaken"
        id="photoTaken"
        ref="canvas"
        :width="450"
        :height="337.5"
      ></canvas>
    </div>

    <div v-if="isCameraOpen" class="camera-shoot">
      <button type="button" class="button" @click="takePhoto">
        <img
          src="https://img.icons8.com/material-outlined/50/000000/camera--v2.png"
        />
      </button>
    </div>

    <div v-if="isPhotoTaken && isCameraOpen" class="camera-download">
      <a
        id="downloadPhoto"
        download="my-photo.jpg"
        class="button"
        role="button"
        @click="downloadImage"
      >
        Download
      </a>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Post',
  components: {},
  watch: {},
  created() {},
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
      let frm = new FormData();
      const download = document.getElementById('downloadPhoto');

      // frm2.append('photo', photoFile.files[0]);
      frm.append('photo', download.files);

      const canvas = document
        .getElementById('photoTaken')
        .toDataURL('image/jpeg')
        .replace('image/jpeg', 'image/octet-stream');

      download.setAttribute('href', canvas); //파일 만들어주는건데..
      console.dir(frm);

      // axios
      //   .post('주소', frm, {
      //     headers: {
      //       'Content-Type': 'multipart/form-data',
      //     },
      //   })
      //   .then((response) => {})
      //   .catch((error) => {});

      // frm 로 canvas 넘겨주기!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    },
    takePhoto() {
      this.isPhotoTaken = !this.isPhotoTaken;

      const context = this.$refs.canvas.getContext('2d');
      context.drawImage(this.$refs.camera, 0, 0, 450, 337.5);
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
button {
  height: 60px;
  width: 60px;
  display: flex;
  align-items: center;
  justify-content: center;
  border-radius: 100%;
}
/* 
img {
  height: 35px;
  object-fit: cover;
} */
</style>
