import axios from 'axios'

let service;
service = axios.create({
    baseURL: 'http://localhost:5000',
    timeout: 3000
});

export default service;
