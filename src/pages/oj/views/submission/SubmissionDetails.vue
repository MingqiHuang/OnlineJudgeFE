<template>
  <Row type="flex" justify="space-around">
    <Col :span="20" id="status">
    <Alert :type="status.type" showIcon>
      <span class="title">{{status.statusName}}</span>
      <div slot="desc" class="content">
        <template v-if="isCE">
          <pre>{{submission.statistic_info.err_info}}</pre>
        </template>
        <template v-else>
          <span>时间：{{submission.statistic_info.time_cost | submissionTime}}</span>
          <span>内存：{{submission.statistic_info.memory_cost | submissionMemory}}</span>
          <span>语言：{{submission.language}}</span>
          <span>作者：{{submission.username}}</span>
        </template>
      </div>
    </Alert>
    </Col>

    <!--后台返info就显示出来， 权限控制放后台 -->
    <Col v-if="submission.info && !isCE" :span="20">
    <Alert type="warning">
      <div class="admin-info-content">
        <Icon type="information-circled" color="#f90"></Icon>
        <span class="admin-info-content">只有管理员才能查看ACM题目的分点情况</span>
      </div>
    </Alert>
    <Table stripe :loading="loading" :disabled-hover="true" :columns="columns" :data="submission.info.data"></Table>
    </Col>

    <Col :span="20">
    <Highlight :code="submission.code" :language="submission.language" :border-color="status.color"></Highlight>
    </Col>
    <Col v-if="submission.can_unshare" :span="20">
    <div id="share-btn">
      <Button v-if="submission.shared"
              type="warning" size="large" @click="shareSubmission(false)">
        不公开
      </Button>
      <Button v-else
              type="primary" size="large" @click="shareSubmission(true)">
        公开
      </Button>
    </div>
    </Col>
  </Row>

</template>

<script>
  import api from '@oj/api'
  import { JUDGE_STATUS } from '@/utils/constants'
  import utils from '@/utils/utils'
  import Highlight from '@/pages/oj/components/Highlight'

  const baseColumn = [
    {
      title: '编号',
      align: 'center',
      type: 'index'
    },
    {
      title: '状态',
      align: 'center',
      render: (h, params) => {
        return h('Tag', {
          props: {
            color: JUDGE_STATUS[params.row.result].color
          }
        }, JUDGE_STATUS[params.row.result].name)
      }
    },
    {
      title: '内存',
      align: 'center',
      render: (h, params) => {
        return h('span', utils.submissionMemoryFormat(params.row.memory))
      }
    },
    {
      title: '时间',
      align: 'center',
      render: (h, params) => {
        return h('span', utils.submissionTimeFormat(params.row.cpu_time))
      }
    }
  ]
  const scoreColumn = [{
    title: '分数',
    align: 'center',
    key: 'score'
  }]
  const adminColumn = [
    {
      title: 'CPU时间',
      align: 'center',
      render: (h, params) => {
        return h('span', utils.submissionTimeFormat(params.row.real_time))
      }
    },
    {
      title: '返回值',
      align: 'center',
      key: 'signal'
    }
  ]

  export default {
    name: 'submissionDetails',
    components: {
      Highlight
    },
    data () {
      return {
        columns: [],
        submission: {
          result: '0',
          code: '',
          info: {
            data: []
          },
          statistic_info: {
            time_cost: '',
            memory_cost: ''
          }
        },
        isConcat: false,
        loading: false
      }
    },
    mounted () {
      this.getSubmission()
    },
    methods: {
      getSubmission () {
        this.loading = true
        api.getSubmission(this.$route.params.id).then(res => {
          this.loading = false
          let data = res.data.data
          let columns = baseColumn
          if (data.info && data.info.data && !this.isConcat) {
            // score exist means the submission is OI problem submission
            if (data.info.data[0].score) {
              this.isConcat = true
              columns = columns.concat(scoreColumn)
            }
            if (this.isAdminRole) {
              this.isConcat = true
              columns = columns.concat(adminColumn)
            }
            this.columns = columns
          }
          this.submission = data
        }, () => {
          this.loading = false
        })
      },
      shareSubmission (shared) {
        let data = {id: this.submission.id, shared: shared}
        api.updateSubmission(data).then(res => {
          this.getSubmission()
          this.$success('成功')
        }, () => {
        })
      }
    },
    computed: {
      status () {
        return {
          type: JUDGE_STATUS[this.submission.result].type,
          statusName: JUDGE_STATUS[this.submission.result].name,
          color: JUDGE_STATUS[this.submission.result].color
        }
      },
      isCE () {
        return this.submission.result === -2
      },
      isAdminRole () {
        return this.$store.getters.isAdminRole
      }
    }
  }
</script>

<style scoped lang="less">
  #status {
    .title {
      font-size: 20px;
    }
    .content {
      margin-top: 10px;
      font-size: 14px;
      span {
        margin-right: 10px;
      }
      pre {
        white-space: pre-wrap;
        word-wrap: break-word;
        word-break: break-all;
      }
    }
  }

  .admin-info {
    margin: 5px 0;
    &-content {
      font-size: 16px;
      padding: 10px;
    }
  }

  #share-btn {
    float: right;
    margin-top: 5px;
    margin-right: 10px;
  }

  pre {
    border: none;
    background: none;
  }
</style>
