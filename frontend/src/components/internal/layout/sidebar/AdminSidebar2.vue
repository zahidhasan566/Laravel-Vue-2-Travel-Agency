<template>
  <div>
    <v-navigation-drawer v-model="drawer" app>
      <v-img
          height="140"
          class="pa-4"
          src="https://preview.pixlr.com/images/800wm/1439/2/1439104804.jpg"
      >
        <div class="text-center">
          <v-avatar class="mb-4" color="grey darken-1" size="64">
            <v-img
                aspect-ratio="30"
                src="https://yt3.ggpht.com/esazPAO03T0f0vKdByJvkDy6MSwjyG5f-c_2S2CJapszQ3KPQyZarpoqvgv0Us0atUbILytj=s88-c-k-c0x00ffffff-no-rj"
            />
          </v-avatar>
          <h2 class="black--text">{{ userdata.name }}</h2>
        </div>
      </v-img>
      <!--    <v-divider></v-divider>-->
      <v-list>
        <v-list-item v-for="[icon, text] in links" :key="icon" link>
          <v-list-item-icon>
            <v-icon>{{ icon }}</v-icon>
          </v-list-item-icon>

          <v-list-item-content>
            <v-list-item-title><router-link to="link" tag="span" style="cursor: pointer"> {{ text }} </router-link></v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list>

      <v-list>
        <v-list-item link v-for="(menu,index) in menus" :key="index" :to="menu.route">
          <v-list-item-title> {{menu.title}}</v-list-item-title>
        </v-list-item>
      </v-list>

      <!--    <v-btn-->
      <!--        href="/login/post"-->
      <!--        text-->
      <!--    >-->
      <!--      <span class="mr-2">postest</span>-->
      <!--    </v-btn>-->
      <!--    <v-btn-->
      <!--        href="/login/current-user-dashboard"-->
      <!--        text-->
      <!--    >-->
      <!--      <span class="mr-2">testdashboard</span>-->
      <!--    </v-btn>-->
    </v-navigation-drawer>

  </div>
</template>

<script>
export default {
  name: "Sidebar",
  props: ["drawer","userdata"],

  data() {
    return {
      links: [
        ["mdi-microsoft-windows", "Dashboard","/login/current-user-dashboard","userdata"],
        ["mdi-card-account-details-outline", "Blog","/login/post","userdata"],
        ["mdi-account", "Profile","/blog","userdata"],
        ["mdi-card-account-details-outline", "Orders","/blog","userdata"],
        ["mdi-cog", "System Setting","/blog","userdata"],
      ],
      menus:[
        {title:'testdashboard2', route:'/login/current-user-dashboard'},
        {title:'testblog2', route:'/login/post'},

        {title:'testHome', route:'home'},

      ]
    };
  },
};
</script>

<style scoped>
.wrapper {
  max-width: 100px;
  min-height: 100vh;
  float:left;
  background-color:red;
}
</style>
