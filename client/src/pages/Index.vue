<template>
  <div class='test-modules'>
    <TestModulesSlots v-bind:message='inputMessage' class='test-module'>
      <div slot='default'>This will go into the slot</div>
      <div slot='secondSlot'>This will go into the second slot</div>
    </TestModulesSlots>
    <TestModulesStore name='Store Module 1' class='test-module' />
    <TestModulesStore name='Store Module 2' class='test-module' />
    <TestModulesGraphQL class='test-module' />
  </div>
</template>

<script>
import gql from 'graphql-tag';
import TestModulesStore from '@/components/test-modules/store';
import TestModulesGraphQL from '@/components/test-modules/graphql';
import TestModulesSlots from '@/components/test-modules/slots';

export default {
  name: 'PagesIndex',
  components: {
    TestModulesGraphQL,
    TestModulesSlots,
    TestModulesStore
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
      inputMessage: 'Input Message from Index',
      msg: 'Welcome to Your App using GraphQL',
    };
  },
};
</script>

<style lang='scss'>
  .test-modules {
    display: grid;
    grid-template-columns: repeat(3, 33%);
    grid-auto-rows: 300px;
  }

  .test-module {
    border: 1px solid #abc;
    border-radius: 3px;
    margin: 6px;
    overflow: scroll;
    padding: padding('default');
  }
</style>
