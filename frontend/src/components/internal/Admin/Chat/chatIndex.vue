<template>
  <div>
    <h1 style="background: #67d551; margin-bottom: 20px"> Chat With Customer </h1>
    <table id="datatable1" class="table table-sm" >
      <thead>
      <tr>
        <th style="text-align: center">id </th>
        <th style="text-align: center" >Name</th>
        <th style="text-align: center"> Last Message</th>
        <th style="text-align: center">Action</th>

      </tr>
      </thead>
      <tbody>


      <tr v-for="(ch,index) in customer_info" :key="index">
        <td style="text-align: center"> {{ ch.user_id}}  </td>
        <td style="text-align: center"> {{ch.user_name }}  </td>
        <td style="text-align: center"> {{ch.message }}  </td>
        <td style="text-align: center">
          <button
              class="btn btn-primary" @click.prevent="updateChat(ch.user_id)">chat
          </button>
          <button class="badd2" @click.prevent="deletePost(bp['id'])" >Delete</button>
        </td>
      </tr>
      </tbody>
    </table>
    <pagination class="" :data="customer_info" :limit="2" @pagination-change-page="getChatPost"> </pagination>
  </div>
</template>
<script>
import axios from "axios";
import Echo from 'laravel-echo'

export default {
  data() {
    return {
       customer_msg:[],
       customer_info:[]
    }
  },
  mounted() {
    this.getChatPost()
  },
  methods:{
      getChatPost(page = 1) {
        axios.post('http://localhost:8000/api/admin/view-chat-post?page=' + page)
            .then(response => {
              this.customer_info = response.data.customer_info
            })
            .catch(error => {
              console.log(error)
            })
    },
    updateChat($id){
      this.$router.push({name:"chat_admin",params: { id: $id }});
    }


  }
}

</script>
<style scoped>
.badd2 {
  padding: 5px 5px;
  border: 1px solid #ddd;
  color: #ffffff;
  background-color: red;
  border-radius: 4px;
  font-size: 18px;
}
</style>
