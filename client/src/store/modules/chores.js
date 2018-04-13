export default {
  namespaced: true,
  state: {
    items: [],
    name: 'Mike'
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
    addChore(state, chore) {
      state.items.push(chore);
    },
    changeName(state, name) {
      state.name = name;
    }
  }
};
