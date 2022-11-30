import axios from 'axios'

export const httpGet = axios.create({
    baseURL: 'http://localhost:5000',
    timeout: 3000
});
