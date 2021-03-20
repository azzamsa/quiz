<template>
<b-container>
  <b-row class="justify-content-md-center">
    <b-col sm="6">
      <div class="welcome">
        <b-jumbotron header="Azra Quiz" lead="">
          <p>Test your general knowledge with 10 questions.</p>
          <router-link to="/quiz">
            <b-button variant="primary">Start Quiz 🎲</b-button>
          </router-link>
        </b-jumbotron>
      </div>
    </b-col>
  </b-row>
</b-container>
</template>

<style scoped>
.welcome {
    text-align: center;
    color: black;
}
.jumbotron {
    background-color:#b3ffd9 !important;
}
.btn {
    background-color:black !important;
    border:black !important;
}
</style>
