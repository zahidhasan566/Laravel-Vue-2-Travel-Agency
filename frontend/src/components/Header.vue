<template>

  <div>
    <v-app-bar
               app
               color="primary"
               dark
    >

      <div class="d-flex align-center">
        <v-img
            src="require('../assets/logo.svg')"
            alt="Clogo"
            contain
            transition="scale-transition"
            width="40"
            aspect-ratio="1"
        />

        <v-img
            alt="Vuetify Name"
            class="shrink mt-1 hidden-sm-and-down"
            contain
            min-width="100"
            src="require('img')"
            width="100"
        />
        <v-btn
            href="/home"
            text
        >
          <span class="mr-2">Home</span>
        </v-btn>

        <v-btn
            href="/register"
            text
        >
          <span class="mr-2">Registration</span>
        </v-btn>
        <v-btn
            href="/customer"
            text
        >
          <span class="mr-2">Customers</span>
        </v-btn>
        <v-btn
            href="/service"
            text
        >
          <span class="mr-2">Services</span>
        </v-btn>
        <v-btn
            href="/blog"
            text
        >
          <span class="mr-2">Blog</span>
        </v-btn>
        <v-btn
            href="/chat"
            text
        >
          <span class="mr-2">Chat</span>
        </v-btn>
      </div>

      <v-spacer></v-spacer>


      <v-menu offset-y>
        <template v-slot:activator="{ attrs, on }">
        <span
            class="mx-5 mr-10"
            style="cursor: pointer"
            v-bind="attrs"
            v-on="on"
        >
          <v-badge content="3" color="red" offset-y="10" offset-x="10">
            <v-icon>mdi-bell</v-icon>
          </v-badge>
        </span>
        </template>
        <v-list three-line width="250">
          <div>

            <v-list-item v-for="bp in blogPost.data " :key="bp">

              <v-list-item-avatar>
                <v-img :src="bp['path']"></v-img>
              </v-list-item-avatar>

              <v-list-item-content style="padding: 0">
                <div v-if="message2 ==bp['title'] ">
                  <v-list-item-title style="font-size: 20px;padding-top: 0;color: red" >{{ bp['title']}} * New</v-list-item-title>
                </div>
                <div v-else>
                  <v-list-item-title style="font-size: 20px;padding-top: 0" >{{ bp['title']}}</v-list-item-title>
                </div>
              </v-list-item-content>
            </v-list-item>

          </div>
        </v-list>
      </v-menu>

      <v-btn

          href="/login"
          text
      >
        <span class="mr-2">Login</span>
        <v-icon>mdi-open-in-new</v-icon>
      </v-btn>
      <!--      <button @click="goToHome()">test </button>-->
    </v-app-bar>
  </div>

</template>
<script>
import axios from "axios";

export default {
  data() {
    return {
      message:[],
      message2:[],
      blogPost: [],
      image: [],
      profile_picture: '',
      update_profile_picture: '',
      bell:''

    };
  },
  created() {
    window.Echo.channel('postCreate23').listen('PostCreated', (e) => {
      this.message = e;
      this.message2 = this.message.post.title;
      this.getPost(),
      this.getProfilePicture()
      this.bell=1
    })
  },
  mounted() {
    this.getPost(),
        this.getProfilePicture();
  },
  methods:{
    getPost(page = 1) {
      axios.post('http://localhost:8000/api/admin/view-blog-post?page=' + page)
          .then(response => {
            this.blogPost = response.data.blogPost
          })
          .catch(error => {
            console.log(error)
          })
    },
    getProfilePicture() {
      this.update_profile_picture = this.$refs.profilePicture.files[0]
      if (this.update_profile_picture.size > 3072000) {
        this.$notification.error({
          message: 'File size not greater then 3 MB',
        })
        this.update_profile_picture = ''
      }
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
  }
};
</script>
