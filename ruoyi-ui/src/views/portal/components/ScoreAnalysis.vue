<template>
  <div>
    <!-- 个人学情分析 -->
    <el-card shadow="hover" class="mb-20 analysis-card">
      <div slot="header" class="card-header">
        <div style="display: flex; align-items: center; justify-content: space-between; width: 100%;">
          <div style="display: flex; align-items: center;">
              <span><i class="el-icon-data-analysis" style="color: #409EFF; margin-right:5px;"></i> 个人学情分析</span>
              <el-select v-model="analysisSubject" placeholder="选择科目" size="mini" style="width: 100px; margin-left: 10px;" @change="updateAnalysisStats">
                  <el-option label="全部科目" value="all"></el-option>
                  <el-option v-for="sub in subjectOptions" :key="sub" :label="sub" :value="sub"></el-option>
              </el-select>
          </div>
          <el-tag size="mini" :type="getScoreLevel(scoreStats.avg).type" effect="dark">
            综合评级：{{ getScoreLevel(scoreStats.avg).label }}
          </el-tag>
        </div>
      </div>

      <el-row :gutter="0" class="analysis-body">
        <el-col :span="9" class="left-dashboard">
          <div class="score-circle">
            <div class="score-label">平均分</div>
            <div class="score-num">{{ scoreStats.avg }}</div>
            <div class="score-range">
              <span class="max">↑ {{ scoreStats.max }}</span>
              <el-divider direction="vertical"></el-divider>
              <span class="min">↓ {{ scoreStats.min }}</span>
            </div>
          </div>
          <div class="total-info">
            已批改 <span style="color:#409EFF; font-weight:bold;">{{ scoreStats.graded }}</span> / {{ scoreStats.total }} 次作业
          </div>
        </el-col>

        <el-col :span="15" class="right-details">
          <div class="dist-item">
            <span class="d-label"><i class="el-icon-trophy" style="color:#F7BA2A"></i> 优秀</span>
            <el-progress :percentage="scoreStats.percents.excellent" color="#67C23A" :stroke-width="10" :format="formatNone"></el-progress>
            <span class="d-count">{{ scoreStats.counts[0] }}次</span>
          </div>
          <div class="dist-item">
            <span class="d-label"><i class="el-icon-thumb" style="color:#409EFF"></i> 良好</span>
            <el-progress :percentage="scoreStats.percents.good" color="#409EFF" :stroke-width="10" :format="formatNone"></el-progress>
            <span class="d-count">{{ scoreStats.counts[1] }}次</span>
          </div>
          <div class="dist-item">
            <span class="d-label"><i class="el-icon-check" style="color:#E6A23C"></i> 及格</span>
            <el-progress :percentage="scoreStats.percents.pass" color="#E6A23C" :stroke-width="10" :format="formatNone"></el-progress>
            <span class="d-count">{{ scoreStats.counts[2] }}次</span>
          </div>
          <div class="dist-item">
            <span class="d-label"><i class="el-icon-warning-outline" style="color:#F56C6C"></i> 待进</span>
            <el-progress :percentage="scoreStats.percents.fail" color="#F56C6C" :stroke-width="10" :format="formatNone"></el-progress>
            <span class="d-count">{{ scoreStats.counts[3] }}次</span>
          </div>
        </el-col>
      </el-row>
    </el-card>

    <!-- 成绩分析详情 -->
    <el-card shadow="hover" class="mb-20">
      <div slot="header" class="card-header">
        <span><i class="el-icon-data-line" style="color: #409EFF; margin-right: 5px;"></i> 成绩分析详情</span>
      </div>

      <div class="chart-title" style="font-weight: bold; margin-bottom: 15px; border-left: 4px solid #409EFF; padding-left: 10px; display: flex; justify-content: space-between; align-items: center;">
        <span>近期成绩走势</span>
        <el-select v-model="trendSubject" placeholder="选择科目" size="mini" style="width: 120px;" @change="updateTrendChart">
          <el-option label="全部科目" value="all"></el-option>
          <el-option v-for="sub in subjectOptions" :key="sub" :label="sub" :value="sub"></el-option>
        </el-select>
      </div>
      <div v-loading="trendLoading" ref="trendChart" style="height: 300px; width: 100%;"></div>

      <el-divider></el-divider>

      <div class="chart-title" style="font-weight: bold; margin-bottom: 15px; border-left: 4px solid #67C23A; padding-left: 10px;">各科平均分分析</div>
      <div v-loading="trendLoading" ref="subjectChart" style="height: 300px; width: 100%;"></div>
    </el-card>
  </div>
</template>

<script>
import * as echarts from 'echarts';
import { listStudentScoreAnalysis } from "@/api/school/submission";

