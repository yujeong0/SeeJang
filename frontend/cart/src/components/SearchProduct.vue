<template>
  <div>
    <v-container fluid>
      <v-layout row wrap justify-center class="mt-4">
        <v-flex xs12 sm10 text-xs-center>
          <v-text-field label="The text" v-model="text" textarea></v-text-field>
        </v-flex>
        <v-flex xs12 sm8 md4 text-xs-center>
          <speech-to-text
            :text.sync="text"
            @speechend="speechEnd"
          ></speech-to-text>
        </v-flex>
        <v-flex xs12 text-xs-center class="mt-4">
          {{ sentences }}
        </v-flex>
      </v-layout>
    </v-container>
  </div>
</template>

<script>
import SpeechToText from '@/components/speechToText.vue';
export default {
  data() {
    return {
      text: '',
      sentences: null,
    };
  },
  methods: {
    speechEnd({ sentences, text }) {
      console.log('text', text);
      console.log('sentences', sentences);
      this.sentences = sentences;
    },
  },
  components: {
    SpeechToText,
  },
};
</script>
