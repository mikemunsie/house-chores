<template>
  <div>
    <Test
      v-bind:message='inputMessage'
    />
    <dl>
      <div>
        <dt>Msg</dt>
        <dd>{{msg}}</dd>
      </div>
      <div>
        <dt>Condition</dt>
        <dd>
          <button v-on:click='switchCond1'>{{cond1}}</button>
        </dd>
      </div>
      <div>
        <dt>Text Input {{inputMessage}}</dt>
        <dd>
          <input v-model='inputMessage'>
        </dd>
      </div>
    </dl>
    <div v-if='cond1'>
      This will show when the condition is true
    </div>
  </div>
</template>

<script>
import Test from './test';

export default {
  name: 'HelloWorld',
  components: {
    Test,
  },
  methods: {
    switchCond1() {
      console.log(this.cond1); // eslint-disable-line
      this.cond1 = !this.cond1;
    },
  },
  data() {
    return {
      cond1: false,
      inputMessage: '',
      msg: 'Welcome to Your Vue.js App',
    };
  },
};
</script>

<style lang='scss'>
  dl {
    display: inline-table;
    text-align: left;

    div { display: table-row; }
    dt, dd { display: table-cell; }
    dt { padding-right: 1em; }
  }
</style>
