<template>
  <div>

    <div class="row">
      <div class="col-md-1">
        <div v-if ="roles.name==='Admin'">
          <Topbar @drawerEvent="drawer = !drawer" :userdata="users" />
          <adminSidebar :drawer="drawer" :userdata="users" />

        </div>
      </div>
      <div class="col-md-11">
        <v-main style="padding: 0">
          <router-view :userdata="users"> </router-view>
        </v-main>

      </div>

    </div>

  </div>
</template>

<style>

</style>

<script>
import axios from "axios";
import adminSidebar from '../internal/layout/sidebar/AdminSidebar.vue';
// import adminSidebar2 from '../internal/layout/sidebar/AdminSidebar2.vue';
import Topbar from '../internal/layout/sidebar/Topbar.vue';

export default {
  components: {
    adminSidebar,
    // adminSidebar2,
    Topbar
  },
  data(){
    return{
      users:'',
      isLoggedIn: false,
      roles:[],
      drawer: null,
    }
  },
  mounted() {
    const token = localStorage.getItem("token");
    const headers = {
      "Authorization": "Bearer " + token,
      'Content-Type': 'application/json'
    };

    axios.get('http://localhost:8000/api/user',  {
          headers: {
            Authorization: 'Bearer ' + token, //the token is a variable which holds the token
            'Content-Type': 'application/json'
          }
        })
        .then(response => {
          this.isLoggedIn = true
          this.users = response.data;
          this.getRole(this.users.id);
        })
        .catch(error => {
          console.log(error)
        })
    //this.getRole();
  },
  methods:{
    loggedIn(){
      return localStorage.getItem("token")
    },
    logout(){
      axios.post('http://localhost:8000/api/logout').then((response)=>{
        localStorage.removeItem("token");
        this.$toast("Successfully Logout", {
          timeout: 2000,
        });
        this.$router.push({name:"login"});
      }).catch(error => console.log(error))
    },
    getRole(id){
      axios.post('http://localhost:8000/api/dashboard',{
        id:id,
      })
        .then(response => {
          console.log(response)
          this.roles = response.data.roles
        })
        .catch(error => {
          console.log(error)
        })
    }

  }
  }


</script>
