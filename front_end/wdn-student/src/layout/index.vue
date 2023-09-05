<template>
  <el-container>
    <el-header height="61" class="student-header">
      <div class="head-user">
        <el-dropdown trigger="click" placement="bottom">
          <el-badge :is-dot="messageCount!==0" >
            <el-avatar  class="el-dropdown-avatar" size="medium"  :src="userInfo.imagePath === null ? require('@/assets/avatar.png') : userInfo.imagePath"></el-avatar>
          </el-badge>
          <el-dropdown-menu slot="dropdown">
            <el-dropdown-item @click.native="$router.push({path:'/user/index'})">个人中心</el-dropdown-item>
            <el-dropdown-item @click.native="$router.push({path:'/user/message'})">
              <el-badge :value="messageCount" v-if="messageCount!==0">
                <span>消息中心</span>
              </el-badge>
              <span  v-if="messageCount===0">消息中心</span>
            </el-dropdown-item>
            <el-dropdown-item @click.native="logout" divided>退出</el-dropdown-item>
          </el-dropdown-menu>
        </el-dropdown>
      </div>
      <el-menu class="el-menu-title" mode="horizontal" :default-active="defaultUrl" :router="true">
        <el-menu-item index="/index">首页</el-menu-item>
        <el-menu-item index="/paper/index">试卷中心</el-menu-item>
        <el-menu-item index="/record/index">考试记录</el-menu-item>
        <el-menu-item index="/question/index">错题本</el-menu-item>
      </el-menu>
      <div>
        <img  src="@/assets/logo.png" class="sidebar-logo">
      </div>
    </el-header>
    <el-main class="student-main">
      <router-view/>
    </el-main>
    <el-footer height="340" class="student-footer">
      <div class="foot-container">
        <div class="footer-main">
          <h4>项目所属</h4>
          <div class="footer-main-link">东南大学</div>
          <div class="footer-main-link">软件学院 电子信息 (软件工程)</div>
        </div>
        <div class="footer-main">
          <h4>团队介绍</h4>
          <div class="footer-main-link">组名 三元二次方程组</div>
          <div class="footer-main-link">组员 李依玲、吴超、谢伟成、季猛达、戴广艳</div>
        </div>
        <div class="footer-main">
          <h4>指导老师</h4>
          <div class="footer-main-link">高科集团</div>
          <div class="footer-main-link">指导老师 祝铁芳、刘伟、张然、刘紫玉</div>
        </div>
        <div class="footer-main">
          <h4>项目名称</h4>
          <div class="footer-main-link">王东南互联网在线考试系统</div>
          <div class="footer-main-link">考试系统 & 管理系统</div>
        </div>
      </div>
    </el-footer>
    <div class="foot-copyright">
      <span>Copyright © 2022 王东南互联网有限公司 版权所有</span>
    </div>
  </el-container>
</template>

<script>
import { mapActions, mapMutations, mapState } from 'vuex'
import loginApi from '@/api/login'
import userApi from '@/api/user'
export default {
  name: 'Layout',
  data () {
    return {
      defaultUrl: '/index',
      userInfo: {
        imagePath: null
      }
    }
  },
  created () {
    let _this = this
    this.defaultUrl = this.routeSelect(this.$route.path)
    this.getUserMessageInfo()
    userApi.getCurrentUser().then(re => {
      _this.userInfo = re.response
    })
  },
  watch: {
    $route (to, from) {
      this.defaultUrl = this.routeSelect(to.path)
    }
  },
  methods: {
    routeSelect (path) {
      let topPath = ['/', '/index', '/paper/index', '/record/index', '/question/index']
      if (topPath.indexOf(path)) {
        return path
      }
      return null
    },
    logout () {
      let _this = this
      loginApi.logout().then(function (result) {
        if (result && result.code === 1) {
          _this.clearLogin()
          _this.$router.push({ path: '/login' })
        }
      })
    },
    ...mapActions('user', ['getUserMessageInfo']),
    ...mapMutations('user', ['clearLogin'])
  },
  computed: {
    ...mapState('user', {
      messageCount: state => state.messageCount
    })
  }
}
</script>

<style lang="scss" scoped>
    .sidebar-title {
      display: inline-block;
      margin: 0;
      color: rgb(73, 89, 122);
      font-weight: 600;
      line-height: 60px;
      font-size: 16px;
      font-family: Avenir, Helvetica Neue, Arial, Helvetica, sans-serif;
      vertical-align: middle;
    }

     .sidebar-logo {
      display: inline-block;
      height: 60px;
      margin-bottom: 0px;
      vertical-align: middle;
      margin-left: 20px;
    }
</style>
