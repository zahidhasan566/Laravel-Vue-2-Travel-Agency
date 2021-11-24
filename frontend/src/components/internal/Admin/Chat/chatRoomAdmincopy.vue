<template>
  <div>
    <div class="container">
      <div class="row">
        <div>

        </div>
        <div class="col-lg-4 col-md-6 col-sm-8 mx-auto" >
          <div style="overflow-y:scroll; height:500px;">
            <div>
              <h1 style="text-align: center">Chat With Customer</h1>
              <p style="text-align: center;color: red"> Customer Id : {{id}}</p>
              <textarea name="comment" style="color: white;background: #00adff;padding-left: 10px;border-radius: 33px;padding-top: 10px;" readonly >Receiver</textarea>
              <div v-for="rcv in all_rcv_msg" :key="rcv">
                <div v-for="am in all_msg" :key="am">
                <div v-if="rcv['time']<am['time']">
                  <div  style="color: white;margin-top: 10px;background: #00adff;padding-left: 10px;border-radius: 33px;padding-top: 10px;" readonly>
                    {{rcv['message']}}
                    </div>
                </div>
                  <div v-else>
                    <div style="margin-left: 70px;margin-top: 10px;margin-bottom: 5px;
             color: white;background: #007bff;padding-left: 10px;border-radius: 33px;
             ">
                      {{am['message']}}
                    </div>
                  </div>
                </div>
              </div>
<!--              <div v-for="am in all_msg" :key="am" style="margin-left: 70px;margin-top: 10px;margin-bottom: 5px;-->
<!--             color: white;background: #007bff;padding-left: 10px;border-radius: 33px;-->
<!--             ">-->
<!--                {{am['message']}}-->
<!--              </div>-->
            </div>
          </div>
          <input  type="text" v-model="messages" class="form-control" placeholder="Chat" required>
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

  mounted(){
    this.id=this.$route.params.id;
    this.PreviousMsg();
    this.doReceive();
    this.PreviousMsgCustomer();
    //this.compareTiming(this.all_msg,this.all_rcv_msg);
  },
  props: ["userdata"],
  data() {
    return {
      messages:'',
      id:'',
      live_message:[],
      all_msg:[],
      all_rcv_msg :[],
      all_live_rcv_msg :[]
    };
  },
  methods:{
   doSend(){
     axios.post('http://localhost:8000/api/admin/live-chat', {
       user_id: this.userdata.id,
       customer_id:this.id,
       messages:this.messages,
     }).then((data)=>{
       window.Echo.channel('chatAdmin').listen('AdminChatEvent', (e) => {
         this.live_message = e;
         this.PreviousMsg();
       })
     }).catch(error =>
         this.$toast("Invalid Message", {
           timeout: 1000,
         }),)
   },
    PreviousMsg(){
      axios.post('http://localhost:8000/api/admin/previous-msg/' +  this.userdata.id, {
        customer_id:this.id,
        user_id: this.userdata.id,
      }).then((response)=>{
        this.all_msg= response.data.all_msg
      })
    },
    doReceive(){
      axios.post('http://localhost:8000/api/admin/receive-chat', {
        user_id: this.userdata.id,
        customer_id:this.id,
        messages:this.messages,
      }).then((data)=>{
        window.Echo.channel('chat23').listen('ChatEvent', (e) => {
          this.all_rcv_msg = e;
          this.PreviousMsgCustomer();
        })
      }).catch(error =>
          this.$toast("Invalid Message", {
            timeout: 1000,
          }),)

    },

    PreviousMsgCustomer(){
      axios.post('http://localhost:8000/api/customer/previous-msg/' + this.id).then((response)=>{
        this.all_rcv_msg= response.data.all_msg
      })
    },
    compareTiming(){

    }

  }
};
</script>
