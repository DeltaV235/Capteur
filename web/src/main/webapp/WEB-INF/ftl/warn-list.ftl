<!DOCTYPE html>
<html>
<head>

    <title>Capteur | 告警列表</title>

    <#include "common-head.ftl">
    <#assign page="warnings">

    <!-- DataTables -->
    <link rel="stylesheet" href="plugins/datatables-bs4/css/dataTables.bootstrap4.css">

    <!-- 自定义CSS -->
    <link rel="stylesheet" href="dist/css/user/user.css">

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
                        <h1 class="m-0 text-dark">告警列表</h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">主页</a></li>
                            <li class="breadcrumb-item active">告警列表</li>
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

                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <!--                                <h3 class="card-title">最近告警</h3>-->
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <div id="accordion">
                                    <!-- we are adding the .class so bootstrap.js collapse plugin detects it -->

                                    <table id="warn-1" class="table">
                                        <thead>
                                        <tr style="display:none;">
                                            <td>
                                                告警
                                            </td>
                                        </tr>
                                        </thead>
                                        <tbody>


                                        <#list warnings as warning>

                                            <tr>
                                                <td class="warn-list-table-td">
                                                    <!-- 告警条目开始 -->
                                                    <div class="card card-primary warn-list-table-card-no-margin">
                                                        <!-- 标题栏 -->
                                                        <a data-toggle="collapse" data-parent="#accordion"
                                                           href="#id_${warning.id}">
                                                            <div class="card-header
                                                            <#if warning.level=="e">alert-danger
                                                            <#elseif warning.level=="w">alert-warning
                                                            <#elseif warning.level=="i">alert-secondary
                                                            </#if>"
                                                                 style="border-radius: 4px">
                                                                <h4 class="card-title">
                                                                    ${warning.name}
                                                                </h4>
                                                                <span class="badge badge-pill float-left"
                                                                      style="height: 21px;line-height: 21px;
                                                      padding-top: 0;padding-bottom: 0">
                                                    new
                                                </span>
                                                                <span class="badge badge-pill float-right"
                                                                      style="height: 21px;line-height: 21px;
                                                      padding-top: 0;padding-bottom: 0">
                                                    9分钟前
                                                </span>
                                                            </div>
                                                        </a>

                                                        <!-- 告警主体 -->
                                                        <div id="id_${warning.id}" class="panel-collapse collapse in">
                                                            <div class="card-body" style="padding: 0">

                                                                <!-- 标签条 -->
                                                                <ul class="nav nav-tabs" id="custom-content-below-tab"
                                                                    role="tablist">
                                                                    <li class="nav-item">
                                                                        <a class="nav-link active"
                                                                           id="custom-content-below-home-tab"
                                                                           data-toggle="pill" href="#info"
                                                                           role="tab" aria-controls="info"
                                                                           aria-selected="true"
                                                                           style="margin-left: 0; border-left: 0"
                                                                        >
                                                                            详情
                                                                        </a>
                                                                    </li>
                                                                    <li class="nav-item">
                                                                        <a class="nav-link"
                                                                           id="custom-content-below-profile-tab"
                                                                           data-toggle="pill" href="#check-history"
                                                                           role="tab" aria-controls="check-history"
                                                                           aria-selected="false">探测历史</a>
                                                                    </li>
                                                                    <li class="nav-item">
                                                                        <a class="nav-link"
                                                                           id="custom-content-below-messages-tab"
                                                                           data-toggle="pill" href="#operation-history"
                                                                           role="tab" aria-controls="operation-history"
                                                                           aria-selected="false">操作历史</a>
                                                                    </li>
                                                                    <li class="nav-item">
                                                                        <a class="nav-link" id="tab-warn-history"
                                                                           data-toggle="pill" href="#warn-history"
                                                                           role="tab" aria-controls="warn-history"
                                                                           aria-selected="false">告警历史</a>
                                                                    </li>
                                                                    <li class="nav-item">
                                                                        <a class="nav-link"
                                                                           id="custom-content-below-settings-tab"
                                                                           data-toggle="pill" href="#setting"
                                                                           role="tab" aria-controls="setting"
                                                                           aria-selected="false">设置</a>
                                                                    </li>
                                                                </ul>

                                                                <!-- 标签内容 -->
                                                                <div class="tab-content"
                                                                     id="custom-content-below-tabContent">


                                                                    <!-- 第一个标签的内容 -->
                                                                    <div class="tab-pane fade show active"
                                                                         id="info" role="tabpanel"
                                                                         aria-labelledby="info">

                                                                        <div class="card-body">

                                                                            <div class="row">
                                                                                <div class="col-md-3">
                                                                                    告警状态:
                                                                                    &nbsp;
                                                                                    <#if warning.status=="w">
                                                                                        <span class="badge badge-danger"
                                                                                              style="height: 24px;line-height: 22px;
                                                      padding-top: 1px;padding-bottom: 1px;margin-top: 1px;margin-bottom: 1px">未恢复
                                                        </span>
                                                                                    <#elseif warning.status=="r">
                                                                                        <span class="badge badge-success"
                                                                                              style="height: 24px;line-height: 22px;
                                                      padding-top: 1px;padding-bottom: 1px;margin-top: 1px;
                                                      margin-bottom: 1px">已恢复
                                                        </span>
                                                                                    </#if>
                                                                                </div>

                                                                                <div class="col-md-3">
                                                                                    告警等级:
                                                                                    &nbsp;

                                                                                    <#if warning.level=="e">
                                                                                        <span class="badge badge-danger"
                                                                                              style="height: 24px;line-height: 22px;
                                                      padding-top: 1px;padding-bottom: 1px;margin-top: 1px;margin-bottom: 1px">ERROR
                                                                    </span>
                                                                                    <#elseif warning.level=="w">
                                                                                        <span class="badge badge-warning"
                                                                                              style="height: 24px;line-height: 22px;
                                                      padding-top: 1px;padding-bottom: 1px;margin-top: 1px;
                                                      margin-bottom: 1px">WARN
                                                                    </span>
                                                                                    <#elseif warning.level=="i">
                                                                                        <span class="badge badge-secondary"
                                                                                              style="height: 24px;line-height: 22px;
                                                      padding-top: 1px;padding-bottom: 1px;margin-top: 1px;
                                                      margin-bottom: 1px">INFO
                                                                    </span>

                                                                                    </#if>
                                                                                </div>

                                                                                <div class="col-md-3">
                                                                                    告警ID:
                                                                                    &nbsp;
                                                                                    ${warning.id}
                                                                                </div>

                                                                                <div class="col-md-3">
                                                                                    告警规则ID:
                                                                                    &nbsp;
                                                                                    ${warning.ruleId}
                                                                                </div>
                                                                            </div>
                                                                            <hr>

                                                                            <div class="row">
                                                                                <div class="col-md-6 float-left">
                                                                                    告警描述:
                                                                                </div>
                                                                                <div class="col-md-3 float-right">
                                                                                    告警触发条件:
                                                                                </div>
                                                                                <div class="col-md-3 float-right">
                                                                                    当前值为:
                                                                                </div>
                                                                            </div>

                                                                            <div class="row">
                                                                                <div class="col-md-6 float-left"
                                                                                     style="margin-top: 10px">
                                                                                    ${warning.description}
                                                                                </div>
                                                                                <div class="col-md-3 float-right"
                                                                                     style="margin-top: 10px">
                                                                                    <#list warning.conditions as condition>
                                                                                        <div class="row-cols-3">
                                                                                            <#if condition.param=='t'>
                                                                                                温度
                                                                                            <#elseif condition
                                                                                            .param=='h'>
                                                                                                湿度
                                                                                            <#elseif condition
                                                                                            .param=='l'>
                                                                                                亮度
                                                                                            <#elseif condition
                                                                                            .param=='p'>
                                                                                                气压
                                                                                            </#if>

                                                                                            ${condition.symbol}
                                                                                            ${condition.data}

                                                                                            <#if condition.param=='t'>
                                                                                                ℃
                                                                                            <#elseif condition
                                                                                            .param=='h'>
                                                                                                %
                                                                                            <#elseif condition
                                                                                            .param=='l'>
                                                                                                lux
                                                                                            <#elseif condition
                                                                                            .param=='p'>
                                                                                                Pa
                                                                                            </#if>
                                                                                        </div>
                                                                                    </#list>

                                                                                </div>

                                                                                <div class="col-md-3 float-right"
                                                                                     style="margin-top: 10px">

                                                                                    <#list warning.conditions as
                                                                                    condition>
                                                                                        <#if condition.param=="t">
                                                                                            <div class="row-cols-3">
                                                                                                温度
                                                                                                = ${warning.curSensorData
                                                                                                .temp} ℃
                                                                                            </div>
                                                                                        <#elseif condition
                                                                                        .param=="h">
                                                                                            <div class="row-cols-3">
                                                                                                湿度
                                                                                                = ${warning.curSensorData
                                                                                                .humi} %
                                                                                            </div>
                                                                                        <#elseif condition
                                                                                        .param=="p">
                                                                                            <div class="row-cols-3">
                                                                                                气压
                                                                                                = ${warning.curSensorData
                                                                                                .press} ATM
                                                                                            </div>
                                                                                        <#elseif condition
                                                                                        .param=="l">
                                                                                            <div class="row-cols-3">
                                                                                                亮度
                                                                                                = ${warning.curSensorData
                                                                                                .light} lux
                                                                                            </div>
                                                                                        </#if>

                                                                                    </#list>


                                                                                </div>
                                                                            </div>

                                                                            <hr>

                                                                            <div class="row">
                                                                                <div class="col-md-4">
                                                                                    开始时间:
                                                                                    <span>${warning.startTime?string
                                                                                        ('yyyy-MM-dd HH:mm:ss')}</span>
                                                                                </div>
                                                                                <div class="col-md-4">
                                                                                    最近触发时间:
                                                                                    <span>${warning.lastTriggerTime?string
                                                                                        ('yyyy-MM-dd HH:mm:ss')}</span>
                                                                                </div>
                                                                                <div class="col-md-4">
                                                                                    恢复时间:
                                                                                    <span>
                                                                                    <#if warning.recoverTime??>
                                                                                        ${warning.recoverTime?string('yyyy-MM-dd HH:mm:ss')}
                                                                                    </#if>
                                                                                    </span>
                                                                                </div>
                                                                            </div>


                                                                            <div class="row"
                                                                                 style="margin-top: 30px">
                                                                                <div class="col-12">

                                                                                    <div class="btn-group float-left">
                                                                                        <button type="button"
                                                                                                class="btn btn-secondary">
                                                                                            抑制告警15分钟
                                                                                        </button>
                                                                                        <button type="button"
                                                                                                class="btn btn-secondary dropdown-toggle dropdown-icon"
                                                                                                data-toggle="dropdown">
                                                                                            <span class="sr-only">下拉切换</span>
                                                                                            <div class="dropdown-menu"
                                                                                                 role="menu">
                                                                                                <a class="dropdown-item"
                                                                                                   href="#">5分钟</a>
                                                                                                <a class="dropdown-item"
                                                                                                   href="#">30分钟</a>
                                                                                                <a class="dropdown-item"
                                                                                                   href="#">1小时</a>
                                                                                                <a class="dropdown-item"
                                                                                                   href="#">3小时</a>
                                                                                                <a class="dropdown-item"
                                                                                                   href="#">24小时</a>
                                                                                                <div class="dropdown-divider"></div>
                                                                                                <a class="dropdown-item"
                                                                                                   href="#">禁用告警</a>
                                                                                            </div>
                                                                                        </button>
                                                                                    </div>

                                                                                </div>
                                                                            </div>

                                                                        </div>


                                                                    </div>


                                                                    <div class="tab-pane fade" id="check-history"
                                                                         role="tabpanel"
                                                                         aria-labelledby="custom-content-below-profile-tab">

                                                                        <div class="card-body">


                                                                        </div>

                                                                    </div>


                                                                    <div class="tab-pane fade" id="operation-history"
                                                                         role="tabpanel"
                                                                         aria-labelledby="custom-content-below-messages-tab">


                                                                    </div>

                                                                    <div class="tab-pane fade" id="warn-history"
                                                                         role="tabpanel"
                                                                         aria-labelledby="custom-content-below-settings-tab">


                                                                    </div>

                                                                    <div class="tab-pane fade" id="setting"
                                                                         role="tabpanel"
                                                                         aria-labelledby="custom-content-below-settings-tab">


                                                                    </div>
                                                                </div>


                                                            </div>

                                                        </div>
                                                    </div>
                                                    <!-- 告警条目结束 -->
                                                </td>
                                            </tr>

                                        </#list>

                                        </tbody>
                                    </table>

                                </div>
                            </div>


                        </div>
                        <!-- /.card-body -->

                    </div>
                    <!-- /.card -->

                </div>
                <!-- /.col -->

            </div><!-- /.container-fluid -->
        </section>
    </div>
    <!-- /.content -->

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

<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- AdminLTE App -->
<script src="dist/js/adminlte.js"></script>

<!-- DataTables -->
<script src="plugins/datatables/jquery.dataTables.js"></script>
<script src="plugins/datatables-bs4/js/dataTables.bootstrap4.js"></script>


<!-- 页面脚本 -->
<script>
    $(function () {
        $('#warn-1').DataTable({
            "language": {
                "sProcessing": "处理中...",
                "sLengthMenu": "显示 _MENU_ 项结果",
                "sZeroRecords": "没有匹配结果",
                "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
                "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
                "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
                "sInfoPostFix": "",
                "sSearch": "搜索:",
                "sUrl": "",
                "sEmptyTable": "表中数据为空",
                "sLoadingRecords": "载入中...",
                "sInfoThousands": ",",
                "oPaginate": {
                    "sFirst": "首页",
                    "sPrevious": "上页",
                    "sNext": "下页",
                    "sLast": "末页"
                },
                "oAria": {
                    "sSortAscending": ": 以升序排列此列",
                    "sSortDescending": ": 以降序排列此列"
                }
            },
            "paging": true,
            "lengthChange": false,
            "searching": false,
            "ordering": false,
            "info": false,
            "autoWidth": false,

        })
    })
</script>

</body>
</html>
