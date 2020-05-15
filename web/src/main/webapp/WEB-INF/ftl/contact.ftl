<!DOCTYPE html>
<html>
<head>
    <title>Capteur | 联系人列表</title>

    <#include "common-head.ftl">

    <#assign page="contact">

    <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="plugins/datatables-bs4/css/dataTables.bootstrap4.css">

    <!-- 自定义CSS -->
    <link rel="stylesheet" href="dist/css/user/user.css">

    <!-- SweetAlert2 -->
    <link rel="stylesheet" href="plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css">
    <!-- Toastr -->
    <link rel="stylesheet" href="plugins/toastr/toastr.min.css">


    <!-- Select2 -->
    <link rel="stylesheet" href="plugins/select2/css/select2.min.css">
    <link rel="stylesheet" href="plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">

    <!-- iCheck for checkboxes and radio inputs -->
    <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">


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
                        <h1 class="m-0 text-dark">告警联系人</h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">主页</a></li>
                            <li class="breadcrumb-item active">告警联系人</li>
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

                                <div class="col-md-2">
                                    <button type="button" style="width: 110px !important;"
                                            class="btn btn-default btn-block col-md-10"
                                            data-toggle="modal" data-target="#add-contact" data-backdrop="static">
                                        新建联系人
                                    </button>
                                </div>
                                <!--                                <h3 class="card-title">最近告警</h3>-->
                            </div>
                            <!-- /.card-header -->


                            <!-- /.card-header -->
                            <div class="card-body">
                                <table id="contactTable" class="table table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th width="15px">
                                            <div class="icheck-dark d-inline">
                                                <input type="checkbox" id="checkboxPrimary1">
                                                <label for="checkboxPrimary1">
                                                </label>
                                            </div>
                                        </th>
                                        <th width="15px">#</th>
                                        <th width="100px">联系人姓名</th>
                                        <th>手机号</th>
                                        <th>邮箱</th>
                                        <th width="110px">编辑</th>
                                        <th width="110px">删除</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <#--                                        <td>-->
                                        <#--                                                                                <div class="icheck-dark d-inline">-->
                                        <#--                                                                                    <input type="checkbox" id="checkboxPrimary2">-->
                                        <#--                                                                                    <label for="checkboxPrimary2">-->
                                        <#--                                                                                    </label>-->
                                        <#--                                                                                </div>-->
                                        <#--                                        </td>-->
                                        <#--                                        <td>1</td>-->
                                        <#--                                        <td>-->
                                        <#--                                            孙一凯-->
                                        <#--                                        </td>-->
                                        <#--                                        <td>13816862974</td>-->
                                        <#--                                        <td>sunyk@boss.com</td>-->
                                        <#--                                        <td>-->

                                        <#--                                            <button class="btn btn-secondary">-->
                                        <#--                                                编辑联系人-->
                                        <#--                                            </button>-->
                                        <#--                                        </td>-->
                                        <#--                                        <td>-->
                                        <#--                                            <button class="btn btn-danger" data-toggle="modal"-->
                                        <#--                                                    data-target="#checkDel">-->
                                        <#--                                                删除联系人-->
                                        <#--                                            </button>-->
                                        <#--                                        </td>-->
                                        <#--                                    </tr>-->
                                        <#--                                    <tr>-->
                                        <#--                                        <td>-->
                                        <#--                                            <div class="icheck-dark d-inline">-->
                                        <#--                                                <input type="checkbox" id="checkboxPrimary3">-->
                                        <#--                                                <label for="checkboxPrimary3">-->
                                        <#--                                                </label>-->
                                        <#--                                            </div>-->
                                        <#--                                        </td>-->
                                        <#--                                        <td>2</td>-->
                                        <#--                                        <td>冯纲</td>-->
                                        <#--                                        <td>13801851255</td>-->
                                        <#--                                        <td>fenggang@boss.com</td>-->
                                        <#--                                        <td>-->

                                        <#--                                            <button class="btn btn-secondary">-->
                                        <#--                                                编辑联系人-->
                                        <#--                                            </button>-->
                                        <#--                                        </td>-->
                                        <#--                                        <td>-->
                                        <#--                                            <button class="btn btn-danger" data-toggle="modal"-->
                                        <#--                                                    data-target="#checkDel">-->
                                        <#--                                                删除联系人-->
                                        <#--                                            </button>-->
                                        <#--                                        </td>-->
                                        <#--                                    </tr>-->
                                    </tbody>

                                </table>
                            </div>


                        </div>
                        <!-- /.card-body -->

                    </div>
                    <!-- /.card -->

                </div>
                <!-- /.col -->

            </div><!-- /.container-fluid -->

            <div class="modal fade" id="add-contact">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">新建告警联系人</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"
                                    onclick="reset()">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <!-- 模态框主体 -->


                            <!-- 表单 -->
                            <form id="contactForm" method="post" action="contacts">
                                <div class="form-group">

                                    <!-- 第一行 -->

                                    <!-- 联系人姓名 -->
                                    <div class="col-md-12">
                                        <label class="col-form-label" for="contactName">联系人姓名</label>
                                        <input type="text" class="form-control is-valid" id="contactName"
                                               placeholder="请输入联系人姓名" name="contactName">
                                    </div>


                                    <!-- /第一行 -->


                                    <!-- 第二行 -->

                                    <div class="col-md-12">
                                        <label class="col-form-label" for="contactPhone">联系人手机号</label>
                                        <input type="text" class="form-control is-valid" id="contactPhone"
                                               placeholder="请输入联系人手机号" name="contactPhone">
                                    </div>


                                    <!-- /第二行 -->


                                    <!-- 第三行 -->


                                    <div class="col-md-12">
                                        <label class="col-form-label" for="contactEmail">联系人邮箱</label>
                                        <input type="text" class="form-control is-valid" id="contactEmail"
                                               placeholder="请输入联系人邮箱" name="contactEmail">
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
                                <button type="button" class="btn btn-primary" onclick="submitForm()">保存修改</button>
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


            <!-- Modal -->
            <div class="modal fade" id="checkDel" tabindex="2" role="dialog" aria-labelledby="exampleModalLabel"
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
                            是否删除该联系人
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="">删除
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
<script src="plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- 解决使用 Bootstrap 提示工具与 jQuery UI 提示工具冲突 -->

