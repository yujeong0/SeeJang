import axios from 'axios';

// axios 객체 생성
export default axios.create({
  baseURL: 'https://i4d109.p.ssafy.io/springboot/',
  headers: {
    'Content-type': 'application/json',
  },
});
