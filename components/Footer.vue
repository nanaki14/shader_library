<template>
  <footer class="Footer">
    <nav class="Footer__Nav">
      <ul class="Footer__NavList">
        <li>
          <a
            href="https://github.com/nanaki14"
            target="_blank"
            class="icon-github"/>
        </li>
        <li>
          <a
            href="https://www.facebook.com/profile.php?id=100003877097329"
            target="_blank"
            class="icon-facebook"
          />
        </li>
        <li>
          <a
            href="https://twitter.com/nanaki14"
            target="_blank"
            class="icon-twitter"/>
        </li>
      </ul>
    </nav>
    <small class="Footer__Copy">© 2019 nanaki14</small>
  </footer>
</template>

<script>
export default {}
</script>

<style lang="scss">
.Footer {
  @include flexBox(center, center);
  flex-direction: column;
  height: 120px;
  border-top: 1px solid $color-black87;
  &__NavList {
    @include flexBox(center, center);

    li {
      margin: 0 16px;
    }
    a {
      display: block;
      padding: 8px;
      border: 1px solid $color-black87;
      border-radius: 50%;
      font-size: rem(32);
      &:hover {
        background-color: $color-black87;
        color: $color-white100;
      }
    }
  }
  &__Copy {
    margin-top: 16px;
  }
}
</style>
