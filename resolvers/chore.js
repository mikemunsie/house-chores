module.exports = {
  async get({ id }) {
    await new Promise((resolve) => {
      setTimeout(resolve, 1000);
    });
    return {
      id,
      name: 'cool'
    }
  }
};