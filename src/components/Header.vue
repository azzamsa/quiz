<template>
  <div>
    <b-nav tabs>
      <b-nav-item disabled>Azra Quiz App</b-nav-item>
      <b-nav-item disabled>Counter: {{ numCorrect }}/{{ numTotal }}</b-nav-item>
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
