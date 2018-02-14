module.exports = {
  async get({ id }) {
    await new Promise((resolve) => {
      setTimeout(resolve, 1000);
    });
    return {
      id,
      name: 'New Chore',
      description: 'Description',
      frequency: 1,
      frequencyInterval: 'week',
      recurring: true,
      date: new Date('11-19-2017').getTime()
    }
  },
  async create({ id, name, description, frequency, frequencyInterval, recurring, date }) {
    await new Promise((resolve) => {
      setTimeout(resolve, 100);
    });
    return {
      id: 100,
      name,
      description,
      frequency,
      frequencyInterval,
      recurring,
      date
    }
  }
};