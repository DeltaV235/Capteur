<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">

    <#include "common-head.ftl">

    <title>Capteur | 首页</title>

    <#assign page="index">

</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

    <#include "common-navbar.ftl">

    <#include "common-sidebar.ftl">


    <!-- Content Wrapper. 包含页面内容 -->
    <div class="content-wrapper">
        <!-- 内容标题（页面标题） -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">主页</h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">主页</a></li>
                            <li class="breadcrumb-item active"></li>
                        </ol>
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>
        <!-- /.content-header -->

        <!-- 主体内容 -->
        <section class="content">
            <div class="container-fluid">
                <!-- Small boxes (Stat box) -->

                <!-- /.row -->
                <!-- Main row -->
                <div class="row">
                    <!-- Left col -->
                    <section class="col-lg-6 connectedSortable">

                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">室内环境</h3>

                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse"><i
                                                class="fas fa-minus"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="row" style="margin-top: 20px; margin-bottom: 20px">
                                    <div class="col-6 col-md-3 text-center">
                                        <input type="text" class="knob" value="${curData.temp}" data-skin="tron"
                                               data-thickness="0.2" data-readonly="true"
                                               data-angleArc="250" data-angleOffset="-125" data-width="140"
                                               data-height="120" data-min="-10" data-max="50"
                                               data-fgColor="#28a745">

                                        <div class="knob-label">温度(℃)</div>
                                    </div>
                                    <div class="col-6 col-md-3 text-center">
                                        <input type="text" class="knob" value="${curData.humi}" data-skin="tron"
                                               data-thickness="0.2" data-readonly="true"
                                               data-angleArc="250" data-angleOffset="-125" data-width="140"
                                               data-height="120" data-min="0" data-max="100"
                                               data-fgColor="#28a745">

                                        <div class="knob-label">湿度(%)</div>
                                    </div>
                                    <div class="col-6 col-md-3 text-center">
                                        <input type="text" class="knob" value="${(curData.press/1000)?string["0.#"]}"
                                               data-skin="tron"
                                               data-thickness="0.2" data-min="95" data-max="110"
                                               data-angleArc="250" data-angleOffset="-125" data-width="140"
                                               data-height="120" data-readonly="true"
                                               data-fgColor="#28a745">

                                        <div class="knob-label">气压(kPa)</div>
                                    </div>
                                    <div class="col-6 col-md-3 text-center">
                                        <input type="text" class="knob" value="${(curData.light)?string["0.#"]}"
                                               data-skin="tron"
                                               data-thickness="0.2" data-min="0" data-max="200"
                                               data-angleArc="250" data-angleOffset="-125" data-width="140"
                                               data-height="120" data-readonly="true"
                                               data-fgColor="#28a745">

                                        <div class="knob-label">亮度(lux)</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /.card-body -->
                        <!-- /.card -->


                        <div class="card card-default">
                            <div class="card-header">
                                <h3 class="card-title">
                                    <i class="fas fa-exclamation-triangle"></i>
                                    最近告警列表
                                </h3>

                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse"><i
                                                class="fas fa-minus"></i>
                                    </button>
                                </div>
                            </div>
                            <!-- /.card-header -->

                            <div class="card-body p-0">
                                <div class="table-responsive">
                                    <table class="table m-0">
                                        <thead>
                                        <tr>
                                            <th>告警ID</th>
                                            <th>告警名称</th>
                                            <th>状态</th>
                                            <th>最后触发时间</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <#list warnings as warning>

                                            <tr>

                                                <td><a href="warnings">${warning.id}</a></td>
                                                <td>${warning.name}</td>
                                                <td>
                                                    <#if warning.status=='r'>
                                                        <span class="badge badge-success">已恢复</span>
                                                    <#elseif warning.status=='w'>
                                                        <span class="badge badge-danger">未恢复</span>
                                                    <#elseif warning.status=='d'>
                                                        <span class="badge badge-dark">已禁用</span>

                                                    </#if>
                                                </td>
                                                <td>
                                                    <div class="sparkbar" data-color="#00a65a" data-height="20">
                                                        ${warning.lastTriggerTime?datetime}
                                                    </div>
                                                </td>

                                            </tr>

                                        </#list>

                                        </tbody>
                                    </table>
                                </div>
                                <!-- /.table-responsive -->
                            </div>
                            <!-- /.card-body -->
                            <div class="card-footer clearfix">
                                <a href="warnings" class="btn btn-sm btn-secondary float-right">查看所有告警</a>
                            </div>
                            <!-- /.card-footer -->
                        </div>
                        <!-- /.card -->

                    </section>
                    <!-- /.Left col -->
                    <!-- right col （仅添加 ID 便可实现排序）-->
                    <section class="col-lg-6 connectedSortable">


                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">最近24小时温度/湿度变化</h3>

                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse"><i
                                                class="fas fa-minus"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="chart">
                                    <canvas id="lineChart_temp_humi" style="height:250px; min-height:250px"></canvas>
                                </div>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->


                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">最近24小时气压变化</h3>

                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse"><i
                                                class="fas fa-minus"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="chart">
                                    <canvas id="lineChart_press" style="height:250px; min-height:250px"></canvas>
                                </div>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->

                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">最近24小时光照变化</h3>

                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse"><i
                                                class="fas fa-minus"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="chart">
                                    <canvas id="lineChart_light" style="height:250px; min-height:250px"></canvas>
                                </div>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->


                        <!-- /.card -->
                    </section>
                    <!-- right col -->
                </div>
                <!-- /.row (main row) -->
            </div><!-- /.container-fluid -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <!--    <footer class="main-footer">-->
    <!--        <strong>Copyright &copy; 2014-2019 <a href="http://adminlte.io">AdminLTE.io</a>.</strong>-->
    <!--        保留所有权利。-->
    <!--        <div class="float-right d-none d-sm-inline-block">-->
    <!--            <b>版本</b> 3.0.0-->
    <!--        </div>-->
    <!--    </footer>-->

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- 控制侧边栏内容在这里 -->
    </aside>
    <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<#include "common-tail.ftl">
