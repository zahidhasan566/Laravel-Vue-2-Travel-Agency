<template>
<div>
 <p class="cp">{{text}}</p>
  <ul>
    <li v-for=" car in cars" :key="car" class="carls">
      {{ car}}

    </li>
  </ul>

</div>

</template>

<script>


 export default {
  data(){
    return{
      text: "User data",
      cars: ['Ford', 'Toyoto','BMW','Mazda']

    }
  }
}
</script>

<style>
.cp{
  margin: 20px;
}
.carls{
  list-style: none;
}

</style>