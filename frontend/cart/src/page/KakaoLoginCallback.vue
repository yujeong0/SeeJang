<template>
  <v-layout column> </v-layout>
</template>
<!--카카오-->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
import axios from 'axios';
export default {
  mounted() {
    const qs = require('qs')
    let accessToken = null
    const parameter = {
      grant_type: 'authorization_code',
      client_id: 'b3bdce092bdd7e37d7b394bb8c363098',
      code: this.$route.query.code
    }
    axios
      .post('https://kauth.kakao.com/oauth/token', qs.stringify(parameter), {
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'
        }
      })
      .then((res) => {
        accessToken = res.data.access_token
        // this.$router.push({
        //   name: 'categorize',
        //   params: {
        //     accessToken
        //   }
        // })
      })
      .catch(()=>{
        console.log('error')
      })

     axios.post('https://kapi.kakao.com/v2/user/me')
     .then((res)=>{
       console.log(res)
     }).catch(()=>{

     })
  }
}
</script>