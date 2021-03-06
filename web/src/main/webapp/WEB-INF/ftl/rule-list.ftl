<!DOCTYPE html>
<html>
<head>
    <title>Capteur | 告警规则列表</title>

    <#include "common-head.ftl">

    <#assign page="rules">

    <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="plugins/datatables-bs4/css/dataTables.bootstrap4.css">

    <!-- 自定义CSS -->
    <link rel="stylesheet" href="dist/css/user/user.css">

    <!-- SweetAlert2 -->
    <link rel="stylesheet" href="plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css">
    <!-- Toastr -->
    <link rel="stylesheet" href="plugins/toastr/toastr.min.css">


    <!-- Ion 滑块 -->
    <link rel="stylesheet" href="plugins/ion-rangeslider/css/ion.rangeSlider.min.css">
    <!-- bootstrap slider -->
    <!--    <link rel="stylesheet" href="plugins/bootstrap-slider/css/bootstrap-slider.min.css">-->

    <!-- Select2 -->
    <link rel="stylesheet" href="plugins/select2/css/select2.min.css">
    <link rel="stylesheet" href="plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">


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
                        <h1 class="m-0 text-dark">告警规则</h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">主页</a></li>
                            <li class="breadcrumb-item active">告警规则</li>
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

                                <div class="col-md-1">
                                    <button type="button"
                                            class="btn btn-default btn-block col-md-10"
                                            data-toggle="modal" data-target="#add-rule" data-backdrop="static">
                                        新建告警
                                    </button>
                                </div>
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


                                        <#list rules as rule>


                                            <tr>
                                                <td class="warn-list-table-td">
                                                    <!-- 告警条目开始 -->
                                                    <div class="card card-primary warn-list-table-card-no-margin">
                                                        <!-- 标题栏 -->
                                                        <a data-toggle="collapse" data-parent="#accordion"
                                                           href="#rid_${rule.id}">
                                                            <div class="card-header

                                                            <#if rule.level=='e'>
                                                                alert-danger
                                                                <#elseif rule.level=='w'>
                                                                alert-warning
                                                                <#elseif rule.level=='i'>
                                                                alert-secondary
                                                            </#if>
                                                                "
                                                                 style="border-radius: 4px">
                                                                <h4 class="card-title">
                                                                    ${rule.name}
                                                                </h4>

                                                            </div>
                                                        </a>

                                                        <!-- 告警主体 -->
                                                        <div id="rid_${rule.id}" class="panel-collapse collapse in">
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
                                                                                    规则状态:
                                                                                    &nbsp;
                                                                                    <#if rule.status=='e'>
                                                                                        <span class="badge badge-success"
                                                                                              style="height: 24px;line-height: 22px;
                                                      padding-top: 1px;padding-bottom: 1px;margin-top: 1px;margin-bottom: 1px">
                                                                                            已启用
                                                                                        </span>
                                                                                    <#elseif rule.status=="d">
                                                                                        <span class="badge badge-danger"
                                                                                              style="height: 24px;line-height: 22px;
                                                      padding-top: 1px;padding-bottom: 1px;margin-top: 1px;margin-bottom: 1px">
                                                                                        已禁用
                                                                                        </span>
                                                                                    <#elseif rule.status=="s">
                                                                                        <span class="badge badge-warning"
                                                                                              style="height: 24px;line-height: 22px;
                                                      padding-top: 1px;padding-bottom: 1px;margin-top: 1px;margin-bottom: 1px">
                                                                                        已抑制
                                                                                        </span>
                                                                                    </#if>
                                                                                </div>

                                                                                <div class="col-md-3">
                                                                                    告警等级:
                                                                                    &nbsp;

                                                                                    <#if rule.level=='e'>
                                                                                        <span class="badge badge-danger"
                                                                                              style="height: 24px;line-height: 22px;
                                                      padding-top: 1px;padding-bottom: 1px;margin-top: 1px;margin-bottom: 1px">ERROR
                                                                                        </span>
                                                                                    <#elseif rule.level=='w'>
                                                                                        <span class="badge badge-warning"
                                                                                              style="height: 24px;line-height: 22px;
                                                      padding-top: 1px;padding-bottom: 1px;margin-top: 1px;
                                                      margin-bottom: 1px">WARN
                                                                                        </span>
                                                                                    <#elseif rule.level=='i'>
                                                                                        <span class="badge badge-secondary"
                                                                                              style="height: 24px;line-height: 22px;
                                                      padding-top: 1px;padding-bottom: 1px;margin-top: 1px;
                                                      margin-bottom: 1px">INFO
                                                                                        </span>

                                                                                    </#if>
                                                                                </div>

                                                                                <div class="col-md-3">
                                                                                    告警规则ID:
                                                                                    &nbsp;
                                                                                    ${rule.id}
                                                                                </div>
                                                                            </div>
                                                                            <hr>

                                                                            <div class="row">
                                                                                <div class="col-md-6 float-left">
                                                                                    告警描述:
                                                                                </div>
                                                                                <div class="col-md-6 float-right">
                                                                                    告警触发条件:
                                                                                </div>
                                                                            </div>

                                                                            <div class="row">
                                                                                <div class="col-md-6 float-left"
                                                                                     style="margin-top: 10px">
                                                                                    ${rule.description}
                                                                                </div>
                                                                                <div class="col-md-6 float-right"
                                                                                     style="margin-top: 10px">
                                                                                    <#list rule.conditions as condition>
                                                                                        <div class="row-cols-6">
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
                                                                                            <#if condition.param=='p'>
                                                                                                ${(condition.data/100)?
                                                                                                string["#.#"]}
                                                                                            <#else>
                                                                                                ${condition.data}
                                                                                            </#if>

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
                                                                                                hPa
                                                                                            </#if>
                                                                                        </div>
                                                                                    </#list>
                                                                                </div>


                                                                            </div>

                                                                            <hr>

                                                                            <div class="row">
                                                                                <div class="col-md-12">
                                                                                    告警联系人:
                                                                                    <#list rule.contacts as contact>
                                                                                        <h5 style="display: inline">
                                                                                        <span class="badge">
                                                                                            ${contact.name}
                                                                                        </span>
                                                                                        </h5>
                                                                                    </#list>
                                                                                </div>
                                                                            </div>


                                                                            <hr>

                                                                            <div class="row">
                                                                                <div class="col-md-6">
                                                                                    规则添加时间:
                                                                                    <span>${rule.createTime?string
                                                                                        ('yyyy-MM-dd HH:mm:ss')}</span>
                                                                                </div>
                                                                                <div class="col-md-6">
                                                                                    最近触发时间:
                                                                                    <span>
                                                                                       <#if rule.lastTriggerTime??>
                                                                                           ${rule.lastTriggerTime?string('yyyy-MM-dd HH:mm:ss')}
                                                                                       </#if>
                                                                                    </span>
                                                                                </div>
                                                                            </div>

                                                                            <div class="row"
                                                                                 style="margin-top: 30px">
                                                                                <div class="col-12">

                                                                                    <div
                                                                                            class="btn-group col-md-1">
                                                                                        <button type="button"
                                                                                                class="btn btn-primary">
                                                                                            编辑告警
                                                                                        </button>
                                                                                    </div>

                                                                                    <div class="btn-group col-md-1">

                                                                                        <#if rule.status=='e'>
                                                                                            <a href="rules/dis/${rule
                                                                                            .id}"
                                                                                               class="btn btn-secondary">
                                                                                                禁用告警
                                                                                            </a>
                                                                                        <#elseif rule.status=='d'>
                                                                                            <a
                                                                                                    href="rules/ena/${rule
                                                                                                    .id}"
                                                                                                    class="btn btn-success">
                                                                                                启用告警
                                                                                            </a>
                                                                                        </#if>
                                                                                    </div>

                                                                                    <div class="btn-group float-right col-md-1">

                                                                                        <a href="rules/del/${rule
                                                                                        .id}" class="btn btn-danger">
                                                                                            删除告警
                                                                                        </a>
                                                                                        <!--                                                                                    <button type="button"-->
                                                                                        <!--                                                                                            class="btn btn-dark dropdown-toggle dropdown-icon"-->
                                                                                        <!--                                                                                            data-toggle="dropdown">-->
                                                                                        <!--                                                                                        <span class="sr-only">下拉切换</span>-->
                                                                                        <!--                                                                                        <div class="dropdown-menu"-->
                                                                                        <!--                                                                                             role="menu">-->
                                                                                        <!--                                                                                            <a class="dropdown-item"-->
                                                                                        <!--                                                                                               href="#">5分钟</a>-->
                                                                                        <!--                                                                                            <a class="dropdown-item"-->
                                                                                        <!--                                                                                               href="#">30分钟</a>-->
                                                                                        <!--                                                                                            <a class="dropdown-item"-->
                                                                                        <!--                                                                                               href="#">1小时</a>-->
                                                                                        <!--                                                                                            <a class="dropdown-item"-->
                                                                                        <!--                                                                                               href="#">3小时</a>-->
                                                                                        <!--                                                                                            <a class="dropdown-item"-->
                                                                                        <!--                                                                                               href="#">24小时</a>-->
                                                                                        <!--                                                                                            <div class="dropdown-divider"></div>-->
                                                                                        <!--                                                                                            <a class="dropdown-item"-->
                                                                                        <!--                                                                                               href="#">禁用告警</a>-->
                                                                                        <!--                                                                                        </div>-->
                                                                                        <!--                                                                                    </button>-->
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


                                        <tr>
                                            <td>
                                                <!-- 告警条目开始 -->
                                                <div class="card card-primary warn-list-table-card-no-margin">
                                                    <a data-toggle="collapse" data-parent="#accordion"
                                                       href="#collapseTwo">
                                                        <div class="card-header alert-warning">
                                                            <h4 class="card-title">
                                                                温度高于30摄氏度且湿度小于80%
                                                            </h4>
                                                            <span class="badge badge-pill float-right"
                                                                  style="height: 21px;line-height: 21px;
                                                      padding-top: 0;padding-bottom: 0">2分钟前
                                                </span>
                                                        </div>
                                                    </a>
                                                    <div id="collapseTwo" class="panel-collapse collapse in">
                                                        <div class="card-body">

                                                            <div class="row">
                                                                <div class="col-md-1">
                                                                    告警状态:
                                                                </div>
                                                                <div class="col-md-1">

                                                        <span class="badge badge-warning"
                                                              style="height: 24px;line-height: 22px;
                                                      padding-top: 1px;padding-bottom: 1px;margin-top: 1px;margin-bottom: 1px">已抑制 30 分钟
                                                        </span>
                                                                    <span class="badge badge-dark"
                                                                          style="height: 24px;line-height: 22px;
                                                      padding-top: 1px;padding-bottom: 1px;margin-top: 1px;margin-bottom: 1px">将于 18 分钟 后再次检查该告警
                                                        </span>

                                                                </div>
                                                            </div>

                                                            <br>

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
                                                                    天气太热,预防中暑
                                                                </div>
                                                                <div class="col-md-3 float-right"
                                                                     style="margin-top: 10px">
                                                                    <div class="row-cols-3">
                                                                        温度 > 30 ℃
                                                                    </div>
                                                                    <div class="row-cols-3">
                                                                        温度 > 30 ℃
                                                                    </div>
                                                                    <div class="row-cols-3">
                                                                        温度 > 30 ℃
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-3 float-right"
                                                                     style="margin-top: 10px">
                                                                    <div class="row-cols-3">
                                                                        温度 = 40 ℃
                                                                    </div>
                                                                    <div class="row-cols-3">
                                                                        湿度 = 100 %
                                                                    </div>
                                                                    <div class="row-cols-3">
                                                                        气压 = 1.02 ATM
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <br>

                                                            <div class="row">
                                                                <div class="col-md-6 float-left">
                                                                    开始时间:
                                                                    <span>2020-05-09 18:29:56</span>
                                                                </div>
                                                                <div class="col-md-6 float-right">
                                                                    恢复时间:
                                                                    <span>2020-05-09 20:50:11</span>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="row" style="margin-bottom: 10px; margin-left: 10px;
                                            margin-top: 10px">
                                                            <div class="col-12">

                                                                <div class="btn-group float-left">
                                                                    <button type="button" class="btn btn-warning">
                                                                        抑制告警15分钟
                                                                    </button>
                                                                    <button type="button"
                                                                            class="btn btn-warning dropdown-toggle dropdown-icon"
                                                                            data-toggle="dropdown">
                                                                        <span class="sr-only">下拉切换</span>
                                                                        <div class="dropdown-menu" role="menu">
                                                                            <a class="dropdown-item" href="#">5分钟</a>
                                                                            <a class="dropdown-item" href="#">30分钟</a>
                                                                            <a class="dropdown-item" href="#">1小时</a>
                                                                            <a class="dropdown-item" href="#">3小时</a>
                                                                            <a class="dropdown-item" href="#">24小时</a>
                                                                            <div class="dropdown-divider"></div>
                                                                            <a class="dropdown-item" href="#">禁用告警</a>
                                                                        </div>
                                                                    </button>
                                                                </div>

                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                                <!-- 告警条目结束 -->
                                            </td>
                                        </tr>
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

            <div class="modal fade" id="add-rule">
                <div class="modal-dialog modal-xl">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">新建告警规则</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"
                                    onclick="reset()">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <!-- 模态框主体 -->


                            <!-- 表单 -->
                            <form method="post" action="rules" id="add_rule_form">
                                <div class="form-group">

                                    <!-- 第一行 -->

                                    <!-- 告警名称 -->
                                    <div class="col-md-5 float-left" style="z-index: 1">
                                        <label class="col-form-label" for="warnName">告警名称</label>
                                        <input type="text" class="form-control is-valid" id="warnName" name="name"
                                               placeholder="请输入告警名称">
                                    </div>

                                    <!-- 告警等级 -->
                                    <div class="col-md-6 float-right">
                                        <label class="col-form-label" for="warnLevel">告警等级</label>
                                        <br>
                                        <div class="btn-group btn-group-toggle" data-toggle="buttons"
                                             id="warnLevel">
                                            <label class="btn btn-outline-secondary active">
                                                <input type="radio" name="level" id="infoOption" autocomplete="off"
                                                       checked value="i"> INFO
                                            </label>
                                            <label class="btn btn-outline-warning">
                                                <input type="radio" name="level" id="warnOption" autocomplete="off"
                                                       value="w">
                                                WARN
                                            </label>
                                            <label class="btn btn-outline-danger">
                                                <input type="radio" name="level" id="errorOption" autocomplete="off"
                                                       value="e">
                                                ERROR
                                            </label>
                                        </div>
                                    </div>


                                    <!-- /第一行 -->


                                    <!-- 第二行 -->

                                    <!-- 告警描述 -->
                                    <div class="col-md-5 float-left form-margin-top" style="z-index: 1">
                                        <!-- textarea -->
                                        <div class="form-group">
                                            <label for="warnDescription">告警描述</label>
                                            <textarea id="warnDescription" class="form-control" rows="3"
                                                      name="description"
                                                      placeholder="请输入告警描述"></textarea>
                                        </div>
                                    </div>

                                    <!-- 告警条件 -->
                                    <div class="col-md-6 float-right form-margin-top">
                                        <div class="form-group" id="form-group-condition">
                                            <label class="col-form-label" for="warnCondition">告警条件</label>
                                            <button type="button" class="btn btn-sm btn-outline-secondary float-right"
                                                    id="add-condition-btn">
                                                添加条件
                                            </button>

                                            <!-- 第一个条件 -->
                                            <div class="input-group" id="firstCondition">
                                                <div class="col-md-3">
                                                    <!-- 条件参数选择 -->
                                                    <select class="form-control select2ConditionParam"
                                                            id="warnCondition" name="param"
                                                            onchange="conditionParamOnChange(this)">
                                                        <option value="t">温度</option>
                                                        <option value="h">湿度</option>
                                                        <option value="p">气压</option>
                                                        <option value="l">亮度</option>
                                                    </select>
                                                </div>

                                                <!-- 参数范围滑块 -->
                                                <div class="col-md-7 float-left">
                                                    <input class="slider-temp" type="text" name="data">
                                                </div>

                                            </div>

                                        </div>
                                    </div>

                                    <!-- /第二行 -->


                                    <!-- 第三行 -->


                                    <div class="col-md-5 form-margin-top">
                                        <div class="form-group">

                                            <label class="col-form-label" for="warnContact">告警联系人</label>
                                            <select class="form-control select2bs4" multiple="multiple"
                                                    style="width: 100%;" id="warnContact" name="contact">
                                                <#if contacts??>
                                                    <#list contacts as contact>
                                                        <option value="${contact.id}">${contact.name}</option>
                                                    </#list>
                                                </#if>
                                            </select>

                                        </div>
                                    </div>


                                    <!-- /第三行 -->


                                </div>
                            </form>


                        </div>
                        <div class="modal-footer justify-content-between">
                            <div class="justify-content-start">
                                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="reset()">关闭
                                </button>
                            </div>
                            <div class="justify-content-end">
                                <button type="button" class="btn btn-danger" data-toggle="modal"
                                        data-target="#checkReset">重置
                                </button>
                                <button type="button" class="btn btn-primary" onclick="submit_form()">添加告警</button>
                            </div>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
            <!-- /.modal -->


            <!-- Modal -->
            <div class="modal fade" id="checkReset" tabindex="2" role="dialog" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <!--                            <h5 class="modal-title" id="exampleModalLabel"></h5>-->
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            重置后所有未保存的数据将丢失,请确认是否重置
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="reset()">重置
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.modal -->


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
<script src="https://cdn.bootcdn.net/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<!-- 解决使用 Bootstrap 提示工具与 jQuery UI 提示工具冲突 -->

