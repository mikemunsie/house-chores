<template>
  <div>
    <h1>GraphQL</h1>
    <dl>
      <div>
        <dt>
          <span>Chore</span>
        </dt>
        <dd>{{chore.data.id}} - {{chore.data.description}}</dd>
      </div>
      <div>
        <dt>Msg</dt>
        <dd>{{msg}}</dd>
      </div>
      <div>
        <dt>Test Fetch</dt>
        <dd>
          <button
            :disabled='chore.loading'
            v-on:click='switchCond1'>
              Grab Result
            </button>
        </dd>
      </div>
    </dl>
  </div>
</template>

<script>
import gql from 'graphql-tag';

export default {
  name: 'TestModulesGraphQL',
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
      } catch (e) {
        // do nothing
      }
      this.chore.loading = false;
    },
  },
  data() {
    return {
      chore: { loading: false, data: { } },
      cond1: false,
      msg: 'Welcome to Your App using GraphQL',
    };
  },
};
</script>

<style lang='scss'>
</style>
