<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<c:set scope="page" var="contextPath" value="${pageContext.request.contextPath}"/>
<div class="col-md-3 left_col">
    <div class="left_col scroll-view">
        <div class="navbar nav_title" style="border: 0;">
            <a href="#" class="site_title">
                <img src="${contextPath}/images/OEB_LOGO.png" style="width:50px;margin-right:5px;" alt="...">
                <span>Order Eat Bill</span>
            </a>
        </div>
        <div class="clearfix"></div>
        <!-- menu profile quick info -->
        <div class="profile clearfix">
            <div class="profile_pic">
                <img src="${contextPath}/images/img.png" alt="..." class="img-circle profile_img">
            </div>
            <div class="profile_info">
                <span>ยินดีต้อนรับ,</span>
                <h2 style="white-space:nowrap;overflow:hidden;text-overflow: ellipsis;">${branchUser.username}</h2>
            </div>
        </div>
        <!-- /menu profile quick info -->
        <br/>
        <!-- sidebar menu -->
        <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
            <div class="menu_section">
                <ul class="nav side-menu">
                    <li>
                        <a id="emptab"><i class="fa fa-users"></i> จัดการพนักงาน <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <li><a id="empdata" href="${contextPath}/employee/index">ข้อมูลพนักงาน</a></li>
                            <li><a id="emppos" href="${contextPath}/employee/position">ตำแหน่งพนักงาน</a></li>
                            <li><a id="emptable" href="${contextPath}/employee/table">ตารางการทำงาน</a></li>
                            <li><a id="workhist" href="${contextPath}/employee/workhistory">ประวัติการทำงาน</a></li>
                            <li><a id="emppaid" href="${contextPath}/employee/pay">จ่ายเงินพนักงาน</a></li>
                            <li><a id="empcheck" href="${contextPath}/employee/check">เช็คชื่อพนักงาน</a></li>
                        </ul>
                    </li>
                    <li>
                        <a id="menutab"><i class="fa fa-cutlery"></i> จัดการเมนูอาหาร <span
                                class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <li><a id="menucategory" href="${contextPath}/menu/menucategory">ประเภทอาหาร</a></li>
                            <li><a id="menugroup" href="${contextPath}/menu/menugroup">หมวดหมู่เมนูอาหาร</a></li>
                            <li><a id="menu" href="${contextPath}/menu/menu">เมนูอาหารแบบเดี่ยว</a></li>
                            <li><a id="menuset" href="${contextPath}/menu/menuset">เมนูอาหารแบบชุด</a></li>
                        </ul>
                    </li>
                    <li>
                        <a><i class="fa fa-tags"></i> จัดการโปรโมชั่น <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <li><a id="promotion" href="${contextPath}/promotion/promotion">โปรโมชั่นเมนูอาหาร</a></li>
                        </ul>
                    </li>
                    <li>
                        <a><i class="fa fa-spoon"></i> จัดการวัตถุดิบอาหาร <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <li><a id="materialcategory" href="${contextPath}/stock/materialcategory">ประเภทวัตถุดิบ</a></li>
                            <li><a id="materialunit" href="${contextPath}/stock/materialunit">หน่วยของวัตถุดิบ</a></li>
                            <li><a id="material" href="${contextPath}/stock/materialitem">วัตถุดิบ</a></li>
                            <li><a id="mixedproduct" href="${contextPath}/stock/mixedproduct">วัตถุดิบแบบผสม</a></li>
                            <li><a id="stockmanage" href="${contextPath}/stock/stockmanage">เพิ่ม / ลดวัตถุดิบ</a></li>
                            <li><a id="menustock" href="${contextPath}/stock/menumaterial">วัตถุดิบในเมนูอาหาร</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <!-- /sidebar menu -->
        <!-- /menu footer buttons -->
        <div class="sidebar-footer hidden-small">
            <%--<a data-toggle="tooltip" data-placement="top" title="Settings">--%>
            <%--<span class="glyphicon glyphicon-cog" aria-hidden="true"></span>--%>
            <%--</a>--%>
            <a data-toggle="tooltip" data-placement="top" title="ออกจากระบบ" href="${contextPath}/system/logout">
                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
            </a>
        </div>
        <!-- /menu footer buttons -->
    </div>
</div>

<!-- top navigation -->
<div class="top_nav">
    <div class="nav_menu">
        <nav>
            <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
            </div>
            <ul class="nav navbar-nav navbar-right">
                <li class="">
                    <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown"
                       aria-expanded="false">
                        <img src="${contextPath}/images/img.png" alt=""> ${branchUser.username}
                        <span class=" fa fa-angle-down"></span>
                    </a>
                    <ul class="dropdown-menu dropdown-usermenu pull-right">
                        <%--<li><a href="javascript:;"> Profile</a></li>--%>
                        <%--<li>--%>
                        <%--<a href="javascript:;">--%>
                        <%--<span class="badge bg-red pull-right">50%</span>--%>
                        <%--<span>Settings</span>--%>
                        <%--</a>--%>
                        <%--</li>--%>
                        <%--<li><a href="javascript:;">Help</a></li>--%>
                        <li><a href="${contextPath}/system/logout">
                            <i class="fa fa-sign-out pull-right"></i>ออกจากระบบ</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </nav>
    </div>
</div>
<!-- /top navigation -->