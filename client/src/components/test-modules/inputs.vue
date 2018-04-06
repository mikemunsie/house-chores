<template>
  <div>
    <h1>Inputs</h1>
    <dl>
      <div>
        <dt>Text Input</dt>
        <dd>
          <input v-model='inputMessage'>
        </dd>
      </div>
      <div>
        <dt>Text Value</dt>
        <dd>{{inputMessage}}</dd>
      </div>
      <div>
        <dt>Custom Name</dt>
        <dd>{{customName}}</dd>
      </div>
    </dl>
  </div>
</template>

<script>
export default {
  name: 'TestModulesInputs',
  computed: {
    customName() {
      return `${this.inputMessage}-custom`;
    }
  },
  data() {
    return {
      inputMessage: 'input message'
    };
  }
};
</script>

<style lang='scss'>
</style>
