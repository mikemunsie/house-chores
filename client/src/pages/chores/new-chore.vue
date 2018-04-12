<template>
  <div>
    <div class="form-fields">
      <h1>New Chore</h1>
      <b-field label="Name">
        <b-input v-model="name" />
      </b-field>
      <b-field label="Description">
        <b-input type="textarea" v-model="description" />
      </b-field>
      <b-field label="Frequency" class="no-flex">
        <div class="field">
          <b-switch v-model="recurring">Recurring</b-switch>
        </div>
        <div class='flex flex-items-center'>
          <b-input
            class="frequency-number margin-right--default"
            type="number"
            v-model="frequency"
          />
          <span class='margin-right--default'>per</span>
          <b-select placeholder="Please Select" v-model="frequencyRange">
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
        <button class="button is-primary margin-top--default">Create Chore</button>
      </b-field>
    </div>
  </div>
</template>

<script>
export default {
  name: 'new-chore',
  data() {
    return {
      name: 'My Chore',
      description: '',
      frequency: 1,
      frequencyRange: 'day',
      recurring: false
    };
  }
};
</script>

<style lang='scss' scoped>
  .frequency-number {
    width: 100px;
  }
</style>