export default {
  name: 'ScoreAnalysis',
  data() {
    return {
      trendLoading: false,
      scoreStats: {
        total: 0,
        graded: 0,
        avg: 0,
        max: 0,
        min: 0,
        percents: { excellent: 0, good: 0, pass: 0, fail: 0 },
        counts: [0, 0, 0, 0]
      },
      analysisSubject: 'all',
      trendSubject: 'all',
      subjectOptions: [],
      allTrendData: [],
      trendChart: null,
      subjectChart: null
    };
  },
  mounted() {
    this.getScoreTrendData();
    window.addEventListener('resize', this.resizeChart);
  },
  beforeDestroy() {
    window.removeEventListener('resize', this.resizeChart);
    if (this.trendChart) this.trendChart.dispose();
    if (this.subjectChart) this.subjectChart.dispose();
  },
  methods: {
    formatNone() { return ''; },
    getScoreLevel(avg) {
      const score = parseFloat(avg);
      if (isNaN(score) || score === 0) return { label: '待定', type: 'info' };
      if (score >= 90) return { label: 'S级 (优秀)', type: 'success' };
      if (score >= 80) return { label: 'A级 (良好)', type: 'primary' };
      if (score >= 60) return { label: 'B级 (达标)', type: 'warning' };
      return { label: 'C级 (加油)', type: 'danger' };
    },
    resizeChart() {
      if (this.trendChart) this.trendChart.resize();
      if (this.subjectChart) this.subjectChart.resize();
    },
    getScoreTrendData() {
      this.trendLoading = true;
      listStudentScoreAnalysis().then(res => {
        const list = (res.rows || []).reverse();
        this.allTrendData = list;
        const subSet = new Set();
        list.forEach(item => {
            let subName = item.subject;
            if (!subName || subName === 'null' || subName === '综合') {
                const title = item.taskTitle || item.title || "";
                if (title.includes("语文")) subName = "语文";
                else if (title.includes("数学")) subName = "数学";
                else if (title.includes("英语")) subName = "英语";
                else if (title.includes("物理")) subName = "物理";
                else if (title.includes("化学")) subName = "化学";
                else if (title.includes("生物")) subName = "生物";
                else if (title.includes("历史")) subName = "历史";
                else if (title.includes("地理")) subName = "地理";
                else if (title.includes("政治")) subName = "政治";
                if (!subName || subName === 'null' || subName === '综合') {
                     subName = (subName === '综合') ? '综合' : '其他';
                }
            }
            item.inferredSubject = subName;
            subSet.add(subName);
        });
        this.subjectOptions = Array.from(subSet);
        this.updateTrendChart();

        const subjects = {};
        list.forEach(item => {
            const subName = item.inferredSubject;
            if (!subjects[subName]) {
                subjects[subName] = { total: 0, count: 0 };
            }
            subjects[subName].total += parseFloat(item.score);
            subjects[subName].count += 1;
        });

        const subNames = [];
        const subScores = [];
        for (const key in subjects) {
            subNames.push(key);
            const avg = (subjects[key].total / subjects[key].count).toFixed(1);
            subScores.push(avg);
        }
        this.initSubjectChart(subNames, subScores);
        this.updateAnalysisStats();
      }).catch(err => {
        console.error("获取成绩趋势失败", err);
      }).finally(() => {
        this.trendLoading = false;
      });
    },
    updateAnalysisStats() {
        let filteredData = [];
        if (this.analysisSubject === 'all') {
            filteredData = this.allTrendData;
        } else {
            filteredData = this.allTrendData.filter(item => item.inferredSubject === this.analysisSubject);
        }
        this.calculateScoreStats(filteredData);
    },
    updateTrendChart() {
        let filteredData = [];
        if (this.trendSubject === 'all') {
            filteredData = this.allTrendData;
        } else {
            filteredData = this.allTrendData.filter(item => item.inferredSubject === this.trendSubject);
        }
        const xData = filteredData.map(item => item.taskTitle || item.title);
        const yData = filteredData.map(item => item.score);
        this.initTrendChart(xData, yData);
        this.calculateScoreStats(filteredData);
    },
    calculateScoreStats(list) {
        if (!list || list.length === 0) {
            this.scoreStats = {
                total: 0, graded: 0, avg: 0, max: 0, min: 0,
                percents: { excellent: 0, good: 0, pass: 0, fail: 0 },
                counts: [0, 0, 0, 0]
            };
            return;
        }
        let totalScore = 0;
        let max = 0;
        let min = 100;
        let counts = [0, 0, 0, 0];
        list.forEach(item => {
            const score = parseFloat(item.score);
            totalScore += score;
            if (score > max) max = score;
            if (score < min) min = score;
            if (score >= 90) counts[0]++;
            else if (score >= 80) counts[1]++;
            else if (score >= 60) counts[2]++;
            else counts[3]++;
        });
        const total = list.length;
        const avg = (totalScore / total).toFixed(1);
        const percents = {
            excellent: Math.round((counts[0] / total) * 100),
            good: Math.round((counts[1] / total) * 100),
            pass: Math.round((counts[2] / total) * 100),
            fail: Math.round((counts[3] / total) * 100)
        };
        this.scoreStats = {
            total: total,
            graded: total,
            avg: avg,
            max: max,
            min: min === 100 ? 0 : min,
            percents: percents,
            counts: counts
        };
    },
    initSubjectChart(xData, yData) {
      const chartDom = this.$refs.subjectChart;
      if (!chartDom) return;
      if (this.subjectChart) {
        this.subjectChart.dispose();
      }
      this.subjectChart = echarts.init(chartDom);
      const option = {
        tooltip: { trigger: 'axis', axisPointer: { type: 'shadow' } },
        grid: { left: '3%', right: '4%', bottom: '3%', containLabel: true },
        xAxis: { type: 'category', data: xData, axisTick: { alignWithLabel: true } },
        yAxis: { type: 'value', max: 100 },
        series: [
            {
                name: '平均分', type: 'bar', barWidth: '40%', data: yData,
                itemStyle: {
                    color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                        { offset: 0, color: '#83bff6' },
                        { offset: 0.5, color: '#188df0' },
                        { offset: 1, color: '#188df0' }
                    ])
                },
                label: { show: true, position: 'top' }
            }
        ]
      };
      this.subjectChart.setOption(option);
    },
    initTrendChart(xData, yData) {
      const chartDom = this.$refs.trendChart;
      if (!chartDom) return;
      if (this.trendChart) {
        this.trendChart.dispose();
      }
      this.trendChart = echarts.init(chartDom);
      const option = {
        tooltip: {
          trigger: 'axis',
          backgroundColor: 'rgba(255, 255, 255, 0.9)',
          borderColor: '#409EFF',
          textStyle: { color: '#333' },
          formatter: function(params) {
            return `<div style="font-weight:bold">${params[0].name}</div>
                    <span style="display:inline-block;margin-right:5px;border-radius:10px;width:10px;height:10px;background-color:#409EFF;"></span>
                    得分：<span style="color:#409EFF;font-weight:bold;font-size:16px">${params[0].value}</span> 分`;
          }
        },
        grid: { left: '2%', right: '5%', bottom: '10%', top: '15%', containLabel: true },
        xAxis: {
          type: 'category', boundaryGap: false, data: xData,
          axisLabel: {
            interval: 0, rotate: 20,
            formatter: function(value) {
              return value.length > 6 ? value.substring(0, 6) + '...' : value;
            },
            color: '#606266'
          },
          axisLine: { lineStyle: { color: '#E4E7ED' } }
        },
        yAxis: {
          type: 'value', min: 0, max: 100, name: '分数',
          splitLine: { lineStyle: { type: 'dashed', color: '#f0f0f0' } }
        },
        series: [
          {
            name: '成绩', type: 'line', data: yData,
            smooth: true, symbol: 'circle', symbolSize: 8,
            itemStyle: {
              color: '#409EFF', borderWidth: 2, borderColor: '#fff',
              shadowColor: 'rgba(0, 0, 0, 0.2)', shadowBlur: 5
            },
            lineStyle: {
              width: 4, shadowColor: 'rgba(64,158,255, 0.4)',
              shadowBlur: 10, shadowOffsetY: 5
            },
            areaStyle: {
              color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                { offset: 0, color: 'rgba(64,158,255, 0.4)' },
                { offset: 1, color: 'rgba(64,158,255, 0.01)' }
              ])
            },
            label: {
              show: true, position: 'top', color: '#409EFF',
              fontWeight: 'bold', formatter: '{c}分'
            }
          }
        ]
      };
      this.trendChart.setOption(option);
    }
  }
}
</script>

