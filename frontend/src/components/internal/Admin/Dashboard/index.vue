<template>
  <div>
    <div class="col-md-12">
      <h1> Login Dashboard</h1>

      Name: {{userdata.name}} <br>
      Email: {{userdata.email}} <br>
      Role: {{ userdata.name}} <br>


    </div>
  </div>
</template>
<script>
export default {
  name: "dashboard",
  props: ["userdata"],

};
</script>
