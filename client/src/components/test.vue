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
  props: {
    message: {
      type: String,
      required: true
    }
  },

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
        <div>Slot:
          {/* How to do slots in JSX */}
          {this.$slots.default}
        </div>
        <div>Slot:
          {/* How to do slots in JSX */}
          {this.$slots.secondSlot}
        </div>
      </div>
    );
  }
};
</script>