<!-- AdminLTE 仪表盘演示（仅用于演示） -->
<script src="dist/js/pages/dashboard.js"></script>
<!-- 用于演示 AdminLTE  -->
<#--<script src="dist/js/demo.js"></script>-->

<!-- jquery-dateformat -->
<script src="plugins/jquery-dateformat/jquery-dateformat.min.js"></script>


<!-- 页面脚本 -->

<script>
    let labels = [];
    let temp = [];
    let humi = [];
    let light = [];
    let press = [];

    $(function () {

        let successFunction = function (json) {
            console.info(json)
            let data = json.data;
            // 返回成功
            if (json.success) {
                for (let count = 0; count < json.data.length; count++) {
                    var tempDate = data[count].date
                    // 格式化时间
                    labels.push($.format.date(new Date(tempDate), 'H:mm'))
                    temp.push(data[count].temp)
                    humi.push(data[count].humi)
                    light.push(data[count].light)
                    press.push(data[count].press)
                }
            } else {
                console.warn(json.msg)
            }


            // 温度图表
            var lineChartTemp = document.getElementById('lineChart_temp_humi').getContext('2d');
            var chartTemp = new Chart(lineChartTemp, {
                // The type of chart we want to create
                type: 'line',

                // The data for our dataset
                data: {
                    labels: labels,
                    datasets: [{
                        label: '温度',
                        backgroundColor: 'rgba(60,141,188,0.9)',
                        borderColor: 'rgba(60,141,188,0.9)',
                        pointRadius: 2,
                        fill: false,
                        spanGaps: false,
                        data: temp
                    }]
                },

                // Configuration options go here
                options: {
                    maintainAspectRatio: false,
                    responsive: true,
                    legend: {
                        display: false
                    },
                    scales: {
                        labelString: "温度",
                        xAxes: [{
                            gridLines: {
                                display: true,
                            }
                        }],
                        yAxes: [{
                            gridLines: {
                                display: true,
                            }
                        }]
                    }
                }
            });


            // 气压图表
            var lineChartPress = document.getElementById('lineChart_press').getContext('2d');
            var chartPress = new Chart(lineChartPress, {
                // The type of chart we want to create
                type: 'line',

                // The data for our dataset
                data: {
                    labels: labels,
                    datasets: [{
                        label: '气压',
                        backgroundColor: 'rgb(255, 99, 132)',
                        borderColor: 'rgb(255, 99, 132)',
                        pointRadius: 2,
                        fill: false,
                        spanGaps: false,
                        data: press
                    }]
                },

                // Configuration options go here
                options: {
                    maintainAspectRatio: false,
                    responsive: true,
                    legend: {
                        display: false
                    },
                    scales: {
                        xAxes: [{
                            gridLines: {
                                display: true,
                            },
                            ticks: {}
                        }],
                        yAxes: [{
                            gridLines: {
                                display: true,
                            }
                        }]
                    }
                }
            });

            // 亮度图表
            var lineChart_light = document.getElementById('lineChart_light').getContext('2d');
            var chartLight = new Chart(lineChart_light, {
                // The type of chart we want to create
                type: 'line',

                // The data for our dataset
                data: {
                    labels: labels,
                    datasets: [{
                        label: '光照',
                        backgroundColor: 'rgb(137,248,7)',
                        borderColor: 'rgb(137,248,7)',
                        pointRadius: 2,
                        fill: false,
                        spanGaps: false,
                        data: light
                    }]
                },

                // Configuration options go here
                options: {
                    maintainAspectRatio: false,
                    responsive: true,
                    legend: {
                        display: false
                    },
                    scales: {
                        xAxes: [{
                            gridLines: {
                                display: true,
                            },
                            ticks: {}
                        }],
                        yAxes: [{
                            gridLines: {
                                display: true,
                            }
                        }]
                    }
                }
            });


        }

        $.ajax({
            url: "getChartDataJson?duration=1440&interval=120",
            method: "GET",
            success: successFunction,
            error: function () {
                console.error("error")
            }
        })


    })


