<template>
<div class="question-box-container">
   <b-jumbotron>
     <template slot:lead>
       <!-- passed from parent component -->
      {{ currentQuestion.question }}
    </template>

    <hr class="my-4">

    <b-list-group>
      <b-list-group-item
        v-for="(answer, index) in answers"
        :key="index"
        @click="selectedAnswer(index)"
        :class="[selectedIndex === index ? 'selected' : '']"
        >
        {{ answer }}
        </b-list-group-item>
    </b-list-group>

    <b-button
      @click="submitAnswer"
      variant="primary"
      :disabled="selectedIndex === null"
      :style="[selectedIndex === null ? {'cursor': 'not-allowed', 'pointer-events': 'all !important' } : {} ]"
      >
      Sumbit
    </b-button>
    <b-button @click="next" variant="success" href="#">Next</b-button>
  </b-jumbotron>
</div>
</template>

<script>
import _ from 'lodash'

export default {
  props: {
    // in order to receive from parent
    // this is local to this component
    currentQuestion: Object,
    next: Function,
    increment: Function
  },
  data() {
    return {
      selectedIndex: null,
      shuffledAnswers: []
    }
  },
  computed: {
    // this method is cached by vue. Vue will not recompute up until the
    // decencies values changed
    answers () {
      let answers = [...this.currentQuestion.incorrect_answers]
      answers.push(this.currentQuestion.correct_answer)
      return answers
    }
  },
  // same as method & computed: take object of functions
  // watch for changes in props, and run when it's changed
  watch: {
    // use currentquestion as object, to make use of
    // watch parameter. `immediate: true` act the same as mounted
    currentQuestion: {
      immediate: true,
      handler() {
        this.selectedIndex = null
        this.shuffleAnswers()
      }
    }
  },
  methods: {
    selectedAnswer(index) {
      this.selectedIndex = index
    },
    shuffleAnswers() {
      // ... is vue convention to make array flat
      let answers = [...this.currentQuestion.incorrect_answers, this.currentQuestion.correct_answer]
      this.shuffledAnswers = _.shuffle(answers)
    },
    submitAnswer() {
      let isCorrect = false

      if (this.selectedIndex === this.correctIndex){
        isCorrect = true
      }

      this.increment(isCorrect)
    }
  }
}
</script>

<style scoped>
.list-group {
    margin-bottom: 15px;
}

.list-group-item:hover {
    background: lightgray;
    cursor: pointer;
}

.btn {
    margin: 0 5px;
}

/* give user feedback of selected answer */
.selected {
    background-color: lightblue;
}

.correct {
    background-color: lightgreen;
}

.incorrect {
    background-color: lightred;
}

</style>
