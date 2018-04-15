import gql from 'graphql-tag';

export const newChore = () => ({
  name: 'My Chore',
  description: '',
  frequency: 1,
  frequencyRange: 'day',
  recurring: false
});

export function getChore(id) {
  this.$apollo.query({
    fetchPolicy: 'no-cache',
    query: gql(`query getChore($id: Int!) {
      getChore(id: $id) {
        id,
        description
      }
    }`),
    variables: {
      id: 1
    }
  });
}
