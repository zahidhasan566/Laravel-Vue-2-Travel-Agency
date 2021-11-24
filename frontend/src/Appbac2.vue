<template>

  <v-app>
    <!--    <v-app-bar v-if = (loginPage())-->
    <!--        app-->
    <!--        color="primary"-->
    <!--        dark-->
    <!--    >-->

    <!--      <div class="d-flex align-center">-->
    <!--        <v-img-->
    <!--            src="require('../assets/logo.svg')"-->
    <!--            alt="Clogo"-->
    <!--            contain-->
    <!--            transition="scale-transition"-->
    <!--            width="40"-->
    <!--            aspect-ratio="1"-->
    <!--        />-->

    <!--        <v-img-->
    <!--            alt="Vuetify Name"-->
    <!--            class="shrink mt-1 hidden-sm-and-down"-->
    <!--            contain-->
    <!--            min-width="100"-->
    <!--            src="require('img')"-->
    <!--            width="100"-->
    <!--        />-->
    <!--        <v-btn-->
    <!--            href="/Home"-->
    <!--            text-->
    <!--        >-->
    <!--          <span class="mr-2">Home</span>-->
    <!--        </v-btn>-->

    <!--        <v-btn-->
    <!--            href="/register"-->
    <!--            text-->
    <!--        >-->
    <!--          <span class="mr-2">Registration</span>-->
    <!--        </v-btn>-->
    <!--        <v-btn-->
    <!--            href="/customer"-->
    <!--            text-->
    <!--        >-->
    <!--          <span class="mr-2">Customers</span>-->
    <!--        </v-btn>-->
    <!--        <v-btn-->
    <!--            href="/service"-->
    <!--            text-->
    <!--        >-->
    <!--          <span class="mr-2">Services</span>-->
    <!--        </v-btn>-->
    <!--        <v-btn-->
    <!--            href="/blog"-->
    <!--            text-->
    <!--        >-->
    <!--          <span class="mr-2">Blog</span>-->
    <!--        </v-btn>-->
    <!--      </div>-->

    <!--      <v-spacer></v-spacer>-->


    <!--      <v-btn-->

    <!--          href="/login"-->
    <!--          text-->
    <!--      >-->
    <!--        <span class="mr-2">Login</span>-->
    <!--        <v-icon>mdi-open-in-new</v-icon>-->
    <!--      </v-btn>-->
    <!--&lt;!&ndash;      <button @click="goToHome()">test </button>&ndash;&gt;-->
    <!--    </v-app-bar>-->

    <v-main>
      <router-view></router-view>
    </v-main>

  </v-app>
  <!--    <v-app dark>-->
  <!--      <v-tabs fixed-tabs>-->
  <!--        <v-tab to="/foo">Foo</v-tab>-->
  <!--        <v-tab to="/bar">Bar</v-tab>-->
  <!--      </v-tabs>-->
  <!--      <router-view></router-view>-->
  <!--    </v-app>-->

</template>

<script>
import HelloWorld from './components/HelloWorld';


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
