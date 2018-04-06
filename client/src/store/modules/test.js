// initial state
export default {
  namespaced: true,
  state: {
    added: [],
    name: 'Mike',
    checkoutStatus: null,
  },
  mutations: {
    changeName(state, name) {
      state.name = name;
    }
  }
};
