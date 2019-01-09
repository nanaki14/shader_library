<template>
  <div class="Single">
    <ShaderItem :id="id"/>
    <time>{{ list[id - 1].date }}</time>
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
    list: () => {
      return list
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
