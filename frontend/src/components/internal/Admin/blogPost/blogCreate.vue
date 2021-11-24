<template>
  <div>
    <h1 style="background: #67d551; margin-bottom: 20px"> Create Posts </h1>

    <form class="form-group">
      <input v-model="postTitle" type="text" class="form-control" style="margin-bottom: 20px" placeholder="Your Title Here" required>
      <input v-model="postContent" type="text" class="form-control" style="padding-bottom: 300px" placeholder="Your Content " required>

      <input type="file" ref="profilePicture" accept=".jpg,.jpeg,.png" @change="onFileChanged">
<!--      <button @click="onUpload" type="submit">Upload!</button>-->
      <button @click="onUpload" type="button" class="btn btn-success">Submit</button>
    </form>

  </div>
</template>




<script>
import axios from "axios";
import Echo from 'laravel-echo'

export default {
  props: ["userdata"],
  data() {
    return {
      selectedFile: '',
      postTitle:'',
      postTitle2:'',
      postContent:'',
      Id:'',
      profile_picture: null,
      newPost: ''
    }
  },

  methods: {
    onFileChanged() {
      this.profile_picture = this.$refs.profilePicture.files[0]
    },
    onUpload() {
      const formData = new FormData()
      formData.append('Id', this.userdata.id)
      formData.append(' postTitle', this.postTitle)
      formData.append('postContent', this.postContent)
      formData.append('profile_picture', this.profile_picture)
      formData.append('newPost', this.newPost)
      axios.post('http://localhost:8000/api/admin/create-blog-post',formData, { headers: { 'Content-Type': 'multipart/form-data', 'Content-type': 'application/json' }
        // Id: this.userdata.id,
        // postTitle:this.postTitle,
        // postContent : this.postContent,
        // profile_picture:  this.profile_picture
      }).then((response)=>{
        // window.Echo.private('post.created').listen(alert(response));
        this.$toast("Successfully data Uploaded", {
          timeout: 3000,
        });
        setTimeout(()=>{
          this.$router.push({name:"login_post"});
        },1000);

      }).catch(error =>    this.$toast("Invalid Or Empty Data", {
            timeout: 5000,
          }),
      )

    }


  },
  created(){
    // window.Echo.channel('postCreate23').listen('.PostCreated', (e) => {
    //  console.log("show up without refresh")
    //   alert('show up without refresh');
    // })
    window.Echo.channel('postCreate23').listen('.PostCreated', (e) => {
      console.log(e);
      alert(e)

    })

  }
}

</script>
