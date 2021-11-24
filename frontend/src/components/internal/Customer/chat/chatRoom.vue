<template>
  <div>
    <div class="container">
      <div class="row">
        <div>

        </div>
        <div class="col-lg-4 col-md-6 col-sm-8 mx-auto">
          <div v-if="!registerActive" class="card login" v-bind:class="{ error: emptyFields }">
            <h1>Create Room</h1>
            <input  type="text" v-model="id" class="form-control" placeholder="Enter Your Id" required>
            <div style="text-align: end">
              <input type="submit" value="Create Room" class="btn btn-primary" @click.prevent="doRoom">
            </div>


          </div>
        </div>
      </div>

    </div>
  </div>
</template>
<script>
import axios from "axios";

export default {


  data() {
    return {
       id:''
    };
  },


  methods:{
    doRoom(){
      axios.post('http://localhost:8000/api/customer/create-room/', {
        Id:this.id,
      }).then((data)=>{
        this.$toast("Successfully Created", {
          timeout: 500,
        });
        setTimeout(()=>{
         this.$router.push({name:"chat",params: { id: this.id }});
         // this.$router.push({name:"chat"});
        },500);

      }).catch(error =>
          this.$toast("Invalid Id", {
            timeout: 1000,
          }),)
    }

  }
};
</script>
