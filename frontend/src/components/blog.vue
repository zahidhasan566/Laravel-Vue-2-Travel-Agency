<template>
  <div>
    <div class="container">
     <h1> Recent News</h1>
<!--    <div v-for="blog in blogs" :key="blog">-->
<!--      {{blog}}-->
<!--    </div>-->
      <div class="row">
      <article class="col-12 col-md-6 tm-post" v-for="bp in blogPost.data " :key="bp">
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
<!--        <p>Selected page: {{page}}</p>-->
<!--        <pagination v-model="page" :perPage="2" :records="100" @paginate="myCallback" @pagination-change-page="getPost"/>-->
        <div class="float-right">
        <pagination class="" :data="blogPost" :limit="2" @pagination-change-page="getPost"> </pagination>
        </div>
      </div>
  </div>
  </div>
</template>

<script>


import axios from "axios";
import Paginate from 'vuejs-paginate'


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
  // created() {
  //    this.$http.get('https://jsonplaceholder.typicode.com/posts').then((data)=>{
  //      console.log(data);
  //      this.blogs= data.body
  //    })
  // },
  mounted() {
    this.getPost(),
        this.getProfilePicture();
  },
  components: {

  },
  methods:{
    postMsg(){
      this.$router.push({name:"post_create"});
    },
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
    callback: function(page) {
      console.log(`Page ${page} was selected. Do something about it`);
    }

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
  max-height: 300px;
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

</style>
