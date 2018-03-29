<template>
  <div>
    <Test v-bind:message='inputMessage'>
      <div slot="default">This will go into the slot</div>
      <div slot="secondSlot">This will go into the second slot</div>
    </Test>
    <dl>
      <div>
        <dt>
          <span>Chore</span>
          <span v-if="$apollo.queries.chore.loading"> Loading....</span>
        </dt>
        <dd>{{chore.id}} - {{chore.description}}</dd>
      </div>
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
import gql from 'graphql-tag';
import Test from './test';

export default {
  name: 'HelloWorld',
  components: {
    Test,
  },
  apollo: {
    chore: {
      query: gql`query getChore($id: Int!) {
        getChore(id: $id) {
          id,
          description
        }
      }`,
      // Static parameters
      variables: {
        id: 1,
      },
      update(data) {
        return data.getChore;
      }
    }
  },
  methods: {
    switchCond1() {
      console.log(this.cond1); // eslint-disable-line
      this.cond1 = !this.cond1;
    },
  },
  data() {
    return {
      chore: { },
      cond1: false,
      inputMessage: '',
      msg: 'Welcome to Your App using GraphQL',
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
