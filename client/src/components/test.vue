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
          {this.$slots.default}
        </div>
        <div>Slot:
          {this.$slots.secondSlot}
        </div>
        <hr/>
        <h3>Store Stuffs</h3>
        Chores-name: {this.$store.state.chores.name}
        <button onClick={() => this.$store.state.chores.name = 'cool'}> Click Me to change name</button>
      </div>
    );
  }
};
</script>
