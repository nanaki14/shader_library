import Canvas from './canvas'
export default {
  methods: {
    initCanvs(container, frag, vert, uniforms) {
      this.canvas = new Canvas(container, frag, vert, uniforms)
      this.canvas.init()
    }
  },
  data() {
    return {
      canvas: null
    }
  }
}
