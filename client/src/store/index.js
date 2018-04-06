import Vue from 'vue';
import Vuex from 'vuex';
import chores from './modules/chores';
import test from './modules/test';

Vue.use(Vuex);

export default new Vuex.Store({
  modules: {
    chores,
    test
  }
});
