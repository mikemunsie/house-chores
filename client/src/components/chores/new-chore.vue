<template>
  <div>
    <div class="flex">
      <div class="form-fields">
        <b-field label="Name">
          <b-input v-model="chore.name" />
        </b-field>
        <b-field label="Description">
          <b-input type="textarea" v-model="chore.description" />
        </b-field>
        <b-field label="Frequency" class="no-flex">
          <div class="field">
            <b-switch v-model="chore.recurring">Recurring</b-switch>
          </div>
          <div class='flex flex-items-center'>
            <b-input
              class="frequency-number margin-right--default"
              type="number"
              v-model="chore.frequency"
            />
            <span class='margin-right--default'>per</span>
            <b-select placeholder="Please Select" v-model="chore.frequencyRange">
              <option
                v-for="option in ['day', 'week', 'month', 'year']"
                :value="option"
                :key="option">
                {{ option }}
              </option>
            </b-select>
          </div>
        </b-field>
        <b-field class="divider items-center margin-top--large padding-top--large">
          <button v-on:click="addChoreCommit" class="button is-primary">Create Chore (Commit)</button>
          <button v-on:click="addChoreDispatch" class="button is-primary margin-left--default">Create Chore (Dispatch)</button>
        </b-field>
      </div>
    </div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex';
import { newChore } from '@/api/chore';

export default {
  name: 'new-chore',
  props: ['on-create'],
  
  computed: {
    chores(state) {
      return this.$store.getters['chores/choresByFilter'](this.filters.isRecurring);
    }
  },

  methods: {
    addChoreCommit() {
      console.log(this);
      this.$store.commit('chores/addChore', {...this.chore });
      this.chore = newChore();
      if (this.onCreate) this.onCreate(); 
    },
    addChoreDispatch() {
      this.$store.dispatch('chores/addChore', { ...this.chore });
      this.chore = newChore();
      if (this.onCreate) this.onCreate(); 
    }
  },

  data() {
    return {
      filters: {
        isRecurring: false
      },
      chore: newChore()
    };
  }
};
</script>

<style lang='scss' scoped>

  .frequency-number {
    width: 100px;
  }
</style>
