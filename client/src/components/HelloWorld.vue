<template>
  <div>
    <Test v-bind:message='inputMessage'>
      <div slot="default">This will go into the slot</div>
      <div slot="secondSlot">This will go into the second slot</div>
    </Test>
    <dl>
      <div>
        <dt>State</dt>
        <dd>{{$store.state.chores.name}}</dd>
      </div>
      <div>
        <dt>
          <span>Chore</span>
          <span v-if="chore.loading"> Loading....</span>
        </dt>
        <dd>{{chore.data.id}} - {{chore.data.description}}</dd>
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
  methods: {
    async switchCond1() {
      this.chore.loading = this.$apollo.query({
        fetchPolicy: 'no-cache',
        query: gql(`query getChore($id: Int!) {
          getChore(id: $id) {
            id,
            description
          }
        }`),
        variables: {
          id: 1
        }
      });
      try {
        const response = await this.chore.loading;
        this.chore.data = response.data.getChore;
        this.cond1 = !this.cond1;
      } catch(e) {
        // do nothing
      }
      this.chore.loading = false;
    },
  },
  data() {
    return {
      chore: { loading: false, data: { } },
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
