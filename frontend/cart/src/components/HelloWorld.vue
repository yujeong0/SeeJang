<template>
    <v-container @click="containerClick" id="container">
      <div>
        <img src="../assets/login_pic.png" style="width:30%" />
      </div>
      <div>
        <v-btn text color="primary">나중에 이미지 움직움직!</v-btn>
      </div>
    </v-container>
</template>

<script>
export default {
    name: "HelloWorld",

    data: () => ({
      
    }),
    methods: {
      containerClick(){
        this.$router.push('/login');
      }
    },
};
</script>

<style scope>
  #container {
    margin: auto;
  }
</style>