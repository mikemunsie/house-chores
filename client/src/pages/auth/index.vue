<template>
  <div>
    <div class="flex items-center">
      <b-switch v-model="filters.recurring">Recurring</b-switch>
      <div class='flex-right'>
        <button class='button is-primary' @click='modals.newChoreDisplay = true'>
          Create New Chore
        </button>
      </div>
    </div>
    <b-table :data="chores" :columns="columns">
      <template slot="empty">
        No data to display
      </template>
    </b-table>

    <!-- Modals -->
    <b-modal :active.sync="modals.newChoreDisplay">
      <div class="modal-card">
        <div class="modal-card-body">
          <NewChore :on-create="() => modals.newChoreDisplay = false" />
        </div>
      </div>
    </b-modal>
  </div>
</template>

<script>
import NewChore from '@/components/chores/new-chore';
import { mapGetters } from 'vuex';

export default {
  name: 'new-chore',
  components: {
    NewChore
  },
  
  computed: {
    chores(state) {
      return this.$store.getters['chores/choresByFilter'](this.filters.recurring);
    }
  },

  data() {
    return {
      filters: {
        myName: 'mike',
        recurring: false
      },
      modals: {
        newChoreDisplay: false
      },
      columns: [
        {
          field: 'name',
          label: 'Name',
          width: 150
        },
        {
          field: 'description',
          label: 'Description'
        },
        {
          field: 'frequency',
          label: 'Frequency'
        },
        {
          field: 'frequencyRange',
          label: 'Frequency Range'
        }
      ]
    };
  },

  methods: {
    createChore() {
      this.$dialog.alert({
        title: 'New Chore',
        message: 'I have a title, a custom button and <b>HTML</b>!',
        confirmText: 'Cool!'
      });
    }
  }
};
</script>
