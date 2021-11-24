<template>
  <div>

    <h1 style="background: aquamarine;"> Blog Posts </h1>
    <button class="badd" @click.prevent="postMsg()" >Create New Post</button>

    <p style="padding: 10px 10px; margin-top: 25px; background: #ffec65; font-size: 18px; font-weight: bolder"> Previous Posts </p>
    <table id="datatable1" class="table table-sm" >
      <thead>
      <tr>
        <th style="text-align: center">Id </th>
        <th style="text-align: center" >Post Title</th>
        <th style="text-align: center">Post Content</th>
        <th style="text-align: center" >Blog pic</th>
        <th style="text-align: center">Blog Created</th>
        <th style="text-align: center">Action</th>

      </tr>
      </thead>
      <tbody>


      <tr v-for="bp in blogPost.data " :key="bp">
        <td style="text-align: center">   {{ bp['id']}}</td>
        <td style="text-align: center">   {{ bp['title']}}</td>
        <td style="text-align: center">   {{ bp['content']}}</td>
        <td style="text-align: center">   <img :src="bp['path']"  width="50px" height="50px"></td>
        <td style="text-align: center">   {{ bp['created_at']}}</td>
        <td style="text-align: center">
          <button
              class="btn btn-primary" @click.prevent="updateData(bp['id']),$bvModal.show('editModal')">View
          </button>
          <button class="badd2" @click.prevent="deletePost(bp['id'])" >Delete</button>

        </td>

      </tr>
      </tbody>
    </table>
    <pagination class="" :data="blogPost" :limit="2" @pagination-change-page="getPost"> </pagination>
<!--    modal show-->
    <b-modal id="editModal" size="lg" hide-footer style="background: none">
      <div class="d-block text-center">
        <h3> Blogs Information !</h3>
      </div>

      <div class="row">
        <div class="col-md-12">
          <label for="btitle_update">Title</label>
          <input
              type="text"
              id="btitle_update"
              class="form-control"
              v-model="blogs_update['title']">

        </div>
      </div>
      <div class="row">
        <div class="col-md-12" >
          <label for="content_update">Content</label>
          <input
              type="text"
              id="content_update"
              class="form-control"
              v-model="blogs_update['content']">

        </div>
      </div>
      <div class="row">
        <div class="col-md-12">
          <label >Photo</label>
          <img :src="blogs_update['path']"  width="200px" height="200px">

        </div>
      </div>
      <label > Select Updated Photo</label>:
      <input type="file" ref="profilePicture" accept=".jpg,.jpeg,.png" @change="onFileChanged">

      <b-button class="mt-3" style="width: 10%; background: red" block @click="$bvModal.hide('editModal')">Close </b-button>
      <b-button class="mt-3" style="width: 20%;margin-left: 15px; background: green" block @click="updateConfirmData(blogs_update['id'])">Update</b-button>
    </b-modal>
  </div>

</template>
<style>
.badd {
  padding: 10px 20px;
  border: 1px solid #ddd;
  color: #ffffff;
  background-color: #13ce66;
  border-radius: 4px;
  font-size: 18px;
}
.badd2 {
  padding: 5px 5px;
  border: 1px solid #ddd;
  color: #ffffff;
  background-color: red;
  border-radius: 4px;
  font-size: 18px;
}
.modal-backdrop{
  position: absolute;

}
#editModal___BV_modal_content_ {
  width: 800px;
}
#editModal___BV_modal_outer_{
  position: relative !important;
}

</style>

<script>

import axios from "axios";

export default {
  data() {
    return {
      blogPost: [],
      image: [],
      profile_picture: '',
      update_profile_picture: '',
      blogs_update:[],
      update_blog_picture:null
    }
  },
  mounted() {
    this.getPost(),
        this.getProfilePicture();
    window.Echo.channel('postCreate23').listen('.PostCreated', (e) => {
    })
  },

  methods: {
    postMsg() {
      this.$router.push({name: "post_create"});
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
    deletePost(Id) {
      axios.post('http://localhost:8000/api/admin/delete-blog-post', {
        Id: Id
      })
          .then(response => {
            this.$toast("Succesfully Deleted", {
              timeout: 2000,
            });
            setTimeout(()=>{
              this.$router.go()
            },2000);
          })
          .catch(error => {
            console.log(error)
          })
    },
    updateData(Id){
      console.log(Id)
      axios.post('http://localhost:8000/api/blog/update', {
        Id:Id,
      }).then((response)=>{
        this.blogs_update = response.data.blogs_update
      }).catch(error => console.log(error))
    },
    updateConfirmData(Id){
      const formData = new FormData()
      formData.append('Id', this.blogs_update['id'])
      formData.append(' title', this.blogs_update['title'])
      formData.append('bcontent', this.blogs_update['content'])
      formData.append('update_blog_picture', this.update_blog_picture)
      axios.post('http://localhost:8000/api/blog/update/confirm', formData, { headers: { 'Content-Type': 'multipart/form-data', 'Content-type': 'application/json' }
      }).then((response)=>{
        this.$toast("Succesfully Updated", {
          timeout: 2000,
        });
        setTimeout(()=>{
          this.$router.go()
        },2000);
        console.log(response);
      }).catch(error => console.log(error))
    },
    onFileChanged() {
      this.update_blog_picture = this.$refs.profilePicture.files[0]
    },

  }
}



</script>
