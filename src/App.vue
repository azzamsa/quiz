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
      </b-col>
    </b-row>
  </b-container>
</div>
</template>

<script>
import Header from "./components/Header.vue";
import QuestionBox from "./components/QuestionBox.vue";

export default {
  name: "app",
  components: {
    // to be accessed via html template
    Header,
    QuestionBox
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
    next() {
      this.index++
    },
    increment(isCorrect){
      if (isCorrect) {
        this.numCorrect++
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
</style>
