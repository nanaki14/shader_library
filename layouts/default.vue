<template>
  <div>
    <Header />
    <div class="Wrapper">
      <nuxt/>
    </div>
    <Footer />
  </div>
</template>

<script>
import Header from '@/components/Header'
import Footer from '@/components/Footer'

export default {
  components: {
    Header,
    Footer
  }
}
</script>

<style>
.Wrapper {
  min-height: calc(100vh - 120px);
  padding-top: 108px;
}
</style>
