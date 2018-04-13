<template>
  <div>
    <div class="flex">
      <div class="form-fields">
        <h1>New Chore</h1>
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
        <b-field class="divider margin-top--large padding-top--default">
          <button v-on:click="addChore" class="button is-primary margin-top--default">Create Chore</button>
        </b-field>
      </div>
      <div class="chore-list">
        Chores Length: {{this.chores}}
      </div>
    </div>
  </div>
</template>

<script>
import { mapState } from 'vuex';

export default {
  name: 'new-chore',
  computed: mapState({
    chores: ({ chores }) => chores.items
  }),
  methods: {
    addChore() {
      this.$store.dispatch('addChore', this.chore);
    }
  },
  data() {
    return {
      chore: {
        name: 'My Chore',
        description: '',
        frequency: 1,
        frequencyRange: 'day',
        recurring: false
      }
    };
  }
};
</script>

<style lang='scss' scoped>
  .frequency-number {
    width: 100px;
  }
</style>
