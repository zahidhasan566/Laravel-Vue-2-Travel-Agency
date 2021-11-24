<template>
  <v-app>
    <v-main>
     <router-view></router-view>
    </v-main>
  </v-app>
</template>

<script>
export default {
  name: 'App',

  components: {


  },

  data: () => ({
    loginNext: [
      {

        href: this.$router.push({ name: 'login' })
      }
    ]

    //
  }),
  computed: {

  },
  methods:{
    appbar_close () {
      return this.$route.meta.appbar_close
    },
    loginPage(){
      if(this.$route.path == "/login/dashboard" || this.$route.path == "/login/current-user-dashboard" || this.$route.path == "/login/post" ||this.$route.path == "/admin/post-create" ) {
        return false
      } else {
        return true
      }
    },
    goToHome(){
      this.$router.push({ name: 'login' })
    }
  }
};
</script>
