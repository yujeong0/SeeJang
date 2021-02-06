<template>
  <div>
    <h3 class="mt-7">검색할 상품</h3>

    <div class="camera-box">
      <video
        v-show="!$store.state.camera.isPhotoTaken"
        ref="camera"
        :width="360"
        :height="370"
        autoplay
      ></video>
      <canvas
        v-show="$store.state.camera.isPhotoTaken"
        id="photoTaken"
        ref="canvas"
        :width="360"
        :height="370"
      ></canvas>
    </div>
  </div>
</template>

<script>
import http from '@/util/http-common.js';

export default {
  created() {
    this.createCameraElement();
  },

  data() {
    return {
      isPhotoTaken: this.$store.state.camera.isPhotoTaken, //초기 false -> ture
      result: '',
    };
  },
  updated() {
    this.isPhotoTaken = this.$store.state.camera.isPhotoTaken;
    if (this.isPhotoTaken) this.takePhoto();
  },
  methods: {
    speak(msg) {
      if (
        typeof SpeechSynthesisUtterance === 'undefined' ||
        typeof window.speechSynthesis === 'undefined'
      ) {
        alert('이 브라우저는 음성 합성을 지원하지 않습니다.');
        return;
      }

      window.speechSynthesis.cancel(); // 현재 읽고있다면 초기화

      const speechMsg = new SpeechSynthesisUtterance();
      speechMsg.rate = 1; // 속도: 0.1 ~ 10
      speechMsg.pitch = 1; // 음높이: 0 ~ 2
      speechMsg.lang = 'ko-KR';
      speechMsg.text = msg;

      // SpeechSynthesisUtterance에 저장된 내용을 바탕으로 음성합성 실행
      window.speechSynthesis.speak(speechMsg);
    },
    async downloadImage() {
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
      formData.append('mode', new Blob(), this.$store.getters.getCameraMode);

      let isBlind = localStorage.getItem('isBlind');
      if (isBlind == 1 && this.$store.getters.getCameraMode == 2) {
        //2번 위치 찾기라면 이름까지 같이 보내줌
        formData.append('item', new Blob(), this.$store.getters.getCameraItem);
      }
      /*
      for (var key of formData.keys()) console.log(key);
      for (var value of formData.values()) console.log(value);
      */
      console.log('사진, 모드, 아이템이름 액시오스로 보냄');
      await http
        .post('/searchImage', formData, {
          headers: {
            'Content-Type': 'multipart/form-data',
            withCredentials: true,
          },
        })
        .then((response) => {
          this.result = response.data.result;
          if (
            this.$store.getters.getCameraMode == 2 ||
            this.$store.getters.getCameraMode == 3
          ) {
            this.speak(this.result);
            //장애인 위치찾기
          }
          if (this.$store.getters.getCameraMode == 1) {
            let productInfo = response.data.result[0];
            this.$store.commit('SET_PRODUCT_INFO', { productInfo });
          }

          console.log('액시오스 값받아옴');
          console.log(response);
        })
        .catch((error) => {
          console.log(error);
        });

      //  this.$router.push('/detailProduct');
      if (this.$store.getters.getCameraMode == 1)
        this.$router.push('detailProduct');
      this.$store.commit('TOGGLE_CAMERA_CANVAS');
    },
    takePhoto() {
      const context = this.$refs.canvas.getContext('2d');
      context.drawImage(this.$refs.camera, 0, 0, 360, 370);
      // console.log('테이크포토');
      this.downloadImage();
    },
    createCameraElement() {
      const constraints = (window.constraints = {
        audio: false,
        video: true,
        //  video: {
        //    facingMode: {
        //      exact: 'environment',
        //    },
        //  },
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
};
</script>

<style>
.img {
  text-align: center;
}
</style>
