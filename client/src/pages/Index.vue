<template>
  <div>
    <div class='background'></div>
    <div class='login-container'>
      <div class='login-container__left'>
        <h1>Chores App</h1>
        <p>Pretty basic app that keeps track of the chores in your house. I could really give
          an elabortate description here, but there's not much else you need to know. Find a chore, 
          store it, and do it.
        </p>
      </div>
      <div class='login-container__right'>
        <div>
          <div class='field'>
            <input 
              autocomplete='off' 
              required 
              id='name' 
              type='text' 
            />
            <label for='name'>Name:</label>
          </div>
          <div class='field'>
            <input 
              autocomplete='off' 
              required 
              id='password' 
              type='password' 
            />
            <label for='password'>Password:</label>
          </div>
          <div class='field'>
            <router-link to="/auth/" tag="button">
              Login
            </router-link>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'PagesIndex'
};
</script>

<style lang='scss' scoped>
body {
  overflow: hidden;
}

h1, h2 {
  margin: 0;
  font-weight: 300;
}

p {
  line-height: 1.8em;
}

button {
  display: block;
  background: lighten(#232323, 10);
  width: 100%;
  font-size: inherit;
  padding: 15px;
  color: #fff;
  border: 0;
  
  &:hover {
    background: #232323;
  }
}

.field {
  position: relative;
  padding-bottom: 15px;
  display: flex;
  align-items: center;
  height: 50px;
  padding: padding(large) padding(default);
  margin-bottom: 15px;
  
  &:last-child {
    border-bottom: 0;
  }
  
  input {
    outline: 0;
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    width: 100%;
    height: 100%;
    border: 0;
    z-index: 0;
    font-size: 1em;
    border-bottom: 1px solid #ccc;  
    padding: padding(default);
   
    &:focus {
      border-bottom: 1px solid #aaa;
    }
    
    &:focus, &:valid {
      ~ label {
        font-size: .7em;
        transform: translateY(-20px);
      }     
    }
  }
  
  label {
    position: relative;
    z-index: 1;
    top: 0;
    transform: translateY(0);
    margin-right: 15px;
    transition: .3s all;
  }
}

.login-container {
  display: flex;
  height: 100vh;
  width: 100vw;
  align-items: center;
  position: relative;
  
  &__left {
    padding: 30px;
    margin-left: auto;
    width: 400px;
    color: white;
    background: rgba(#000, .6);
  }
  
  &__right {
    padding: 60px 30px;
    margin-right: auto;
    width: 400px;
    background: rgba(#fff, 1);
    display: flex;
    align-items: center;
    
    > div {
      width: 100%;
    }
  }
  
  button {
    margin-top: 30px;
  }
}

.background {
  z-index: 0;
  position: fixed;
  top: 0;
  bottom: 0;
  right: 0;
  left: 0;
  background: url('https://i.pinimg.com/736x/14/a4/19/14a419af82bec1afcdeeae7e944ac101--city-wallpaper-wallpaper-free.jpg');
  background-size: cover;
  background-repeat: no-repeat;
  filter: opacity(.8);
}
</style>