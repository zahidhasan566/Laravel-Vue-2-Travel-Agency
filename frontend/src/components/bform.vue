<template>
  <div class="row">
    <section style=" background: url(https://images.pexels.com/photos/5032264/pexels-photo-5032264.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940)" >
  <div class="container" style="text-align: -webkit-center">
<!--    <div class="col-md-2">-->

<!--    </div>-->
    <div class="col-md-8">
      <form>
        <div class="row">
          <div class="col-md-12">
            <h1> Travel Booking Form </h1>
            <hr>
            <div class="row">
              <div class="col-md-4">
                <div class="form-group">
                  <label for="email">Name</label>
                  <input
                      type="text"
                      id="name"
                      class="form-control"
                      v-model="userdata.name">

                </div>
              </div>
              <div class="col-md-2">
                <div class="form-group">
                  <label for="age">Age</label>
                  <input
                      type="number"
                      id="age"
                      class="form-control"
                      v-model="userdata.age">

                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <label for="email">Mail</label>
                  <input
                      type="text"
                      id="email"
                      class="form-control"
                      v-model="userdata.email">

                </div>
              </div>

            </div>

          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label for="password">Password</label>
                <input
                    type="password"
                    id="password"
                    class="form-control"
                    v-model="userdata.password">
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <label >Select Notification Option </label> <br>
                <label for="sendmail">
                  <input
                      type="radio"
                      id="sendmail"
                      value="SendMail"
                      v-model="sendSms" > Send Mail
                </label>
                <label for="sendInfomail">
                  <input
                      type="radio"
                      id="sendInfomail"
                      value="SendInfoMail"
                      v-model="sendSms"> Send Sms
                </label>
              </div>
            </div>

          </div>

            <div class="row">
              <div class="col-md-4">
                <div  style="background: #ffffff;">
                  <label >Choose Transport </label> <br>
                  <label for="Bus">
                    <input
                        type="radio"
                        id="bus"
                        value="bus" v-model="transport"> Bus
                  </label>
                  <label for="Plane">
                    <input
                        type="radio"
                        id="plane"
                        value="plane" v-model="transport"> Plane
                  </label>
                  <label for="Train">
                    <input
                        type="radio"
                        id="train"
                        value="train" v-model="transport"> Train
                  </label>
                </div>
              </div>
              <div class="col-md-4">
                <div class="from-group">
                  <label for="priority"> AC Priority</label>
                  <select
                      id="priority"
                      class="form-control" v-model="selectedPriority">
                    <option v-for="priority in userdata.priorities" :key="priority">{{priority}}</option>
                  </select>
                </div>
              </div>
              <div class="col-md-4">
                <div class=" form-group" style="background: #ffffff;">
                  <label >Choose gender </label> <br>
                  <label for="male">
                    <input
                        type="radio"
                        id="male"
                        value="Male" v-model="gender"> Male
                  </label>
                  <label for="female">
                    <input
                        type="radio"
                        id="female"
                        value="Female" v-model="gender"> Female
                  </label>
                </div>
              </div>
            </div>

          </div>
        </div>
        <div class="row">

        </div>

        <div class="row">
        </div>
        <div class="row">

        </div>
        <div class="row">

        </div>
        <div class="row">
          <div class="col-md-12 form-group">
            <label for="message" >Comments</label><br>

            <textarea
                id="message"
                rows="5"
                class="form-control" v-model="message">
                    </textarea>
          </div>
        </div>

        <div class="row">
          <div class="col-md-12">
            <button
                class="btn btn-primary" @click.prevent="saveData">Submit!
            </button>
          </div>
        </div>
      </form>
    </div>




    <div class="col-md-2">

    </div>

  </div>
    </section>
  </div>
</template>

<script>
import axios from 'axios';


export default {
  data(){
    return{
      userdata:{
        email:'',
        name:'',
        password:'',
        age:'',
      message:'',

      priorities:['High','Medium','Low'],
      selectedPriority:'High',
      // isSubmitted: false
      },
      sendSms:'',
      gender:'',
      transport:'',
    }
  },
  methods:{
/*    submitted(){
      this.isSubmitted = true;
      this.$http.post('https://jsonplaceholder.typicode.com/posts',{
        Email: this.userdata.email,
        password: this.userdata.password,
        age: this.userdata.age,
        Message: this.message,
        SendMail: this.sendMail,
        Gender : this.gender,
        Priority: this.selectedPriority
      }).then((data)=>{
        console.log(data);
      })
    },*/
    saveData(){
      console.log(this.userdata)
      axios.post('http://localhost:8000/api/customer', {
        Name:this.userdata.name,
        Email: this.userdata.email,
        password: this.userdata.password,
        age: this.userdata.age,
        Message: this.message,
        SendSMS: this.sendSms,
        Gender : this.gender,
        Transport : this.transport,
        Priority: this.selectedPriority
      }).then((data)=>{
        this.$toast("Succesfully Registered", {
          timeout: 1000,
        });
        setTimeout(()=>{
          this.$router.go()
        },1000);

      }).catch(error => console.log(error))

    }
  }
}
</script>

<style>

</style>
