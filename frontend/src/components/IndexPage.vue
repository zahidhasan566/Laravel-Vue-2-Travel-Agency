<template>
<div class="info">
  <p>Info</p>
  <h1>{{myName}}</h1>
  <p class="name">{{name}}</p>

  <p>{{age}}</p>
</div>
</template>

<script> export default {
  name: 'index',
  props: ['myName'],
  data(){
    return{
      name: "zahid",
      age:24
    }
  }
}

</script>
<style>
   .name{
     color: #42b983;
   }
</style>