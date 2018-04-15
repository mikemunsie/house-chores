<template>
  <div>
    <nav>
      <div class='container'>
        <router-link to="/auth/" class="logo">
        </router-link>
        <router-link to="/auth/">
          My Chores
        </router-link>
        <router-link to="/auth/test">
          Test Page
        </router-link>
      </div>
    </nav>
    <div class="container margin-top--large">
      <router-view/>
    </div>
  </div>
</template>

<style lang='scss' scoped>
nav {
  background: #222;
  padding: padding(default) 0;

  a {
    color: white;
    margin-right: padding(large);
  }

  .container {
    display: flex;
    align-items: center;
    padding: padding(default) inherit;
  }
}

.logo {
  display: block;
  width: 30px;
  height: 30px;
  border-radius: 50%;
  background: #000;
}
</style>

<script>
export default {
  name: 'DefaultLayout'
};
</script>
