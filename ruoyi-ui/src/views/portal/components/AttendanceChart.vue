<template>
  <el-card shadow="hover" class="chart-card mb-20">
    <div slot="header" class="card-header">
      <span><i class="el-icon-pie-chart"></i> 个人考勤趋势 (近7天)</span>
    </div>
    <div v-loading="chartLoading" ref="chart" style="height: 320px; width: 100%;"></div>
  </el-card>
</template>

<script>
import * as echarts from 'echarts';
import { getMyAttendanceStats } from "@/api/school/student";

export default {
  name: 'AttendanceChart',
  data() {
    return {
      chartLoading: false,
      myChart: null
    }
  },
  mounted() {
    this.getAttendanceChartData();
    window.addEventListener('resize', this.resizeChart);
  },
  beforeDestroy() {
    window.removeEventListener('resize', this.resizeChart);
    if (this.myChart) this.myChart.dispose();
  },
  methods: {
    getAttendanceChartData() {
      this.chartLoading = true;
      getMyAttendanceStats().then(res => {
        const dates = res.data.dates || [];
        const values = res.data.values || [];
        
        // 确保日期按升序排列
        // 假设后端返回的数据已经是按日期排序的，如果不是，需要在这里处理
        // 目前看来，用户反馈是“希望日期从小到大”，之前可能有 reverse()，现在移除了
        // 这里不做额外排序，信任后端数据或保持原样（如果后端是升序）
        
        this.initChart(dates, values);
        this.chartLoading = false;
      }).catch(() => {
        this.chartLoading = false;
      });
    },
    initChart(xData, yData) {
      const chartDom = this.$refs.chart;
      if (!chartDom) return;
      if (this.myChart) { this.myChart.dispose(); }
      this.myChart = echarts.init(chartDom);

      const iconPresent = 'path://M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm-2 15l-5-5 1.41-1.41L10 14.17l7.59-7.59L19 8l-9 9z';
      const iconAbsent = 'path://M12 2C6.47 2 2 6.47 2 12s4.47 10 10 10 10-4.47 10-10S17.53 2 12 2zm5 13.59L15.59 17 12 13.41 8.41 17 7 15.59 10.59 12 7 8.41 8.41 7 12 10.59 15.59 7 17 8.41 13.41 12 17 15.59z';

      const option = {
        tooltip: {
            trigger: 'axis',
            backgroundColor: 'rgba(255, 255, 255, 0.95)',
            borderColor: '#eee',
            borderWidth: 1,
            textStyle: { color: '#333' },
            formatter: function(params) {
                const dataItem = params.find(p => p.seriesName === '考勤状态');
                if (!dataItem) return '';
                const date = dataItem.axisValue;
                const isPresent = dataItem.value === 1;
                const statusHtml = isPresent
                    ? '<span style="color:#67C23A;font-weight:bold;"><i class="el-icon-circle-check"></i> 正常出勤</span>'
                    : '<span style="color:#F56C6C;font-weight:bold;"><i class="el-icon-circle-close"></i> 缺勤/异常</span>';
                return `<div style="text-align:center; padding: 5px;">
                          <div style="font-size:14px;color:#999;margin-bottom:5px;">${date}</div>
                          <div style="font-size:16px;">${statusHtml}</div>
                        </div>`;
            }
        },
        grid: { left: '5%', right: '5%', bottom: '15%', top: '15%', containLabel: false },
        xAxis: {
            type: 'category',
            data: xData || [],
            axisLine: { show: false },
            axisTick: { show: false },
            axisLabel: { margin: 20, color: '#909399', fontSize: 13, fontWeight: 500 }
        },
        yAxis: { show: false, min: 0, max: 1 },
        series: [
            {
                name: '背景', type: 'bar', barWidth: '50%', barGap: '-100%',
                data: (yData || []).map(() => 1),
                itemStyle: { color: '#f5f7fa', borderRadius: 20 },
                tooltip: { show: false }, z: 1
            },
            {
                name: '考勤状态', type: 'pictorialBar',
                symbol: function(value) { return value == 1 ? iconPresent : iconAbsent; },
                symbolSize: ['40px', '40px'], symbolPosition: 'center',
                itemStyle: { color: function(params) { return params.value == 1 ? '#67C23A' : '#F56C6C'; } },
                data: yData || [], z: 10
            }
        ]
      };
      this.myChart.setOption(option);
    },
    resizeChart() {
      if (this.myChart) this.myChart.resize();
    }
  }
}
</script>

<style scoped lang="scss">
.mb-20 { margin-bottom: 20px; }
.card-header { font-size: 16px; font-weight: bold; color: #303133; display: flex; align-items: center; justify-content: space-between; span { display: flex; align-items: center; } i { margin-right: 5px; color: #409EFF; } }
</style>
