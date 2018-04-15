export default {
  namespaced: true,
  state: {
    items: [],
    name: 'Mike'
  },

  // Getters allow for reusable model logic
  getters: {
    choresByFilter: ({ items }) => (recurring = true) => {
      console.log('grabbinh')
      return items.filter((i) => i.recurring === recurring)
    }
  },

  // Actions are async
  actions: {
    async addChore({ commit }, chore) {
      await new Promise(resolve => setTimeout(resolve, 1000));
      commit('addChore', chore);
    },
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
