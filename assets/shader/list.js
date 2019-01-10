import { TextureLoader } from 'three'

const list = [
  {
    id: 12,
    date: '2019-01-10',
    uniforms: {
      texture: {
        type: 't',
        value: new TextureLoader().load('/texture/nanaki.jpg')
      }
    }
  },
  {
    id: 11,
    date: '2019-01-10',
    uniforms: {
      texture: {
        type: 't',
        value: new TextureLoader().load('/texture/nanaki.jpg')
      }
    }
  },
  {
    id: 10,
    date: '2019-01-09',
    uniforms: {}
  },
  {
    id: 9,
    date: '2019-01-09',
    uniforms: {}
  },
  {
    id: 8,
    date: '2019-01-09',
    uniforms: {}
  },
  {
    id: 7,
    date: '2019-01-09',
    uniforms: {}
  },
  {
    id: 6,
    date: '2019-01-09',
    uniforms: {}
  },
  {
    id: 5,
    date: '2019-01-09',
    uniforms: {}
  },
  {
    id: 4,
    date: '2019-01-09',
    uniforms: {}
  },
  {
    id: 3,
    date: '2019-01-09',
    uniforms: {}
  },
  {
    id: 2,
    date: '2019-01-09',
    uniforms: {}
  },
  {
    id: 1,
    date: '2019-01-09',
    uniforms: {}
  }
]

export default list
