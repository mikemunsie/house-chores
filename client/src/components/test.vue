<style scoped lang='scss'>
.test {
  border: 1px solid #000;
  padding: 1em;

  h1 {
    margin: 0;
    margin-bottom: .4em;
  }
}
</style>

<script>
export default {
  name: 'Test',
  props: ['message'],

  computed: {

    // computed properties are cached based on their dependencies
    customMessage() {
      return this.message.split('').reverse().join('');
    },
  },

  render() {
    const { message, customMessage } = this;

    const ElementTest = name => (
      <span>{name}</span>
    );

    return (
      <div class='test'>
        <h1>Test Component</h1>
        {ElementTest('cool')}
        <div>Your Message: {message}</div>
        <div>Custom Message: {customMessage}</div>
      </div>
    );
  }
};
</script>
