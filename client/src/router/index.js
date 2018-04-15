import Vue from 'vue';
import Router from 'vue-router';

import authLayout from '@/layouts/auth';

import index from '@/pages/index';
import authIndex from '@/pages/auth/index';
import authTest from '@/pages/auth/test';

Vue.use(Router);

export default new Router({
  routes: [
    {
      path: '',
      component: index
    },
    {
      path: '/auth/',
      component: authLayout,
      children: [
        {
          path: '',
          component: authIndex
        },
        {
          path: 'test',
          name: 'pages-test',
          component: authTest
        }
      ]
    }
  ]
});
