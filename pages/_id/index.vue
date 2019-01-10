<template>
  <div class="Single">
    <ShaderItem
      :id="id"
      :uniforms="item.uniforms" />
    <time>{{ item.date }}</time>
  </div>
</template>

<script>
import list from '@/assets/shader/list'
import ShaderItem from '@/components/ShaderItem'

export default {
  components: {
    ShaderItem
  },
  data() {
    return {
      id: Number(this.$route.params.id)
    }
  },
  computed: {
    item() {
      return list.find(i => {
        if (i.id === this.id) {
          return i
        }
      })
    }
  }
}
</script>

<style lang="scss" scoped>
.Single {
  max-width: 600px;
  margin: 16px auto 48px;

  time {
    display: block;
    padding: 16px;
    font-family: 'Charm', cursive;
    font-size: rem(24);
    font-weight: bold;
    text-align: right;
  }
}
</style>
