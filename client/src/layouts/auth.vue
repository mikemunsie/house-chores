<template>
  <div>
    <nav>
      <div class='container'>
        <router-link to="/auth/" class="logo">
        </router-link>
        <router-link to="/auth/" class="navbar-item">
          My Chores
        </router-link>
        <router-link to="/auth/test" class="navbar-item">
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
  margin-top: padding(default);
  
  .container {
    display: flex;
    align-items: center;
    padding: padding(default) inherit;
  }
}

.logo {
  display: block;
  width: 50px;
  height: 50px;
  border-radius: 50%;
  background: #000;
}
</style>

<script>
export default {
  name: 'DefaultLayout'
};
</script>
