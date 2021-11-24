<template>
  <div style=" background: url(https://www.kibrispdr.org/dwn/0/wallpaper-for-whatsapp-chat-background.jpg)">
    <div class="container">
      <div class="row">
        <div>

        </div>
        <div class="col-lg-4 col-md-6 col-sm-8 mx-auto" >
          <div style="height:500px; display: flex; flex-direction: column-reverse;overflow:auto;">
          <div v-if="!registerActive" class="card login" v-bind:class="{ error: emptyFields }">
            <h1 style="text-align: center">Chat With Admin</h1>
              <p style="text-align: center;color: red"> YOUR ID : {{id}}</p>
<!--    <textarea name="comment" style="color: white;background: #00adff;padding-left: 10px;border-radius: 33px;padding-top: 10px;" readonly >Receiver</textarea>-->
<!--            <div v-for="rcv in all_rcv_msg" :key="rcv" style="color: white;margin-top: 10px;background: #00adff;padding-left: 10px;border-radius: 33px;padding-top: 10px;" readonly>-->
<!--              {{rcv['message']}}-->
<!--            </div>-->
<!--            <div v-for="am in all_msg" :key="am" style="margin-left: 70px;margin-top: 10px;margin-bottom: 5px;-->
<!--             color: white;background: #007bff;padding-left: 10px;border-radius: 33px;-->
<!--             ">-->
<!--              {{am['message']}}-->
<!--            </div>-->
<!--    <textarea name="comment"-->
<!--              style="margin-left: 70px;margin-top:10px; color: white;background: #007bff;padding-left: 10px;border-radius: 33px;padding-top: 10px;" readonly >-->
<!--   sender </textarea>-->
            <div v-for="am in all_msg" :key="am" >
              <div v-if="am['type']==='admin'">
                <div  style="color: white;margin-top: 10px;background: #ff2292d9;padding-left: 10px;border-radius: 33px;padding-top: 5px;padding-bottom: 5px" readonly>
                  {{am['message']}}
                </div>
              </div>

              <div v-else>
                <div v-if="am['message']!== null">
                <div style="margin-left: 70px;margin-top: 10px;margin-bottom: 5px; color: white;background: #007bff;padding-left: 10px;border-radius: 33px;padding-top: 5px;padding-bottom: 5px">

                    {{am['message']}}
                  </div>
                </div>
              </div>
            </div>
          </div>
          </div>
          <input  type="text" v-model="messages" class="form-control" placeholder="Chat" style="border: 2px solid" required>
          <div style="text-align: end">
            <input type="submit" value="Send" class="btn btn-primary" @click.prevent="doSend">
          </div>
        </div>
      </div>
    </div>
  </div>
</template>


<script>
import axios from "axios";

export default {
  created(){
    this.id=this.$route.params.id;
    // this.doSend();
  },

  mounted(){
    this.id=this.$route.params.id;
    this.PreviousMsg();
    window.Echo.channel('chatAdmin').listen('AdminChatEvent', (e) => {
      //this.all_msg = e;
      this.PreviousMsg();
    })
     //this.doReceive();
    // this.PreviousMsgAdmin();
  },
  data() {
    return {
      messages:'',
      id:'',
      live_message:[],
      all_msg:[],
      all_rcv_msg:[]
    };
  },


  methods:{
    doSend(){
      axios.post('http://localhost:8000/api/customer/live-chat', {
        id:this.$route.params.id,
        messages:this.messages,
      }).then((data)=>{
        this.messages='';
        this.PreviousMsg();
      }).catch(error =>
          this.$toast("Invalid Message 1", {
            timeout: 1000,
          }),)
    },
    PreviousMsg(){
      axios.post('http://localhost:8000/api/customer/previous-msg/' + this.id).then((response)=>{
             this.all_msg= response.data.all_msg
           })
    },
    // doReceive(){
    //   axios.post('http://localhost:8000/api/customer/receive-chat', {
    //     id:this.id,
    //     admin_id:34,
    //     messages:this.messages,
    //   }).then((data)=>{
    //     window.Echo.channel('chatAdmin').listen('AdminChatEvent', (e) => {
    //      // this.all_msg = e;
    //       this.PreviousMsg();
    //     })
    //   }).catch(error =>
    //       this.$toast("Invalid Message", {
    //         timeout: 1000,
    //       }),)
    //
    // },
    // PreviousMsgAdmin(){
    //   axios.post('http://localhost:8000/api/admin/previous-msg/' + 34,{
    //     customer_id:this.id,
    //     user_id: 34,
    //   }).then((response)=>{
    //     this.all_rcv_msg= response.data.all_msg
    //
    //   })
    // }

  }
};
</script>
