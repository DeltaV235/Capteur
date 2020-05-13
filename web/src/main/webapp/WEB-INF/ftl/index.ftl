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
                        <h1 class="m-0 text-dark">仪表盘</h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">主页</a></li>
                            <li class="breadcrumb-item active">仪表盘</li>
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
                                            <th>开始时间</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td><a href="../../pages/examples/invoice.html">OR9842</a></td>
                                            <td>使命召唤 4</td>
                                            <td><span class="badge badge-success">已发货</span></td>
                                            <td>
                                                <div class="sparkbar" data-color="#00a65a" data-height="20">
                                                    90,80,90,-70,61,-83,63
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><a href="../../pages/examples/invoice.html">OR1848</a></td>
                                            <td>三星智能电视</td>
                                            <td><span class="badge badge-warning">待处理</span></td>
                                            <td>
                                                <div class="sparkbar" data-color="#f39c12" data-height="20">
                                                    90,80,-90,70,61,-83,68
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><a href="../../pages/examples/invoice.html">OR7429</a></td>
                                            <td>iPhone 6 Plus</td>
                                            <td><span class="badge badge-danger">已交付</span></td>
                                            <td>
                                                <div class="sparkbar" data-color="#f56954" data-height="20">
                                                    90,-80,90,70,-61,83,63
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><a href="../../pages/examples/invoice.html">OR7429</a></td>
                                            <td>三星智能电视</td>
                                            <td><span class="badge badge-info">处理中</span></td>
                                            <td>
                                                <div class="sparkbar" data-color="#00c0ef" data-height="20">
                                                    90,80,-90,70,-61,83,63
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><a href="../../pages/examples/invoice.html">OR1848</a></td>
                                            <td>三星智能电视</td>
                                            <td><span class="badge badge-warning">待处理</span></td>
                                            <td>
                                                <div class="sparkbar" data-color="#f39c12" data-height="20">
                                                    90,80,-90,70,61,-83,68
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><a href="../../pages/examples/invoice.html">OR7429</a></td>
                                            <td>iPhone 6 Plus</td>
                                            <td><span class="badge badge-danger">已交付</span></td>
                                            <td>
                                                <div class="sparkbar" data-color="#f56954" data-height="20">
                                                    90,-80,90,70,-61,83,63
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><a href="../../pages/examples/invoice.html">OR9842</a></td>
                                            <td>使命召唤 4</td>
                                            <td><span class="badge badge-success">已发货</span></td>
                                            <td>
                                                <div class="sparkbar" data-color="#00a65a" data-height="20">
                                                    90,80,90,-70,61,-83,63
                                                </div>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- /.table-responsive -->
                            </div>
                            <!-- /.card-body -->
                            <div class="card-footer clearfix">
                                <a href="javascript:void(0)" class="btn btn-sm btn-secondary float-right">查看所有告警</a>
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

<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- 解决使用 Bootstrap 提示工具与 jQuery UI 提示工具冲突 -->
<script>
    $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- ChartJS -->
<script src="plugins/chart.js/Chart.min.js"></script>
<!-- Sparkline -->
<script src="plugins/sparklines/sparkline.js"></script>
<!-- JQVMap -->
<script src="plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
<!-- jQuery Knob Chart -->
<script src="plugins/jquery-knob/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="plugins/moment/moment.min.js"></script>
<script src="plugins/moment/locale/zh-cn.js"></script>
<script src="plugins/daterangepicker/daterangepicker.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Summernote -->
<script src="plugins/summernote/summernote-bs4.min.js"></script>
<!-- overlayScrollbars -->
<script src="plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.js"></script>
<!-- AdminLTE 仪表盘演示（仅用于演示） -->
<script src="dist/js/pages/dashboard.js"></script>
<!-- 用于演示 AdminLTE  -->
<script src="dist/js/demo.js"></script>


<!-- 页面脚本 -->

