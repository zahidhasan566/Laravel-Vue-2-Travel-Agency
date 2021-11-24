<template>
  <div>
    <div class="container">
    <h2>Customer</h2>
    <button class=" btn btn-succcess" @click="navigateToHome"> Go tho Home</button>


      <table class="table table-sm table-bordered table-hover" style="font-size: 80%;background: white;">
        <thead>
        <tr>
          <th style="text-align: center;">Id</th>
          <th style="text-align: center;">Name</th>
          <th style="text-align: center;">Age</th>
          <th style="text-align: center;">Chat Room Id</th>
<!--          <th>Mail</th>-->
<!--          <th>SMS Option</th>-->
<!--          <th>Transport</th>-->
<!--          <th>gender</th>-->
<!--          <th>Priority</th>-->
<!--          <th>Comments</th>-->
          <th style="text-align: center;">Action</th>
        </tr>
        </thead>
        <tbody>
        <tr v-for="customer in customers" :key="customer">
          <td style="text-align: center; vertical-align: middle">{{customer['id']}}</td>
          <td style="text-align: center; vertical-align: middle">{{customer['name']}}</td>
          <td style="text-align: center; vertical-align: middle">{{customer['age']}}</td>
          <td style="text-align: center; vertical-align: middle">{{customer['user_id']}}</td>
<!--          <td style="text-align: center; vertical-align: middle">{{customer['email']}}</td>-->
<!--          <td style="text-align: center; vertical-align: middle">{{customer['select_sms']}}</td>-->
<!--          <td style="text-align: center; vertical-align: middle">{{customer['transport']}}</td>-->
<!--          <td style="text-align: center; vertical-align: middle">{{customer['gender']}}</td>-->
<!--          <td style="text-align: center; vertical-align: middle">{{customer['priority']}}</td>-->
<!--          <td style="text-align: center; vertical-align: middle">{{customer['comments']}}</td>-->
          <td style="text-align: center; vertical-align: middle">  <button
              class="btn btn-primary" @click.prevent="updateData(customer['id']),$bvModal.show('editModal')">View
          </button>
            <button
                class="btn btn-primary" style="margin-left: 5px; background: red" @click.prevent="deleteData(customer['id'])">Delete
            </button></td>

        </tr>
        </tbody>
      </table>


      <b-modal id="editModal" size="lg" hide-footer style="background: none">
        <div class="d-block text-center">
          <h3> Travel Customers Information !</h3>
        </div>

        <div class="row">
          <div class="col-md-3">
            <label for="Name_update">Name</label>
            <input
                type="text"
                id="name_update"
                class="form-control"
                v-model="customers_update['name']">

          </div>

            <div class="col-md-3">
              <label for="Age">Age</label>
              <input
                  type="text"
                  id="age"
                  class="form-control"
                  v-model="customers_update['age']">

            </div>
          <div class="col-md-3">
            <label for="Mail2">Mail</label>
            <input
                type="text"
                id="mail2"
                class="form-control"
                v-model="customers_update['email']">
          </div>
          <div class="col-md-3">
            <label for="Age">Select Sms</label>
            <input
                type="text"
                id="smsms"
                class="form-control"
                v-model="customers_update['select_sms']">
          </div>

        </div>

        <div class="row">
          <div class="col-md-3">
            <label for="trans">Transport</label>
            <input
                type="text"
                id="trans"
                class="form-control"
                v-model="customers_update['transport']">

          </div>
          <div class="col-md-3">
            <label for="gen">Gender</label>
            <input
                type="text"
                id="gen"
                class="form-control"
                v-model="customers_update['gender']">

          </div>
          <div class="col-md-3">
            <label for="priority">Priority</label>
            <input
                type="text"
                id="priority"
                class="form-control"
                v-model="customers_update['priority']">

          </div>
          <div class="col-md-3">
            <label for="trans">Comments</label>
            <input
                type="text"
                id="comments"
                class="form-control"
                v-model="customers_update['comments']">

          </div>
        </div>
        <b-button class="mt-3" style="width: 10%; background: red" block @click="$bvModal.hide('editModal')">Close </b-button>
        <b-button class="mt-3" style="width: 20%;margin-left: 15px; background: green" block @click="updateConfirmData(customers_update['id'])">Update</b-button>
      </b-modal>


    </div>


  </div>


</template>
<style>
.modal-backdrop{
  position: absolute;

}
#editModal___BV_modal_content_ {
  width: 800px;
}
#editModal___BV_modal_outer_{
  position: relative !important;
}
</style>
<script>
// eslint-disable-next-line no-unused-vars
import axios from 'axios';
import $ from 'jquery';
import { BModal, VBModal } from 'bootstrap-vue';



export default {
  data() {
    return {
      customers: [],
      customers_update:[]
    }
},
  mounted() {
    this.getCustomers(),
    this.updateData()

  },
  methods:{
    navigateToHome(){
      this.$router.push({name:'home'})
    },
    getCustomers() {
      axios.get('http://localhost:8000/api/test1')
          .then(response => {
            console.log(response)
            this.customers = response.data.customers
          })
          .catch(error => {
            console.log(error)
          })
    },
    updateData(Id){
      console.log(Id)
      axios.post('http://localhost:8000/api/customer/update', {
        Id:Id,
      }).then((response)=>{
        this.customers_update = response.data.customers_update
      }).catch(error => console.log(error))
    },
    updateConfirmData(Id){
      axios.post('http://localhost:8000/api/customer/update/confirm', {
        Id:Id,
        Name:this.customers_update['name'],
        Email: this.customers_update['email'],
        age: this.customers_update['age'],
        Message: this.customers_update['comments'],
        SendSMS: this.customers_update['select_sms'],
        Gender : this.customers_update['gender'],
        Transport : this.customers_update['transport'],
        Priority: this.customers_update['priority']
      }).then((response)=>{
        this.$toast("Succesfully Updated", {
          timeout: 2000,
        });
        setTimeout(()=>{
          this.$router.go()
        },2000);
        //this.$router.go(); //refresh page
        console.log(response);
        //this.customers_update = response.data.customers_update
      }).catch(error => console.log(error))
    },
    deleteData(Id){
      axios.post('http://localhost:8000/api/customer/delete', {
        Id:Id,
      }).then((response)=>{
        this.$toast("Succesfully Deleted", {
          timeout: 2000,
        });
        setTimeout(()=>{
          this.$router.go()
        },2000);
       // this.customers_update = response.data.customers_update
      }).catch(error => console.log(error))
    }

  }

  }


</script>
