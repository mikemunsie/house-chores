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
    className: {
      type: String
    },
    name: {
      type: String,
      required: true
    }
  },

  computed: {
    customName() {
      const name = this.$store.state.chores.name;
      console.log({name});
      return name.split('').reverse().join('');
    },
  },

  methods: {
    changeName() {
      this.$store.state.chores.name = Math.random().toString();
    }
  },

  render() {
    const { name, className, customName } = this;

    const ElementTest = name => (
      <span>{name}</span>
    );

    return (
      <div class={className}>
        <h1>{name}</h1>
        <dl>
          <div>
            <dt>Chores-name</dt>
            <dd>{this.$store.state.chores.name}</dd>
          </div>
          <div>
            <dt>Custom Name</dt>
            <dd>{this.customName}</dd>
          </div>
        </dl>
        <button onClick={() => this.changeName()}> Click Me to change the state</button>
      </div>
    );
  }
};
</script>