<script>
    var areaChartData = {
        labels: ['一月', '二月', '三月', '四月', '五月', '六月', '七月'],
        datasets: [
            {
                label: '数字产品',
                backgroundColor: 'rgba(60,141,188,0.9)',
                borderColor: 'rgba(60,141,188,0.8)',
                pointRadius: false,
                pointColor: '#3b8bba',
                pointStrokeColor: 'rgba(60,141,188,1)',
                pointHighlightFill: '#fff',
                pointHighlightStroke: 'rgba(60,141,188,1)',
                data: [28, 48, 40, 19, 86, 27, 90]
            },
            {
                label: '电子产品',
                backgroundColor: 'rgba(210, 214, 222, 1)',
                borderColor: 'rgba(210, 214, 222, 1)',
                pointRadius: false,
                pointColor: 'rgba(210, 214, 222, 1)',
                pointStrokeColor: '#c1c7d1',
                pointHighlightFill: '#fff',
                pointHighlightStroke: 'rgba(220,220,220,1)',
                data: [65, 59, 80, 81, 56, 55, 40]
            },
        ]
    }














    var areaChartOptions = {
        maintainAspectRatio: false,
        responsive: true,
        legend: {
            display: false
        },
        scales: {
            xAxes: [{
                gridLines: {
                    display: false,
                }
            }],
            yAxes: [{
                gridLines: {
                    display: false,
                }
            }]
        }
    }

    //-------------
    //- 折线图 -
    //--------------
    var lineChartCanvas = $('#lineChart_temp_humi').get(0).getContext('2d')
    var lineChartOptions = jQuery.extend(true, {}, areaChartOptions)
    var lineChartData = jQuery.extend(true, {}, areaChartData)
    lineChartData.datasets[0].fill = false;
    lineChartData.datasets[1].fill = false;
    lineChartOptions.datasetFill = false

    var lineChart = new Chart(lineChartCanvas, {
        type: 'line',
        data: lineChartData,
        options: lineChartOptions
    })
</script>

