<template>
  <div id="app">
    <Header />
    <b-row>
      <b-col sm="6" offset="3">
        <QuestionBox />
      </b-col>
    </b-row>
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
      questions: []
    }
  },
  // simmiliar to document ready in jquery
  mounted: function () {
    fetch("https://opentdb.com/api.php?amount=10&type=multiple", {
      method: 'get'
    })
      .then((response) => {
        // must use return first
        return response.json()
      })
      .then((jsonData) => {
        this.questions = jsonData.results
      })
  }
};
</script>

<style>
#app {
  font-family: "Avenir", Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
