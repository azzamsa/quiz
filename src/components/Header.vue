<template>
<div class="main-nav">
  <b-nav class="navbar navbar-expand-sm bg-light">
    <div class="mx-auto d-sm-flex d-block flex-sm-nowrap">

      <a class="navbar-brand">Azra Quiz</a>
       <b-nav-item disabled>Result: {{ numCorrect }}/{{ numTotal }}</b-nav-item>

    </div>
  </b-nav>
</div>
</template>

<script>
export default {
  // you can also use array instead of object in props
  // so you don't need to define its type
  props: [
    "numCorrect",
    "numTotal"
  ]
}
</script>

<style>

.main-nav {
     margin-bottom: 10px;
}

</style>
