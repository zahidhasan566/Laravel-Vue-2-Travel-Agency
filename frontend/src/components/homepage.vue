<template>
  <div>
      <div>
        <div class="container">
          <div class="row">

            <div class="col-md-6" style="text-align: center">
              <div class="row" style=" padding-top: 10%;">
                <div>
                  <img src="../assets/agency/logo2.png" alt="ag" style="width: 200px; height: 200px">
                </div>
                <h1> Welcome to <br> J Agency</h1>

              </div>


            </div>
            <div class="col-md-6">
              <img src="../assets/agency/ag.jpg" alt="ag">
            </div>
          </div>
        </div>

        <div class="col-md-12" style="text-align: center">

          <h2> About Us </h2>

          <p>
            The main discussion topics at JAgency often pave the way to surprising and unexpected conversations thanks to our engaged forum users. <br>Our Forum is dedicated to enhancing the forum experience by offering plenty of opportunities  <br> for users to engage with each other in an interesting and safe online environment.</p>
        </div>

<!--        blog sec-->
<section class="bpost">
        <div class="row">
          <div class="container">
            <h2 style="text-align: center"> Blogs </h2>
          <article class=" col-md-4 tm-post" v-for="bp in blogPost.data " :key="bp" style="float:left">
            <hr class="tm-hr-primary">
            <a href="javascript:void(0)" class="effect-lily tm-post-link tm-pt-60">
              <div class="tm-post-link-inner">
                <img :src="bp['path']"  alt="Image" class="img-fluid">
              </div>
              <span class="position-absolute tm-new-badge">New</span>
              <h2 class="tm-pt-30 tm-color-primary tm-post-title">{{ bp['title']}}</h2>
            </a>
            <p class="tm-pt-30">
              {{ bp['content']}}
            </p>
            <div class="d-flex justify-content-between tm-pt-45">
              <span class="tm-color-primary">Travel . Events</span>
              <span class="tm-color-primary">June 24, 2020</span>
            </div>
            <hr>
            <div class="d-flex justify-content-between">
              <span>36 comments</span>
              <span>by Admin Nat</span>
            </div>

          </article>
            <div class="hbtn" style="text-align: end">
              <b-button variant="success" href="/blog" style="color: #ffffff; background:#007bff; border: none;">View All </b-button>
            </div>
          </div>
          </div>

</section>
      </div>
  </div>
</template>
<script>

import axios from "axios";

export default {
  data(){
    return{
      blogs:[],
      blogPost:[],
      image: [],
      profile_picture: '',
      update_profile_picture : '',
      page: 1,
      perPage: 3,
      pageSize: 2,
      count: 6,

    }
  },
  mounted() {
    this.getPost(),
        this.getProfilePicture();
  },
  components: {

  },
  methods:{
    getPost(page = 1) {
      axios.post('http://localhost:8000/api/admin/home/view-blog-post?page=' + page)
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
  }


}

</script>

<style scoped>
.tm-color-primary, span.tm-color-primary {
  color: #099;
}
.tm-new-badge {
  top: 25px;
  right: -10px
;
  background-color: #0CC;
  color: white;
  padding: 5px 20px
;
}
.tm-pt-30 {
  padding-top: 15px;
}
.tm-pt-45 {
  padding-top: 15px;
}
hr.tm-hr-primary {
  border-top: 5px solid #0CC;
}
hr {
  border-top-color: #CCC;
  margin-top: 10px;
  margin-bottom: 10px;
}
.position-absolute {
  position: absolute!important;
}
.effect-lily:hover img {
  -webkit-transform: translate3d(0,0,0);
  transform: translate3d(0,0,0);
}
.effect-lily:hover img {
  opacity: 1;
}
.effect-lily img {
  max-width: 570px;
  max-height: 205px;
  width: -webkit-calc(100% + 50px
  );
  width: calc(100% + 50px
  );
  opacity: 0.7;
  -webkit-transition: opacity 0.35s, -webkit-transform 0.35s;
  transition: opacity 0.35s, transform 0.35s;
  -webkit-transform: translate3d(-40px
  ,0, 0);
  transform: translate3d(-40px
  ,0,0);
}
.tm-post {
  margin-bottom: 30px;
}
/*.tm-pt-60 {*/
/*  padding-top: 45px*/
/*;*/
/*}*/
hr.tm-hr-primary {
  border-top: 5px solid #0CC;
}
.tm-post-link-inner {
  overflow: hidden;
  background: #3085a3;
}
.tm-post-link {
  display: block;
  position: relative;
  cursor: pointer;
}
.tm-post-link img {
  position: relative;
  display: block;
  min-height: 100%;
  max-width: 100%;
  opacity: 0.8;
}
.img-fluid {
  max-width: 100%;
  height: auto;
}
.bpost{
  overflow: hidden;
  padding-bottom: 80px;
}


</style>
