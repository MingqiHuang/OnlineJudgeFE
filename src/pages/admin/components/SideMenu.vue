<template>
  <el-menu class="vertical_menu"
           :router="true" :default-active="currentPath">
    <div class="logo">
      <img src="../../../assets/logo.svg" alt="oj admin"/>
    </div>
    <el-menu-item index="/"><i class="el-icon-fa-dashboard"></i>仪表盘</el-menu-item>
    <el-submenu v-if="isSuperAdmin" index="general">
      <template slot="title"><i class="el-icon-menu"></i>主要信息</template>
      <el-menu-item index="/user">用户</el-menu-item>
      <el-menu-item index="/announcement">公告</el-menu-item>
      <el-menu-item index="/conf">系统设置</el-menu-item>
      <el-menu-item index="/judge-server">评测机</el-menu-item>
      <el-menu-item index="/prune-test-case">删除重复测试数据</el-menu-item>
    </el-submenu>
    <el-submenu index="problem" v-if="hasProblemPermission">
      <template slot="title"><i class="el-icon-fa-bars"></i>问题</template>
      <el-menu-item index="/problems">题目列表</el-menu-item>
      <el-menu-item index="/problem/create">创建问题</el-menu-item>
      <el-menu-item index="/problem/batch_ops">导入/导出</el-menu-item>
    </el-submenu>
    <el-submenu index="contest">
      <template slot="title"><i class="el-icon-fa-trophy"></i>比赛</template>
      <el-menu-item index="/contest">比赛列表</el-menu-item>
      <el-menu-item index="/contest/create">创建比赛</el-menu-item>
    </el-submenu>
  </el-menu>
</template>

<script>
  import {mapGetters} from 'vuex'

  export default {
    name: 'SideMenu',
    data () {
      return {
        currentPath: ''
      }
    },
    mounted () {
      this.currentPath = this.$route.path
    },
    computed: {
      ...mapGetters(['user', 'isSuperAdmin', 'hasProblemPermission'])
    }
  }
</script>

<style scoped lang="less">
  .vertical_menu {
    overflow: auto;
    width: 200px;
    height: 100%;
    position: fixed !important;
    z-index: 100;
    top: 0;
    bottom: 0;
    left: 0;
    .logo {
      margin: 20px 0;
      text-align: center;
      img {
        background-color: #fff;
        border-radius: 50%;
        border: 3px solid #fff;
        width: 75px;
        height: 75px;
      }
    }
  }
</style>
