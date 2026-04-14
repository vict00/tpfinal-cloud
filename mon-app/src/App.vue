<script setup>
import HelloWorld from './components/HelloWorld.vue'

const buildId = import.meta.env.VITE_BUILD_ID ?? 'local'
const today = new Date().toLocaleDateString('fr-FR')
</script>

<template>
  <header>
    <p>  Da  Cunha</p>
    <p>  {{ today }}</p>
    <p> {{ buildId }}</p>
  </header>
  <HelloWorld />
</template>


<style>

p {
  font-size: 1.5em;
  margin: 0.5em 0;
  color: pink ;
}
</style>