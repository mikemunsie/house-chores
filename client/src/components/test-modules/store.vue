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

  data() {
    return {
      loading: false
    }
  },

  computed: {
    customName() {
      const name = this.$store.state.chores.name;
      return name.split('').reverse().join('');
    },
  },

  methods: {
    changeNameCommit() {
      this.$store.commit('chores/changeName', Math.random().toString());
    },
    async changeNameDispatch() {
      this.loading = true;
      await this.$store.dispatch('chores/changeName', Math.random().toString());
      this.loading = false;
    }
  },

  render() {
    const { name, className, customName, loading } = this;

    const ElementTest = name => (
      <span>{name}</span>
    );

    return (
      <div class={className}>
        <h1>{name}</h1>
        <dl>
          <div>
            <dt>Is Loading</dt>
            <dd>{loading.toString()}</dd>
          </div>
          <div>
            <dt>Chores Name</dt>
            <dd>{this.$store.state.chores.name}</dd>
          </div>
          <div>
            <dt>Custom Name</dt>
            <dd>{this.customName}</dd>
          </div>
        </dl>
        <button
          class='margin-bottom--default'
          onClick={() => this.changeNameCommit()}
        >
          Commit: chores/changeName
        </button>
        <button onClick={() => this.changeNameDispatch()}> Dispatch: chores/changeName</button>
      </div>
    );
  }
};
</script>
