<template>
  <div class="row">
  <div class="container" style="text-align: -webkit-center">
    <div class="col-md-2">

    </div>
    <div class="col-md-8">
      <form>
        <div class="row">
          <div class="col-xs-12 col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3">
            <h1> Travel Booking Form </h1>
            <hr>
            <div class="form-group">
              <label for="email">Name</label>
              <input
                  type="text"
                  id="name"
                  class="form-control"
                  v-model="userdata.name">

            </div>
            <div class="form-group">
              <label for="age">Age</label>
              <input
                  type="number"
                  id="age"
                  class="form-control"
                  v-model="userdata.age">

            </div>
            <div class="form-group">
              <label for="email">Mail</label>
              <input
                  type="text"
                  id="email"
                  class="form-control"
                  v-model="userdata.email">

            </div>
            <div class="form-group">
              <label for="password">Password</label>
              <input
                  type="password"
                  id="password"
                  class="form-control"
                  v-model="userdata.password">

            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-12 col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3" style="background: #ffffff;">
            <div class="form-group">
              <label >Select SMS Option </label> <br>
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
          <div class="col-xs-12 col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3 form-group" style="background: #ffffff;">
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
        <div class="row">
          <div class="col-xs-12 col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3 form-group" style="background: #ffffff;">
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
        <div class="row">
          <div class="col-xs-12 col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3 from-group">
            <label for="priority">Priority</label>
            <select
                id="priority"
                class="form-control" v-model="selectedPriority">
              <option v-for="priority in userdata.priorities" :key="priority">{{priority}}</option>
            </select>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-12 col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3 form-group">
            <label for="message" >Comments</label><br>

            <textarea
                id="message"
                rows="5"
                class="form-control" v-model="message">
                    </textarea>
          </div>
        </div>
        <hr>
        <div class="row">
          <div class="col-xs-12 col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3">
            <button
                class="btn btn-primary" @click.prevent="saveData">Submit!
            </button>
          </div>
        </div>
      </form>
      <hr>
<!--      <div class="row" v-if="isSubmitted">-->
<!--        <div class="col-xs-12 col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3">-->
<!--          <div class="panel panel-default">-->
<!--            <div class="panel-heading">-->
<!--              <h4>Your Data</h4>-->
<!--            </div>-->
<!--            <div class="panel-body">-->
<!--              <p>Mail:{{userdata.email}}</p>-->
<!--              <p>Password:{{userdata.password}}</p>-->
<!--              <p>Age:{{userdata.age}}</p>-->
<!--              <p>Message:{{message}} </p>-->
<!--              <p><strong>Send Mail?</strong></p>-->
<!--              <ul>-->
<!--                <li v-for="mail in sendMail" :key="mail">-->
<!--                  {{mail}}-->

<!--                </li>-->
<!--              </ul>-->
<!--              <p>Gender:{{gender}}</p>-->
<!--              <p>Priority:{{selectedPriority}}</p>-->
<!--              <p>Switched:</p>-->
<!--            </div>-->
<!--          </div>-->
<!--        </div>-->
<!--      </div>-->
    </div>




    <div class="col-md-2">

    </div>

  </div>
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
