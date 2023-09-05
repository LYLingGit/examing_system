<template>
  <div class="block">
    <el-timeline>
      <el-timeline-item  placement="top" :timestamp="userInfo.lastActiveTime">
        <el-card>
          <h4>最后活动时间</h4>
          <p>{{ userInfo.realName+'在王东南互联网系统中最后活动了' }}</p>
        </el-card>
      </el-timeline-item>
      <el-timeline-item  placement="top" :timestamp="userInfo.time">
        <el-card>
          <h4>加入时间</h4>
          <p>{{ userInfo.realName+'加入了王东南互联网系统' }}</p>
        </el-card>
      </el-timeline-item>
    </el-timeline>
  </div>
</template>

<script>

export default {
  props: {
    userInfo: {
      type: Object,
      default: () => {
        return {
          realName: '',
          lastActiveTime: '',
          time: "2022-03-07 18:56:21",
        }
      }
    }
  }
}
</script>
