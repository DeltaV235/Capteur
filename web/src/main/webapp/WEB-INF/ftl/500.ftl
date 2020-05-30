<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">

    <#include "common-head.ftl">

    <title>Capteur | 被玩坏啦</title>

    <#assign page="index">

</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

    <#include "common-navbar.ftl">

    <#include "common-sidebar.ftl">


    <!-- Content Wrapper. 包含页面内容 -->
    <div class="content-wrapper">
        <!-- 内容标题（页面标题） -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <!-- 主体内容 -->
        <section class="content">
            <div class="error-page">
                <h2 class="headline text-danger">500</h2>

                <br>
                <div class="error-content">
                    <h3><i class="fas fa-exclamation-triangle text-danger"></i> 不..不行！ 会坏掉的..</h3>
                    <p>
                        我们不会马上解决这个问题。
                        你可以<a href="./">返回首页</a>，
                        或者关闭浏览器。
                    </p>
                </div>
            </div>
            <!-- /.error-page -->

        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- 控制侧边栏内容在这里 -->
    </aside>
    <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<#include "common-tail.ftl">


</body>
</html>
