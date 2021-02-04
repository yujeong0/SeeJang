import axios from 'axios';

// axios 객체 생성
export default axios.create({
  baseURL: 'http://i4d109.p.ssafy.io:8081/springboot/',
  headers: {
    'Content-type': 'application/json',
  },
});