<script>
    $(function () {
        /* jQueryKnob */

        $('.knob').knob({
            /*change : function (value) {
             //console.log("change : " + value);
             },
             release : function (value) {
             console.log("release : " + value);
             },
             cancel : function () {
             console.log("cancel : " + this.value);
             },*/
            draw: function () {

                // "tron" 示例
                if (this.$.data('skin') == 'tron') {

                    var a = this.angle(this.cv)  // 角度
                        ,
                        sa = this.startAngle          // 之前开始角
                        ,
                        sat = this.startAngle         // 开始角度
                        ,
                        ea                            // 之前结束角
                        ,
                        eat = sat + a                 // 结束角度
                        ,
                        r = true

                    this.g.lineWidth = this.lineWidth

                    this.o.cursor
                    && (sat = eat - 0.3)
                    && (eat = eat + 0.3)

                    if (this.o.displayPrevious) {
                        ea = this.startAngle + this.angle(this.value)
                        this.o.cursor
                        && (sa = ea - 0.3)
                        && (ea = ea + 0.3)
                        this.g.beginPath()
                        this.g.strokeStyle = this.previousColor
                        this.g.arc(this.xy, this.xy, this.radius - this.lineWidth, sa, ea, false)
                        this.g.stroke()
                    }

                    this.g.beginPath()
                    this.g.strokeStyle = r ? this.o.fgColor : this.fgColor
                    this.g.arc(this.xy, this.xy, this.radius - this.lineWidth, sat, eat, false)
                    this.g.stroke()

                    this.g.lineWidth = 2
                    this.g.beginPath()
                    this.g.strokeStyle = this.o.fgColor
                    this.g.arc(this.xy, this.xy, this.radius - this.lineWidth + 1 + this.lineWidth * 2 / 3, 0, 2 * Math.PI, false)
                    this.g.stroke()

                    return false
                }
            }
        })
        /* 结束 JQUERY KNOB */

        // 初始化 SPARKLINE 图表
        $('.sparkline').each(function () {
            var $this = $(this)
            $this.sparkline('html', $this.data())
        })

        /* SPARKLINE 文档示例 http://omnipotent.net/jquery.sparkline/#s-about */
        drawDocSparklines()
        drawMouseSpeedDemo()

    })

    function drawDocSparklines() {

        // 条形 + 折线复合图
        $('#compositebar').sparkline('html', {
            type: 'bar',
            barColor: '#aaf'
        })
        $('#compositebar').sparkline([4, 1, 5, 7, 9, 9, 8, 7, 6, 6, 4, 7, 8, 4, 3, 2, 2, 5, 6, 7],
            {
                composite: true,
                fillColor: false,
                lineColor: 'red'
            })


        // 折线图从标记中获取值
        $('.sparkline-1').sparkline()

        // 文档的折线图较大
        $('.largeline').sparkline('html',
            {
                type: 'line',
                height: '2.5em',
                width: '4em'
            })

        // 自定义折线图
        $('#linecustom').sparkline('html',
            {
                height: '1.5em',
                width: '8em',
                lineColor: '#f00',
                fillColor: '#ffa',
                minSpotColor: false,
                maxSpotColor: false,
                spotColor: '#77f',
                spotRadius: 3
            })

        // 条形图使用内置值
        $('.sparkbar').sparkline('html', {type: 'bar'})

        $('.barformat').sparkline([1, 3, 5, 3, 8], {
            type: 'bar',
            tooltipFormat: '{{value:levels}} - {{value}}',
            tooltipValueLookups: {
                levels: $.range_map({
                    ':2': 'Low',
                    '3:6': 'Medium',
                    '7:': 'High'
                })
            }
        })

        // 三态图使用内置值
        $('.sparktristate').sparkline('html', {type: 'tristate'})
        $('.sparktristatecols').sparkline('html',
            {
                type: 'tristate',
                colorMap: {
                    '-2': '#fa7',
                    '2': '#44f'
                }
            })

        // 复合折线图，第二个使用 javascript 提供的值
        $('#compositeline').sparkline('html', {
            fillColor: false,
            changeRangeMin: 0,
            chartRangeMax: 10
        })
        $('#compositeline').sparkline([4, 1, 5, 7, 9, 9, 8, 7, 6, 6, 4, 7, 8, 4, 3, 2, 2, 5, 6, 7],
            {
                composite: true,
                fillColor: false,
                lineColor: 'red',
                changeRangeMin: 0,
                chartRangeMax: 10
            })

        // 带有正常范围标记的折线图
        $('#normalline').sparkline('html',
            {
                fillColor: false,
                normalRangeMin: -1,
                normalRangeMax: 8
            })
        $('#normalExample').sparkline('html',
            {
                fillColor: false,
                normalRangeMin: 80,
                normalRangeMax: 95,
                normalRangeColor: '#4f4'
            })

        // 离散图表
        $('.discrete1').sparkline('html',
            {
                type: 'discrete',
                lineColor: 'blue',
                xwidth: 18
            })
        $('#discrete2').sparkline('html',
            {
                type: 'discrete',
                lineColor: 'blue',
                thresholdColor: 'red',
                thresholdValue: 4
            })

        // 项目符号图
        $('.sparkbullet').sparkline('html', {type: 'bullet'})

        // 饼形图
        $('.sparkpie').sparkline('html', {
            type: 'pie',
            height: '1.0em'
        })

        // 盒形图
        $('.sparkboxplot').sparkline('html', {type: 'box'})
        $('.sparkboxplotraw').sparkline([1, 3, 5, 8, 10, 15, 18],
            {
                type: 'box',
                raw: true,
                showOutliers: true,
                target: 6
            })

        // 具有特定字段顺序的盒形图
        $('.boxfieldorder').sparkline('html', {
            type: 'box',
            tooltipFormatFieldlist: ['med', 'lq', 'uq'],
            tooltipFormatFieldlistKey: 'field'
        })

        // 迷你图点击事件演示
        $('.clickdemo').sparkline()
        $('.clickdemo').bind('sparklineClick', function (ev) {
            var sparkline = ev.sparklines[0],
                region = sparkline.getCurrentRegionFields()
            value = region.y
            alert('Clicked on x=' + region.x + ' y=' + region.y)
        })

        // 迷你图鼠标悬停事件演示
        $('.mouseoverdemo').sparkline()
        $('.mouseoverdemo').bind('sparklineRegionChange', function (ev) {
            var sparkline = ev.sparklines[0],
                region = sparkline.getCurrentRegionFields()
            value = region.y
            $('.mouseoverregion').text('x=' + region.x + ' y=' + region.y)
        }).bind('mouseleave', function () {
            $('.mouseoverregion').text('')
        })
    }

    /**
     ** 绘制鼠标移动速度图
     ** 这只是将处理程序附加到 mousemove 事件以查看
     ** 鼠标（大致）移动了多远
     ** 然后每秒两次更新
     ** setTimeout()
     **/
    function drawMouseSpeedDemo() {
        var mrefreshinterval = 500 // 每 500ms 更新显示
        var lastmousex = -1
        var lastmousey = -1
        var lastmousetime
        var mousetravel = 0
        var mpoints = []
        var mpoints_max = 30
        $('html').mousemove(function (e) {
            var mousex = e.pageX
            var mousey = e.pageY
            if (lastmousex > -1) {
                mousetravel += Math.max(Math.abs(mousex - lastmousex), Math.abs(mousey - lastmousey))
            }
            lastmousex = mousex
            lastmousey = mousey
        })
        var mdraw = function () {
            var md = new Date()
            var timenow = md.getTime()
            if (lastmousetime && lastmousetime != timenow) {
                var pps = Math.round(mousetravel / (timenow - lastmousetime) * 1000)
                mpoints.push(pps)
                if (mpoints.length > mpoints_max) {
                    mpoints.splice(0, 1)
                }
                mousetravel = 0
                $('#mousespeed').sparkline(mpoints, {
                    width: mpoints.length * 2,
                    tooltipSuffix: ' 每秒像素'
                })
            }
            lastmousetime = timenow
            setTimeout(mdraw, mrefreshinterval)
        }
        // 我们可以改用 setInterval，但是我更喜欢这样
        setTimeout(mdraw, mrefreshinterval);
    }
</script>

</body>
</html>
