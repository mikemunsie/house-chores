export default {
  namespaced: true,
  state: {
    added: [],
    name: 'Mike',
    checkoutStatus: null,
  },

  // Actions are async
  actions: {
    async changeName({ commit }, name) {
      await new Promise(resolve => setTimeout(resolve, 1000));
      commit('changeName', name);
    }
  },

  // Mutations are sync
  mutations: {
    changeName(state, name) {
      state.name = name;
    }
  }
};
