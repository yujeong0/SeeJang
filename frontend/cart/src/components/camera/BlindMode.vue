<template>
  <div>
    <v-btn @click="two">상품위치찾기</v-btn>
    <v-btn @click="three">상품확인하기</v-btn>

    <v-container fluid>
      <speech-to-text :text.sync="text" @speechend="speechEnd"></speech-to-text>
    </v-container>
    {{ sentences }}
    <input type="text" ref="banana" v-model="sentences" />
  </div>
</template>

<script>
import SpeechToText from '@/components/camera/speechToText.vue';
export default {
  components: {
    SpeechToText,
  },
  data() {
    return {
      text: '',
      sentences: '',
    };
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
    speechEnd({ sentences, text }) {
      // console.log('text', text);
      //  console.log('sentences', sentences);
      this.sentences = sentences;
    },

    two() {
      this.$store.commit('TOGGLE_CAMERA_CLICKED');
      console.log('찾으실물품?');
      this.speak('찾으실 물품을 말해주세요.');
      setTimeout(() => {
        this.toggle(2, JSON.stringify(this.sentences));
      }, 2000);
    },
    three() {
      this.toggle(3, this.sentences);
    },
    toggle(mode, item) {
      console.log('ddasdfsa');
      let s = 'dd';
      console.log('item:' + item);
      console.log(typeof s);
      this.$store.commit('TOGGLE_CAMERA_CANVAS');
      this.$store.commit('SET_CAMERA_MODE', { mode });
      this.$store.commit('SET_CAMERA_ITEM', { item });
    },
  },
};
</script>
