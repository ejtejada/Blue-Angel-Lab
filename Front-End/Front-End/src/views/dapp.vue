<template>
  <div class="dapp-page">
    <hello-metamask/>
    <el-button type="primary" @click="$router.push('/service/index')">服务者</el-button>
    <el-button type="primary" @click="$router.push('/evaluate/index')">评价者</el-button>
    <el-button type="primary" @click="$router.push('/donate/index')">捐助者</el-button>
  </div>
  
</template>
<script>
import HelloMetamask from './hello-metamask'
export default {
  name: 'casino-dapp',
  components: {
    'hello-metamask': HelloMetamask
  },
  beforeCreate () {
    // console.log('registerWeb3 Action dispatched from casino-dapp.vue')
    this.$store.dispatch('registerWeb3')
  },
}
</script>
<style scoped>
.dapp-page { padding: 30px; }
</style>