<style scoped lang="scss">
.mb-20 { margin-bottom: 20px; }
.card-header { font-size: 16px; font-weight: bold; color: #303133; display: flex; align-items: center; justify-content: space-between; }
.analysis-card {
  height: 220px;
  ::v-deep .el-card__body { padding: 15px 20px; }
}
.analysis-body { display: flex; align-items: center; height: 100%; }
.left-dashboard {
  display: flex; flex-direction: column; align-items: center; justify-content: center;
  border-right: 1px dashed #e0e0e0; padding-right: 10px;
}
.score-circle {
  width: 110px; height: 110px; border-radius: 50%;
  background: linear-gradient(135deg, #f0f9eb 0%, #e1f3d8 100%);
  display: flex; flex-direction: column; align-items: center; justify-content: center;
  box-shadow: 0 4px 10px rgba(0,0,0,0.05); margin-bottom: 10px; color: #67C23A;
}
.score-label { font-size: 12px; color: #888; margin-bottom: 0px; }
.score-num { font-size: 32px; font-weight: bold; font-family: 'Arial', sans-serif; letter-spacing: -1px; }
.score-range {
  font-size: 12px; color: #999; transform: scale(0.9);
  .max { color: #67C23A; } .min { color: #F56C6C; }
}
.total-info { font-size: 12px; color: #909399; background: #f4f4f5; padding: 4px 10px; border-radius: 12px; }
.right-details { padding-left: 25px; display: flex; flex-direction: column; justify-content: center; }
.dist-item { display: flex; align-items: center; margin-bottom: 15px; &:last-child { margin-bottom: 0; } }
.d-label {
  width: 65px; font-size: 13px; color: #555; font-weight: 500; display: flex; align-items: center;
  i { margin-right: 4px; font-size: 14px; }
}
.el-progress { flex: 1; margin: 0 15px; }
.d-count { width: 40px; text-align: right; font-size: 13px; color: #909399; font-family: monospace; }
</style>
