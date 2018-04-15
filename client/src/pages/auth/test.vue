<template>
  <div>
    <section>
      <button class="button is-medium is-primary" @click="alert">
        Launch alert (default)
      </button>
      <button class="button is-medium is-primary" @click="alertCustom">
        Launch alert (custom)
      </button>
      <button class="button is-medium is-danger" @click="alertCustomError">
        Launch alert (custom)
      </button>
    </section>
    <div class='test-modules'>
      <TestModulesSlots v-bind:message='inputMessage'>
        <div slot='default'>This will go into the slot</div>
        <div slot='secondSlot'>This will go into the second slot</div>
      </TestModulesSlots>
      <TestModulesStore name='Store Module 1'/>
      <TestModulesStore name='Store Module 2' />
      <TestModulesGraphQL />
      <TestModulesInputs />
    </div>
  </div>
</template>

<script>
import gql from 'graphql-tag';
import TestModulesStore from '@/components/test-modules/store';
import TestModulesGraphQL from '@/components/test-modules/graphql';
import TestModulesSlots from '@/components/test-modules/slots';
import TestModulesInputs from '@/components/test-modules/inputs';

export default {
  name: 'PagesIndex',
  components: {
    TestModulesGraphQL,
    TestModulesInputs,
    TestModulesSlots,
    TestModulesStore
  },
  methods: {
    alert() {
      this.$dialog.alert('Everything looks fine!');
    },
    alertCustom() {
      this.$dialog.alert({
        title: 'Title Alert',
        message: 'I have a title, a custom button and <b>HTML</b>!',
        confirmText: 'Cool!'
      });
    },
    alertCustomError() {
      this.$dialog.alert({
        title: 'Error',
        message: 'Something\'s not good but I have a custom <b>icon</b> and <b>type</b>',
        type: 'is-danger',
        hasIcon: true,
        icon: 'times-circle',
        iconPack: 'fa'
      });
    },
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
      inputMessage: 'Input Message from Index',
      msg: 'Welcome to Your App using GraphQL',
    };
  },
};
</script>

<style lang='scss' scoped>
  .frequency-number {
    width: 100px;
  }

  .test-modules {
    display: grid;
    grid-template-columns: repeat(3, 33%);
    grid-auto-rows: 300px;

    > * {
      border: 1px solid #abc;
      border-radius: 3px;
      margin: 6px;
      overflow-y: scroll;
      padding: padding('default');
    }
  }
</style>
