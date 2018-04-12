import Vue from 'vue';
import Router from 'vue-router';
import DefaultLayout from '@/layouts/default';
import PagesIndex from '@/pages/Index';
import Chores_NewChore from '@/pages/chores/new-chore';
import Test from '@/pages/test';

Vue.use(Router);

export default new Router({
  routes: [
    {
      path: '/',
      component: DefaultLayout,
      children: [
        {
          path: '',
          component: PagesIndex
        },
        {
          path: 'chores/new-chore',
          component: Chores_NewChore
        },
        {
          path: 'test',
          name: 'pages-test',
          component: Test
        },
      ]
    }
  ]
});
