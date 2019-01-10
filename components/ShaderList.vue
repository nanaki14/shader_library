<template>
  <section class="ShaderList">
    <ShaderItem
      v-for="item in list"
      :key="item.id"
      :id="item.id"
      :uniforms="item.uniforms" />
  </section>
</template>

<script>
import list from '@/assets/shader/list'
import ShaderItem from '@/components/ShaderItem'

export default {
  name: 'ShaderList',
  components: {
    ShaderItem
  },
  computed: {
    list() {
      return list
    }
  }
}
</script>

<style lang="scss" scoped>
.ShaderList {
  @include flexBox(start, start, wrap);
  > * {
    width: calc(100% / 5 - 32px);
    margin: 16px;
    @include mq-small-pc {
      width: calc(100% / 3 - 32px);
    }
    @include mq-sp {
      width: calc(100% / 1 - 32px);
    }
  }
}
</style>