<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- AdminLTE App -->
<script src="dist/js/adminlte.js"></script>

<!-- DataTables -->
<script src="plugins/datatables/jquery.dataTables.js"></script>
<script src="plugins/datatables-bs4/js/dataTables.bootstrap4.js"></script>

<!-- Ion 滑块 -->
<script src="plugins/ion-rangeslider/js/ion.rangeSlider.min.js"></script>
<!-- Bootstrap slider -->
<script src="plugins/bootstrap-slider/bootstrap-slider.min.js"></script>

<!-- Select2 -->
<script src="plugins/select2/js/select2.full.min.js"></script>


<!-- 页面脚本 -->
<script>

    // 添加表单的提交
    function submit_form() {
        $("#add_rule_form").submit()
    }


    let sliderTempSetting = {
        min: -20,
        max: 50,
        from: -20,
        to: 50,
        type: 'double',
        postfix: '℃',
        step: 1,
        prettify: false,
        hasGrid: true
    };

    let sliderHumiSetting = {
        min: 0,
        max: 100,
        from: 0,
        to: 100,
        type: 'double',
        postfix: '%',
        step: 1,
        prettify: false,
        hasGrid: true
    }


    let sliderPressSetting = {
        min: 900,
        max: 1200,
        from: 900,
        to: 1200,
        type: 'double',
        postfix: 'hPa',
        step: 10,
        prettify: false,
        hasGrid: true
    };

    let sliderLightSetting = {
        min: 0,
        max: 30000,
        from: 0,
        to: 30000,
        type: 'double',
        postfix: 'lux',
        step: 200,
        prettify: false,
        hasGrid: true
    };

    function addCondition() {
        let conditionDiv = $("#form-group-condition");
        let conditionHTML =
            '<!-- 条件 -->' +
            '<div class="input-group" style="margin-top: 3px">' +
            '<div class="col-md-3">' +
            '<!-- 条件参数选择 -->' +
            '<select class="form-control select2ConditionParam" onchange="conditionParamOnChange(this)" name="param">' +
            '<option value="t">温度</option>' +
            '<option value="h">湿度</option>' +
            '<option value="p">气压</option>' +
            '<option value="l">亮度</option>' +
            '</select>' +
            '</div>' +
            '<!-- 参数范围滑块 -->' +
            '<div class="col-md-7 float-left">' +
            '<input class="slider-temp"' +
            ' type="text" name="data">' +
            '</div>' +
            '<!-- 删除按钮 -->' +
            '<button type="button" class="btn btn-tool" style="margin-left: 15px"' +
            'data-card-widget="remove" onclick="removeCondition(this)">' +
            '<i class="fas fa-times"></i>' +
            '</button>' +
            '</div>';

        let andor =
            '<!-- 多个条件之间的逻辑关系 -->' +
            '<div class="input-group" style="margin-top: 1px">' +
            '<div class="col-md-2">' +
            '<!-- 条件参数选择 -->' +
            '<select class="form-control select2ConditionParam">' +
            '<option>and</option>' +
            '<option>or</option>' +
            '</select>' +
            '</div>' +
            '</div>';

        let removeBtn =
            '<button type="button" class="btn btn-tool"' +
            'style="margin-left: 15px"' +
            'data-card-widget="remove"' +
            'onclick="removeCondition(this)">' +
            '<i class="fas fa-times"></i>' +
            '</button>';

        // conditionDiv.append(andor);
        conditionDiv.append(conditionHTML);
        $('.slider-temp').ionRangeSlider(sliderTempSetting);
        $('.slider-humi').ionRangeSlider(sliderHumiSetting);
        $('.slider-press').ionRangeSlider(sliderPressSetting);
        $('.slider-light').ionRangeSlider(sliderLightSetting);

        // 应用select2的select元素
        $(".select2ConditionParam").select2({
            theme: 'bootstrap4',
            closeOnSelect: true,
            allowClear: false,
            minimumResultsForSearch: -1
        })


        // 若第一个条件的删除按钮是禁用的,则启用它,在告警条件不唯一的情况下
        // console.info($("#firstCondition").find("button").length)
        if ($("#firstCondition").find("button").length === 0) {
            $("#firstCondition").append(removeBtn)
        }
    }

    function removeCondition(obj) {
        let removeElement = $(obj.parentElement);

        // 删除的不是第一个条件
        if (removeElement.attr("id") !== "firstCondition") {
            // removeElement.prev().remove();
            removeElement.remove();
        }
        // 删除的是第一个条件
        else if (removeElement.attr("id") === "firstCondition") {
            // 设置新的第一条件的id
            removeElement.next().attr("id", "firstCondition");
            // 移除条件连接
            // removeElement.next().remove();
            // 移除条件
            removeElement.remove();
        }


        // 禁用新的第一条件的删除按钮,在告警仅剩一条时
        if ($("#form-group-condition").children().length <= 3)
            $("#firstCondition").find("button").remove()
    }

    function conditionParamOnChange(obj) {
        // 包含slider的div
        let sliderDivElement = $(obj.parentElement.parentElement).find(".col-md-7");
        // 删除按钮
        let selectionDiv = $(obj.parentElement);
        // 删除整个滑块
        sliderDivElement.remove();
        // 新滑块元素
        let newSliderDivElement = $(' <div class="col-md-7 float-left">' +
            '<input  type="text" name="data">' +
            '</div>')

        // 获取选择的value
        let selectedValue = $(obj).val();
        if (selectedValue === "t") {
            // 设置新滑块元素
            newSliderDivElement.children().attr("class", "slider-temp")
            // 在删除按钮前放置滑块元素
            selectionDiv.after(newSliderDivElement);
            // 应用滑块
            newSliderDivElement.children().ionRangeSlider(sliderTempSetting)
        } else if (selectedValue === "h") {
            newSliderDivElement.children().attr("class", "slider-humi")
            selectionDiv.after(newSliderDivElement);
            newSliderDivElement.children().ionRangeSlider(sliderHumiSetting)
        } else if (selectedValue === "p") {
            newSliderDivElement.children().attr("class", "slider-press")
            selectionDiv.after(newSliderDivElement);
            newSliderDivElement.children().ionRangeSlider(sliderPressSetting)
        } else if (selectedValue === "l") {
            newSliderDivElement.children().attr("class", "slider-light")
            selectionDiv.after(newSliderDivElement);
            newSliderDivElement.children().ionRangeSlider(sliderLightSetting)
        }
    }

    function reset(obj) {
        // 清除告警名称
        $("#warnName").val("");

        // 清除告警级别
        $("#infoOption").attr("checked", true).parent().addClass("active")
        $("#warnOption").attr("checked", false).parent().removeClass("active");
        $("#errorOoption").attr("checked", false).parent().removeClass("active");

        // 清除告警描述
        $("#warnDescription").val("");

        // 清除告警条件
        // 移除除了第一条件的所以条件
        $("#firstCondition").nextAll().remove();
        // 重置第一条件的条件参数和滑块
        $("#warnCondition").empty();
        let options =
            '<option value="t">温度</option>' +
            '<option value="h">湿度</option>' +
            '<option value="p">气压</option>' +
            '<option value="l">亮度</option>';
        $("#warnCondition").append(options);
        conditionParamOnChange(document.getElementById("warnCondition"));
        // 禁用第一条件的删除按钮
        $("#firstCondition").find("button").remove();


        // 清除联系人列表
        $(".select2-results__option").attr("aria-selected", "false");
        $(".select2bs4").val("")
        $("span.select2-selection__clear").remove();
        $(".select2-selection__rendered").find(".select2-selection__choice").remove();
    }

    $(function () {


        //初始化 Select2 元素
        $('.select2bs4').select2({
            theme: 'bootstrap4',
            closeOnSelect: false,
            allowClear: false,
        })
        $(".select2ConditionParam").select2({
            theme: 'bootstrap4',
            closeOnSelect: true,
            allowClear: false,
            minimumResultsForSearch: -1
        })

        $("#add-condition-btn").click(addCondition);


        $('.slider-temp').ionRangeSlider(sliderTempSetting);
        $('.slider-humi').ionRangeSlider(sliderHumiSetting);
        $('.slider-press').ionRangeSlider(sliderPressSetting);
        $('.slider-light').ionRangeSlider(sliderLightSetting);


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
