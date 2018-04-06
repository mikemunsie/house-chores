<template>
  <div id="app">
    <router-view/>
  </div>
</template>

<script>
require('./styles/app.scss');

export default {
  name: 'App',
};
</script>

<style lang='scss'>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
}
</style>