</script>

<script>
    // $(function () {
    //     /* jQueryKnob */
    //
    //     $('.knob').knob({
    //         /*change : function (value) {
    //          //console.log("change : " + value);
    //          },
    //          release : function (value) {
    //          console.log("release : " + value);
    //          },
    //          cancel : function () {
    //          console.log("cancel : " + this.value);
    //          },*/
    //         draw: function () {
    //
    //             // "tron" 示例
    //             if (this.$.data('skin') == 'tron') {
    //
    //                 var a = this.angle(this.cv)  // 角度
    //                     ,
    //                     sa = this.startAngle          // 之前开始角
    //                     ,
    //                     sat = this.startAngle         // 开始角度
    //                     ,
    //                     ea                            // 之前结束角
    //                     ,
    //                     eat = sat + a                 // 结束角度
    //                     ,
    //                     r = true
    //
    //                 this.g.lineWidth = this.lineWidth
    //
    //                 this.o.cursor
    //                 && (sat = eat - 0.3)
    //                 && (eat = eat + 0.3)
    //
    //                 if (this.o.displayPrevious) {
    //                     ea = this.startAngle + this.angle(this.value)
    //                     this.o.cursor
    //                     && (sa = ea - 0.3)
    //                     && (ea = ea + 0.3)
    //                     this.g.beginPath()
    //                     this.g.strokeStyle = this.previousColor
    //                     this.g.arc(this.xy, this.xy, this.radius - this.lineWidth, sa, ea, false)
    //                     this.g.stroke()
    //                 }
    //
    //                 this.g.beginPath()
    //                 this.g.strokeStyle = r ? this.o.fgColor : this.fgColor
    //                 this.g.arc(this.xy, this.xy, this.radius - this.lineWidth, sat, eat, false)
    //                 this.g.stroke()
    //
    //                 this.g.lineWidth = 2
    //                 this.g.beginPath()
    //                 this.g.strokeStyle = this.o.fgColor
    //                 this.g.arc(this.xy, this.xy, this.radius - this.lineWidth + 1 + this.lineWidth * 2 / 3, 0, 2 * Math.PI, false)
    //                 this.g.stroke()
    //
    //                 return false
    //             }
    //         }
    //     })
    //     /* 结束 JQUERY KNOB */
    //
    //     // 初始化 SPARKLINE 图表
    //     $('.sparkline').each(function () {
    //         var $this = $(this)
    //         $this.sparkline('html', $this.data())
    //     })
    //
    //     /* SPARKLINE 文档示例 http://omnipotent.net/jquery.sparkline/#s-about */
    //     drawDocSparklines()
    //     drawMouseSpeedDemo()
    //
    // })
    //
    // function drawDocSparklines() {
    //
    //     // 条形 + 折线复合图
    //     $('#compositebar').sparkline('html', {
    //         type: 'bar',
    //         barColor: '#aaf'
    //     })
    //     $('#compositebar').sparkline([4, 1, 5, 7, 9, 9, 8, 7, 6, 6, 4, 7, 8, 4, 3, 2, 2, 5, 6, 7],
    //         {
    //             composite: true,
    //             fillColor: false,
    //             lineColor: 'red'
    //         })
    //
    //
    //     // 折线图从标记中获取值
    //     $('.sparkline-1').sparkline()
    //
    //     // 文档的折线图较大
    //     $('.largeline').sparkline('html',
    //         {
    //             type: 'line',
    //             height: '2.5em',
    //             width: '4em'
    //         })
    //
    //     // 自定义折线图
    //     $('#linecustom').sparkline('html',
    //         {
    //             height: '1.5em',
    //             width: '8em',
    //             lineColor: '#f00',
    //             fillColor: '#ffa',
    //             minSpotColor: false,
    //             maxSpotColor: false,
    //             spotColor: '#77f',
    //             spotRadius: 3
    //         })
    //
    //     // 条形图使用内置值
    //     $('.sparkbar').sparkline('html', {type: 'bar'})
    //
    //     $('.barformat').sparkline([1, 3, 5, 3, 8], {
    //         type: 'bar',
    //         tooltipFormat: '{{value:levels}} - {{value}}',
    //         tooltipValueLookups: {
    //             levels: $.range_map({
    //                 ':2': 'Low',
    //                 '3:6': 'Medium',
    //                 '7:': 'High'
    //             })
    //         }
    //     })
    //
    //     // 三态图使用内置值
    //     $('.sparktristate').sparkline('html', {type: 'tristate'})
    //     $('.sparktristatecols').sparkline('html',
    //         {
    //             type: 'tristate',
    //             colorMap: {
    //                 '-2': '#fa7',
    //                 '2': '#44f'
    //             }
    //         })
    //
    //     // 复合折线图，第二个使用 javascript 提供的值
    //     $('#compositeline').sparkline('html', {
    //         fillColor: false,
    //         changeRangeMin: 0,
    //         chartRangeMax: 10
    //     })
    //     $('#compositeline').sparkline([4, 1, 5, 7, 9, 9, 8, 7, 6, 6, 4, 7, 8, 4, 3, 2, 2, 5, 6, 7],
    //         {
    //             composite: true,
    //             fillColor: false,
    //             lineColor: 'red',
    //             changeRangeMin: 0,
    //             chartRangeMax: 10
    //         })
    //
    //     // 带有正常范围标记的折线图
    //     $('#normalline').sparkline('html',
    //         {
    //             fillColor: false,
    //             normalRangeMin: -1,
    //             normalRangeMax: 8
    //         })
    //     $('#normalExample').sparkline('html',
    //         {
    //             fillColor: false,
    //             normalRangeMin: 80,
    //             normalRangeMax: 95,
    //             normalRangeColor: '#4f4'
    //         })
    //
    //     // 离散图表
    //     $('.discrete1').sparkline('html',
    //         {
    //             type: 'discrete',
    //             lineColor: 'blue',
    //             xwidth: 18
    //         })
    //     $('#discrete2').sparkline('html',
    //         {
    //             type: 'discrete',
    //             lineColor: 'blue',
    //             thresholdColor: 'red',
    //             thresholdValue: 4
    //         })
    //
    //     // 项目符号图
    //     $('.sparkbullet').sparkline('html', {type: 'bullet'})
    //
    //     // 饼形图
    //     $('.sparkpie').sparkline('html', {
    //         type: 'pie',
    //         height: '1.0em'
    //     })
    //
    //     // 盒形图
    //     $('.sparkboxplot').sparkline('html', {type: 'box'})
    //     $('.sparkboxplotraw').sparkline([1, 3, 5, 8, 10, 15, 18],
    //         {
    //             type: 'box',
    //             raw: true,
    //             showOutliers: true,
    //             target: 6
    //         })
    //
    //     // 具有特定字段顺序的盒形图
    //     $('.boxfieldorder').sparkline('html', {
    //         type: 'box',
    //         tooltipFormatFieldlist: ['med', 'lq', 'uq'],
    //         tooltipFormatFieldlistKey: 'field'
    //     })
    //
    //     // 迷你图点击事件演示
    //     $('.clickdemo').sparkline()
    //     $('.clickdemo').bind('sparklineClick', function (ev) {
    //         var sparkline = ev.sparklines[0],
    //             region = sparkline.getCurrentRegionFields()
    //         value = region.y
    //         alert('Clicked on x=' + region.x + ' y=' + region.y)
    //     })
    //
    //     // 迷你图鼠标悬停事件演示
    //     $('.mouseoverdemo').sparkline()
    //     $('.mouseoverdemo').bind('sparklineRegionChange', function (ev) {
    //         var sparkline = ev.sparklines[0],
    //             region = sparkline.getCurrentRegionFields()
    //         value = region.y
    //         $('.mouseoverregion').text('x=' + region.x + ' y=' + region.y)
    //     }).bind('mouseleave', function () {
    //         $('.mouseoverregion').text('')
    //     })
    // }
    //
    // /**
    //  ** 绘制鼠标移动速度图
    //  ** 这只是将处理程序附加到 mousemove 事件以查看
    //  ** 鼠标（大致）移动了多远
    //  ** 然后每秒两次更新
    //  ** setTimeout()
    //  **/
    // function drawMouseSpeedDemo() {
    //     var mrefreshinterval = 500 // 每 500ms 更新显示
    //     var lastmousex = -1
    //     var lastmousey = -1
    //     var lastmousetime
    //     var mousetravel = 0
    //     var mpoints = []
    //     var mpoints_max = 30
    //     $('html').mousemove(function (e) {
    //         var mousex = e.pageX
    //         var mousey = e.pageY
    //         if (lastmousex > -1) {
    //             mousetravel += Math.max(Math.abs(mousex - lastmousex), Math.abs(mousey - lastmousey))
    //         }
    //         lastmousex = mousex
    //         lastmousey = mousey
    //     })
    //     var mdraw = function () {
    //         var md = new Date()
    //         var timenow = md.getTime()
    //         if (lastmousetime && lastmousetime != timenow) {
    //             var pps = Math.round(mousetravel / (timenow - lastmousetime) * 1000)
    //             mpoints.push(pps)
    //             if (mpoints.length > mpoints_max) {
    //                 mpoints.splice(0, 1)
    //             }
    //             mousetravel = 0
    //             $('#mousespeed').sparkline(mpoints, {
    //                 width: mpoints.length * 2,
    //                 tooltipSuffix: ' 每秒像素'
    //             })
    //         }
    //         lastmousetime = timenow
    //         setTimeout(mdraw, mrefreshinterval)
    //     }
    //     // 我们可以改用 setInterval，但是我更喜欢这样
    //     setTimeout(mdraw, mrefreshinterval);
    // }
</script>

</body>
</html>
