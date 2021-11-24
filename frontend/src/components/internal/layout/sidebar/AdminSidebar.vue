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
      <v-list-item v-for="[icon, text,link] in links" :key="icon" link :to="link" >
        <v-list-item-icon>
          <v-icon>{{ icon }}</v-icon>
        </v-list-item-icon>
        <v-list-item-content>
          <v-list-item-title>{{ text }}</v-list-item-title>
        </v-list-item-content>
      </v-list-item>
    </v-list>
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
        ["mdi-microsoft-windows", "Dashboard","/login/current-user-dashboard"],
        ["mdi-card-account-details-outline", "Blog","/login/post"],
        ["mdi-account", "Chat","/chat/customer"],
        ["mdi-card-account-details-outline", "Orders","/blog",],
        ["mdi-cog", "System Setting","/blog"],
      ],
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
