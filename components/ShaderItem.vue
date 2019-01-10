<template>
  <article class="Shaderitem">
    <nuxt-link
      :id="`container${id}`"
      :to="`/${id}`" />
  </article>
</template>

<script>
import glsl from '@/mixins/glsl'
export default {
  name: 'Shaderitem',
  mixins: [glsl],
  props: {
    id: {
      default: 0,
      type: Number
    },
    uniforms: {
      default: null,
      type: Object
    }
  },
  async mounted() {
    const container = document.getElementById(`container${this.id}`)
    const frag = await require(`@/assets/shader/${this.id}/fragment.glsl`)
    const vert = await require(`@/assets/shader/${this.id}/vertex.glsl`)

    this.initCanvs(container, frag, vert, this.uniforms)
  }
}
</script>

<style lang="scss">
.Shaderitem {
  a {
    position: relative;
    display: block;
    &:before {
      content: '';
      display: block;
      padding-bottom: 100%;
    }
    canvas {
      position: absolute;
      top: 0;
      left: 0;
    }
  }
}
</style>
