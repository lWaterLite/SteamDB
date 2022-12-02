import axios from 'axios'

export const httpGet = axios.create({
    baseURL: '/api/',
    timeout: 3000
});
