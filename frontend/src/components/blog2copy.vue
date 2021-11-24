<template>
  <div>
    <div class="container">
     <h1> Recent News</h1>
    <div v-for="blog in blogs" :key="blog">
      {{blog}}

    </div>
  </div>
  </div>
</template>

<script>


export default {
  data(){
    return{
       blogs:[]

    }
  },
  created() {
     this.$http.get('https://jsonplaceholder.typicode.com/posts').then((data)=>{
       console.log(data);
       this.blogs= data.body
     })
  }

}
</script>

<style>


</style>