<template>
<div class="question-box-container">
  <b-jumbotron>
    <template slot:lead>
      <!-- passed from parent component -->
      <h4 v-html="currentQuestion.question"></h4>
    </template>

    <hr class="my-4">

    <b-list-group>
      <b-list-group-item
        v-for="(answer, index) in shuffledAnswers"
        :key="index"
        @click="selectedAnswer(index)"
        :class="answerClass(index)"
        v-html="answer"
        >
      </b-list-group-item>
    </b-list-group>

    <b-button
      @click="submitAnswer"
      variant="primary"
      :disabled="selectedIndex === null || answered"
      :style="[selectedIndex === null || answered ? {'cursor': 'not-allowed', 'pointer-events': 'all !important' } : {} ]"
      >
      Submit
    </b-button>
    <b-button
      @click="next"
      variant="success"
      :disabled="questionIndex === 9"
      :style="[questionIndex === 9 ? {'cursor': 'not-allowed', 'pointer-events': 'all !important' } : {} ]"
      v-if="questionIndex !== 9"
      >
      Next
    </b-button>

    <router-link to="/result">
      <b-button
        variant="success"
        v-if="questionIndex === 9"
        >
        Show My Result
      </b-button>
    </router-link>

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
    increment: Function,
    questionIndex: Number
  },
  data() {
    return {
      selectedIndex: null,
      shuffledAnswers: [],
      answered: false,
      correctIndex: null
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
        this.answered = false
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
      this.correctIndex = this.shuffledAnswers.indexOf(this.currentQuestion.correct_answer)
    },
    submitAnswer() {
      let isCorrect = false

      if (this.selectedIndex === this.correctIndex){
        isCorrect = true
      }
      this.answered = true

      this.increment(isCorrect)
    },
    answerClass(index) {
      let answerClass = ''

      if (!this.answered && this.selectedIndex === index) {
        answerClass = 'selected'
      } else if (this.answered && this.correctIndex === index) {
        answerClass = 'correct'
      } else if (this.answered &&
                 this.selectedIndex === index &&
                 this.correctIndex !== index
                ) {
        answerClass = 'incorrect'
      }

      return answerClass
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
    background-color: #ff8080;
}

.question-status {
    margin-top: 10px;
}

</style>
