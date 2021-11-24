<template>
  <div>

    <Header/>
    <v-main style="padding: 0">
      <router-view></router-view>
    </v-main>
    <Footer/>

<!--    <v-main style="padding: 0">-->
<!--      <div>-->
<!--        <div class="container">-->
<!--          <div class="row">-->

<!--            <div class="col-md-6" style="text-align: center">-->
<!--              <div class="row" style=" padding-top: 10%;">-->
<!--                <div>-->
<!--                  <img src="../assets/agency/logo2.png" alt="ag" style="width: 200px; height: 200px">-->
<!--                </div>-->
<!--                <h1> Welcome to <br> JAgency</h1>-->

<!--              </div>-->


<!--            </div>-->
<!--            <div class="col-md-6">-->
<!--              <img src="../assets/agency/ag.jpg" alt="ag">-->
<!--            </div>-->
<!--          </div>-->
<!--        </div>-->

<!--        <div class="col-md-12" style="text-align: center">-->

<!--          <h2> About Us </h2>-->

<!--          <p>-->
<!--            The main discussion topics at JAgency often pave the way to surprising and unexpected conversations thanks to our engaged forum users. <br>Our Forum is dedicated to enhancing the forum experience by offering plenty of opportunities  <br> for users to engage with each other in an interesting and safe online environment.</p>-->
<!--        </div>-->


<!--        <div class="happysell">-->
<!--          <h1 style="padding-top: 20px"> Happy Travelling </h1>-->
<!--          <div class="row dapplogo">-->

<!--            <div class="col-md-6 gplay">-->
<!--              <a href="#"> <img src="../assets/agency/gplay.png"></a>-->

<!--            </div>-->

<!--            <div class="col-md-6 istore">-->
<!--              <a href="#"> <img src="../assets/agency/istore.png"></a>-->

<!--            </div>-->

<!--          </div>-->
<!--          <div class="row copyright">-->
<!--            <div class="container">-->
<!--              <p> Copyright@ 2021 <a style="color: white;" href="#">JAgency Management </a>. All rights reserved </p>-->
<!--            </div>-->

<!--          </div>-->

<!--        </div>-->
<!--      </div>-->
<!--    </v-main>-->
  </div>
</template>
<script>
import Header from './Header';
import Footer from './Footer';


export default {
  components: {
    Header,
    Footer

  },





}

</script>

<style>
.happysell h1 {
  text-align: center;
  /*background: #ff9000;*/
  font-size: 30px;
  padding: 10px;
  margin: 0;
}
.happysell{
  background:#1c5876;
}
.gplay {
  text-align: right;
}
.copyright {
  /*background: #ff9000;*/
  margin: 0;
}
.row.copyright p {
  margin: 0;
  padding: 0;
  /* background: red; */
  text-align: center;
}
</style>
