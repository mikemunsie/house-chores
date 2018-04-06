import Vue from 'vue';
import Router from 'vue-router';
import PagesIndex from '@/pages/Index';

Vue.use(Router);

export default new Router({
  routes: [
    {
      path: '/',
      name: 'PagesIndex',
      component: PagesIndex,
    },
  ],
});
