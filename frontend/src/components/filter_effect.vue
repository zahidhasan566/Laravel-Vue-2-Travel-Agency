<template>
<div>
  <h5 class="ftr"> {{ text| upperCase | removeText  }} </h5>




</div>
</template>

<script>
export default {
  data(){
    return{
      text: "This Filter Works"
    }

  },
  filters:{
    upperCase(value){
      return value.toUpperCase();
    }
  }


}

</script>

<style>

.ftr{
  margin: 15px;
}

</style>