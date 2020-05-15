<!-- 主侧边栏容器 -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- 品牌 Logo -->
    <a href="/" class="brand-link">
        <img src="dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
             style="opacity: .8">
        <span class="brand-text font-weight-light">Capteur</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">

        <!-- 侧边栏菜单 -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu"
                data-accordion="false">
                <!-- 使用 .nav-icon 类添加图标，
                     或使用 font-awesome 或其他任何图标字体库 -->
                <li class="nav-item ">
                    <a href="./" class="nav-link <#if page=="index">active</#if>">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>
                            主页
                            <i class="right fas"></i>
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="data" class="nav-link <#if page=="data">active</#if>">
                        <i class="nav-icon fas fa-th"></i>
                        <p>
                            数据表格
                        </p>
                    </a>
                </li>
                <li class="nav-item has-treeview <#if page=="warnings" || page=="rules"
                || page=="contact">menu-open</#if>">
                    <a href="javascript:void(0);" class="nav-link <#if page=="warnings" || page=="rules"
                    || page=="contact">active</#if>">
                        <i class="nav-icon fas fa-exclamation-triangle"></i>
                        <p>
                            告警策略
                            <i class="fas fa-angle-left right"></i>
                            <span class="badge badge-info right">6</span>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="warnings" class="nav-link <#if page=="warnings">active</#if>">
                                <i class="far fa-circle nav-icon"></i>
                                <p>告警列表</p>
                                <span class="badge badge-info right">6</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="rules" class="nav-link <#if page=="rules">active</#if>">
                                <i class="far fa-circle nav-icon"></i>
                                <p>告警规则</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="contact" class="nav-link <#if page=="contact">active</#if>">
                                <i class="far fa-circle nav-icon"></i>
                                <p>告警联系人</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item has-treeview">
                    <a href="setting.html" class="nav-link">
                        <i class="nav-icon fas fa-tools"></i>
                        <p>
                            设置
                            <i class="right fas"></i>
                        </p>
                    </a>
                </li>


            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>