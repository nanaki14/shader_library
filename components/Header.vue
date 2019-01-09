<template>
  <header class="Header">
    <h1 class="Header__Title">
      <nuxt-link to="/">Shader Practice</nuxt-link>
    </h1>
  </header>
</template>

<script>
export default {
  name: 'Header'
}
</script>

<style lang="scss" scoped>
.Header {
  position: fixed;
  top: 0;
  left: 0;
  @include flexBox(center, center);
  width: 100%;
  height: 108px;
  background-color: $color-white100;
  z-index: z(header);
  &__Title {
    font-family: 'Charm', cursive;
    font-size: rem(42);
    font-weight: bold;
  }
}
</style>
