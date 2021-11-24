<template>
  <v-app-bar app elevate-on-scroll elevation="3" color="white">
    <v-app-bar-nav-icon @click="$emit('drawerEvent')"></v-app-bar-nav-icon>
    <v-spacer />
    <v-col lg="6" cols="12">
      <v-form>
        <v-text-field
          class="p-0 m-0 mt-6"
          full-width
          dense
          append-icon="mdi-magnify"
          outlined
          rounded
          placeholder="Search"
        />
      </v-form>
    </v-col>
    <v-spacer />
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
        <template v-for="(item, index) in items">
          <v-subheader
            v-if="item.header"
            :key="item.header"
            v-text="item.header"
          ></v-subheader>

          <v-divider
            v-else-if="item.divider"
            :key="index"
            :inset="item.inset"
          ></v-divider>

          <v-list-item v-else :key="item.title">
            <v-list-item-avatar>
              <v-img :src="item.avatar"></v-img>
            </v-list-item-avatar>

            <v-list-item-content>
              <v-list-item-title v-html="item.title"></v-list-item-title>
              <v-list-item-subtitle
                v-html="item.subtitle"
              ></v-list-item-subtitle>
              <v-list-item-subtitle
                  v-html="message2"
              ></v-list-item-subtitle>
            </v-list-item-content>
          </v-list-item>
        </template>
      </v-list>
    </v-menu>
    <v-menu offset-y>
      <template v-slot:activator="{ attrs, on }">
        <span style="cursor: pointer" v-bind="attrs" v-on="on">
          <v-chip link>
            <v-badge dot bottom color="green" offset-y="10" offset-x="10">
              <v-avatar size="40">
                <v-img src="https://randomuser.me/api/portraits/women/81.jpg" />
              </v-avatar>
            </v-badge>
            <span class="ml-3">{{userdata.name}}</span>
          </v-chip>
        </span>
      </template>
      <v-list width="250" class="py-0">
        <v-list-item two-line>
          <v-list-item-avatar>
            <img src="https://randomuser.me/api/portraits/women/81.jpg" />
          </v-list-item-avatar>

          <v-list-item-content>
            <v-list-item-title>{{userdata.name}}</v-list-item-title>
            <v-list-item-subtitle>Logged In</v-list-item-subtitle>
          </v-list-item-content>
        </v-list-item>
        <v-divider />
        <v-list-item link v-for="(menu, i) in menus" :key="i">
          <v-list-item-icon>
            <v-icon>{{ menu.icon }}</v-icon>
          </v-list-item-icon>
          <v-list-item-title>
            {{ menu.title }}
          </v-list-item-title>
        </v-list-item>
        <v-list-item>
          <v-list-item-icon>
            <v-icon>mdi-logout</v-icon>
          </v-list-item-icon>
          <v-list-item-title>
            <button @click.prevent="logout()">Log Out</button>
          </v-list-item-title>
        </v-list-item>
      </v-list>
    </v-menu>
  </v-app-bar>
</template>

<script>
import axios from "axios";

export default {
  name: "Topbar",
  props: ["userdata"],
  data() {
    return {
      message:[],
      message2:[],
      blogPost: [],
      image: [],
      profile_picture: '',
      update_profile_picture: '',
      menus: [
        { title: "Profile", icon: "mdi-account" },
        { title: "Change Password", icon: "mdi-key" },
        { title: "Setting", icon: "mdi-cog" },
        // { title: "Logout", icon: "mdi-logout" },
      ],
      items: [
        {
          avatar: "https://cdn.vuetifyjs.com/images/lists/4.jpg",
          title: this.message2,
          subtitle:
              '<span class="text--primary">this.title</span>',
        },
        { divider: true, inset: true },
        {
          avatar: "https://cdn.vuetifyjs.com/images/lists/1.jpg",
          title: "Brunch this weekend?",
          subtitle: `<span class="text--primary">Ali Connors</span> &mdash; I'll be in your neighborhood doing errands this weekend. Do you want to hang out?`,
        },
        { divider: true, inset: true },
        {
          avatar: "https://cdn.vuetifyjs.com/images/lists/2.jpg",
          title: 'Summer BBQ <span class="grey--text text--lighten-1">4</span>',
          subtitle: `<span class="text--primary">to Alex, Scott, Jennifer</span> &mdash; Wish I could come, but I'm out of town this weekend.`,
        },
        { divider: true, inset: true },
      ],
    };
  },
  created() {
    this.getPost(),
        this.getProfilePicture();
    window.Echo.channel('postCreate23').listen('PostCreated', (e) => {
       this.message = e;
       this.message2 = this.message.post.title;
      console.log(this.message.post.title);
      alert(",cmnx,mcnxz,.cnkvd");
    })
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

<style scoped></style>
