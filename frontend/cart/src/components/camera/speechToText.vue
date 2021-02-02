<template>
  <div>
    <v-btn @click="startSpeechRecognition()">ㅇㅇ </v-btn>

    <template v-if="this.$store.getters.getCameraClicked">
      <div>dddasfsadf</div>
    </template>
  </div>
</template>

<script>
let SpeechRecognition =
  window.SpeechRecognition || window.webkitSpeechRecognition;
let recognition = SpeechRecognition ? new SpeechRecognition() : false;
export default {
  updated() {
    this.isClicked = this.$store.getters.getCameraClicked;
    setTimeout(() => {
      this.startSpeechRecognition();
    }, 1800);
  },
  props: {
    lang: {
      type: String,
      default: 'ko-KR',
    },
    text: {
      type: [String, null],
      required: true,
    },
  },
  data() {
    return {
      isClicked: this.$store.getters.getCameraClicked,
      error: false,
      speaking: false,
      toggle: false,
      runtimeTranscription: '',
      sentences: [],
    };
  },
  methods: {
    checkCompatibility() {
      if (!recognition) {
        this.error =
          'Speech Recognition is not available on this browser. Please use Chrome or Firefox';
      }
    },
    endSpeechRecognition() {
      recognition.stop();
      this.sentences.pop();
      this.toggle = false;
      this.$emit('speechend', {
        sentences: this.sentences,
        text: this.sentences.join('. '),
      });
    },
    startSpeechRecognition() {
      console.log('음성인식시작');

      if (!recognition) {
        this.error =
          'Speech Recognition is not available on this browser. Please use Chrome or Firefox';
        return false;
      }
      this.toggle = true;
      recognition.lang = this.lang;
      recognition.interimResults = true;

      recognition.addEventListener('speechstart', () => {
        // console.log('speechstart');
        this.speaking = true;
      });

      recognition.addEventListener('speechend', () => {
        // console.log('speechend');
        this.speaking = false;
      });

      recognition.addEventListener('result', () => {
        // console.log('array :' + Array.from(event.results).map(result[0]));
        const text = Array.from(event.results)
          .map((result) => result[0])
          .map((result) => result.transcript)
          .join('');

        //console.log(text);
        this.runtimeTranscription = text;

        this.endSpeechRecognition();
      });

      recognition.addEventListener('end', () => {
        if (this.runtimeTranscription !== '') {
          this.sentences.push(
            this.capitalizeFirstLetter(this.runtimeTranscription)
          );
          this.$emit(
            'update:text',
            `${this.text}${this.sentences.slice(-1)[0]}. `
          );
        }
        this.runtimeTranscription = '';
        recognition.stop();
        if (this.toggle) {
          // keep it going.
          recognition.start();
        }
      });
      recognition.start();
    },
    capitalizeFirstLetter(string) {
      return string.charAt(0).toUpperCase() + string.slice(1);
    },
  },
  mounted() {
    this.checkCompatibility();
  },
};
</script>
