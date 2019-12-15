<template>
<div id="app">
  <Header
    :numCorrect="numCorrect"
    :numTotal="numTotal"
    />

  <b-container>
    <b-row class="justify-content-md-center">
      <b-col sm="6">
        <!-- pass to child component using v-bind -->
        <QuestionBox
          v-if="questions.length"
          :currentQuestion="questions[index]"
          :next="next"
          :increment="increment"
          :questionIndex="index"
          />
        <div class="loading-spinner d-flex justify-content-center">
          <HalfCircleSpinner
            v-if="!questions.length"
            :animation-duration="1000"
            :size="60"
            :color="'#b3ffd9'"
            />
        </div>
          <h3 class="loading-text" v-if="!questions.length">Fetching questions...</h3>
      </b-col>
    </b-row>
  </b-container>
</div>
</template>

<script>
import {HalfCircleSpinner} from 'epic-spinners'

import Header from "@/components/Header.vue";
import QuestionBox from "@/components/QuestionBox.vue";
import { mapActions } from 'vuex'

export default {
  name: "app",
  components: {
    // to be accessed via html template
    Header,
    QuestionBox,
    HalfCircleSpinner
  },
  data() {
    return {
      questions: [],
      index: 0,
      numCorrect: 0,
      numTotal: 0
    }
  },
  methods: {
    ...mapActions([
      'updateResult'
    ]),
    next() {
      this.index++
    },
    increment(isCorrect){
      if (isCorrect) {
        this.numCorrect++
        this.updateResult(this.numCorrect)
      }
    }
  },
  // simmiliar to document ready in jquery
  mounted: function () {
    fetch("https://opentdb.com/api.php?amount=10&category=9&difficulty=easy&type=multiple", {
      method: 'get'
    })
      .then((response) => {
        // must use return first
        return response.json()
      })
      .then((jsonData) => {
        this.questions = jsonData.results
        this.numTotal = jsonData.results.length
      })
  }
};
</script>

<style>
#app {
    font-family: "Avenir", Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}

.loading-spinner {
    margin-top: 90px;
    margin-bottom: 20px;
}

.loading-text {
    text-align: center;
}

</style>
