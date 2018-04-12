<style scoped lang='scss'>
.test {
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
        <h1>Slots</h1>
        <dl>
          <div>
            <dt>Message</dt>
            <dd>{message}</dd>
          </div>
          <div>
            <dt>Custom Message</dt>
            <dd>{customMessage}</dd>
          </div>
          <div>
            <dt>Default Slot</dt>
            <dd>{this.$slots.default}</dd>
          </div>
          <div>
            <dt>Second Slot</dt>
            <dd>{this.$slots.secondSlot}</dd>
          </div>
          <div>
            <dt>Function Call</dt>
            <dd>{ElementTest('cool')}</dd>
          </div>
        </dl>
      </div>
    );
  }
};
</script>
