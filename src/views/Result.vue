<template>
<b-container>
  <b-row class="justify-content-md-center">
    <b-col sm="6">
      <div class="welcome">
        <b-jumbotron header="" lead="">
          <p id="result-text">Your Result:</p>
          <h1>{{ result }}</h1>
          <h2>{{ star }}</h2>
          <router-link to="/quiz">
            <b-button
              variant="primary"
              @click="resetResult"
              >
              Test Me Again
            </b-button>
          </router-link>
        </b-jumbotron>
      </div>
    </b-col>
  </b-row>
</b-container>
</template>


<script>
import { mapState, mapActions } from 'vuex'

export default {
  data() {
    return {
      star: ''
    }
  },
  computed: {
    ...mapState([
      'result'
    ])
  },
  methods: {
    ...mapActions([
      'updateResult'
    ]),
    resetResult() {
      this.updateResult(0)
    }
  },
  mounted() {
    this.star = '🌟 '.repeat((this.result / 10) * 3)
  }
}
</script>


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
h1 {
    font-size: 100px;
    color: #FFAC33;
}
#result-text {
    font-size: 25px;
}
</style>