<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- AdminLTE App -->
<script src="dist/js/adminlte.js"></script>

<!-- DataTables -->
<script src="plugins/datatables/jquery.dataTables.js"></script>
<script src="plugins/datatables-bs4/js/dataTables.bootstrap4.js"></script>


<!-- Select2 -->
<script src="plugins/select2/js/select2.full.min.js"></script>


<!-- 页面脚本 -->
<script>

    function submitForm() {
        $("#contactForm").submit();
    }


    function reset(obj) {

        $("#contactName").val("");
        $("#contactPhone").val("");
        $("#contactEmail").val("");


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


        var col1 = "<div class=\"icheck-dark d-inline\">\n" +
            "<input type=\"checkbox\" id=\"checkboxPrimary2\">\n" +
            "<label for=\"checkboxPrimary2\">\n" +
            "</label>\n" +
            "</div>"

        $('#contactTable').DataTable({
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
            // 翻页功能
            "paging": true,
            // 改变每页显示数据的数量
            "lengthChange": true,
            // 搜索功能
            "searching": true,
            // 排序功能
            "ordering": true,
            // 页脚信息
            "info": true,
            // 自动宽度
            "autoWidth": false,
            // 保存状态
            "stateSave": true,
            // 显示处理中的提示
            "processing": true,
            // 服务端处理数据
            "serverSide": true,
            "ajax": {
                url: "contactTable",
                type: "post"
            },
            // 以序号作为默认排序的列,升序排列
            "columns": [
                {
                    "data": null,
                    "render": function (row, type, val, meta) {
                        return "<div class=\"icheck-dark d-inline\">" +
                            "<input type=\"checkbox\" id=\"checkboxPrimary2\">" +
                            "<label for=\"checkboxPrimary2\">" +
                            "</label>" +
                            "</div>"
                    },
                    "targets": 0,
                    "orderable": false
                },
                {
                    "data": null,
                    "render": function (data, type, row, meta) {
                        return meta.row + 1 + meta.settings._iDisplayStart;
                    },
                    "orderable": true
                },
                {
                    "data": "name",
                    "orderable": true
                },
                {
                    "data": "phone",
                    "orderable": true
                },
                {
                    "data": "email",
                    "orderable": true
                },
                {
                    "data": null,
                    "render": function (row, type, val, meta) {
                        return '<button class="btn btn-secondary">' +
                            '编辑联系人' +
                            '</button>'
                    },
                    "orderable": false
                },
                {
                    "data": null,
                    "render": function (row, type, val, meta) {
                        return '<button class="btn btn-danger" data-toggle="modal"' +
                            'data-target="#checkDel">' +
                            '删除联系人' +
                            '</button>'
                    },
                    "orderable": false
                },
            ],
            "order": [[1, 'asc']]

        })
        ;
    })
</script>

</body>
</html>
