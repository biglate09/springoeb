<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="com.springoeb.branch.model.Branch" %>
<%@ page import="com.springoeb.system.model.Role" %>
<c:set scope="page" var="contextPath" value="${pageContext.request.contextPath}"/>
<div class="col-md-3 left_col">
    <div class="left_col scroll-view">
        <div class="navbar" style="border: 0;">
            <a href="#">
                <img src="${contextPath}/images/OEB_LOGO.png" style="width:70%;margin-left:17%;margin-top:15%" alt="...">
            </a>
        </div>
        <div class="clearfix"></div>
        <!-- /menu profile quick info -->
        <br/>
        <!-- sidebar menu -->
        <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
            <div class="menu_section">
                <ul class="nav side-menu">
                    <c:if test="${branchUser.roleNo == Role.MANAGER || branchUser.roleNo == Role.EMPLOYEE}">
                        <li>
                            <a id="emptab"><i class="fa fa-users"></i> จัดการพนักงาน <span
                                    class="fa fa-chevron-down"></span></a>
                            <ul class="nav child_menu">
                                <c:if test="${branchUser.roleNo == Role.MANAGER}">
                                    <li><a id="empdata" href="${contextPath}/employee/index">ข้อมูลพนักงาน</a></li>
                                </c:if>
                                <c:if test="${branchUser.roleNo == Role.MANAGER}">
                                    <li><a id="emppos" href="${contextPath}/employee/position">ตำแหน่งพนักงาน</a></li>
                                </c:if>
                                <li><a id="emptable" href="${contextPath}/employee/table">ตารางการทำงาน</a></li>
                                <c:if test="${branchUser.roleNo == Role.MANAGER}">
                                    <li><a id="workhist" href="${contextPath}/employee/workhistory">ประวัติการทำงาน</a>
                                    </li>
                                </c:if>
                                <li><a id="emppaid" href="${contextPath}/employee/pay">${branchUser.roleNo == Role.EMPLOYEE ? 'ประวัติการทำงาน' : 'จ่ายเงินพนักงาน'}</a></li>
                                <li><a id="empcheck" href="${contextPath}/employee/check">เช็คชื่อพนักงาน</a></li>
                            </ul>
                        </li>
                    </c:if>
                    <c:if test="${branchUser.roleNo == Role.MANAGER}">
                        <li>
                            <a id="menutab"><i class="fa fa-cutlery"></i> จัดการเมนูอาหาร <span
                                    class="fa fa-chevron-down"></span></a>
                            <ul class="nav child_menu">
                                <li>
                                    <a>ประเภทอาหาร<span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu">
                                        <li class="sub_menu"><a id="menucategory"
                                                                href="${contextPath}/menu/menucategory">ประเภท</a>
                                        </li>
                                        <li class="sub_menu"><a id="menugroup"
                                                                href="${contextPath}/menu/menugroup">หมวดหมู่</a></li>
                                    </ul>
                                </li>
                                <li><a id="menu" href="${contextPath}/menu/menu">เมนูอาหารแบบเดี่ยว</a></li>
                                <li><a id="menuset" href="${contextPath}/menu/menuset">เมนูอาหารแบบชุด</a></li>
                            </ul>
                        </li>
                    </c:if>
                    <c:if test="${branchUser.roleNo == Role.MANAGER || branchUser.roleNo == Role.EMPLOYEE}">
                        <li>
                            <a><i class="fa fa-spoon"></i> จัดการวัตถุดิบอาหาร <span class="fa fa-chevron-down"></span></a>
                            <ul class="nav child_menu">
                                <c:if test="${branchUser.roleNo == Role.MANAGER}">
                                    <li><a id="materialcategory" href="${contextPath}/stock/materialcategory">ประเภทวัตถุดิบ</a>
                                    </li>
                                    <li><a id="materialunit"
                                           href="${contextPath}/stock/materialunit">หน่วยของวัตถุดิบ</a>
                                    </li>
                                    <li><a id="material" href="${contextPath}/stock/materialitem">วัตถุดิบ</a></li>
                                    <li><a id="mixedproduct" href="${contextPath}/stock/mixedproduct">วัตถุดิบแบบผสม</a>
                                    </li>
                                </c:if>
                                <li><a id="currentstock" href="${contextPath}/stock/stockremain">วัตถุดิบคงเหลือ</a>
                                </li>
                            </ul>
                        </li>
                    </c:if>
                    <c:if test="${branchUser.roleNo == Role.MANAGER}">
                        <li>
                            <a id="promotion" href="${contextPath}/promotion/promotion"><i class="fa fa-tags"></i> จัดการโปรโมชั่น</a>
                        </li>
                    </c:if>
                    <c:if test="${branchUser.roleNo == Role.MANAGER}">
                        <li>
                            <a><i class="fa fa-table"></i> จัดการโต๊ะและการจอง <span class="fa fa-chevron-down"></span></a>
                            <ul class="nav child_menu">
                                <li><a id="table" href="${contextPath}/table/table">โต๊ะ</a></li>
                                <li><a id="reserv" href="${contextPath}/table/reservation">การจอง</a></li>
                            </ul>
                        </li>
                    </c:if>

                    <c:if test="${branchUser.roleNo == Role.MANAGER}">
                        <li>
                            <a><i class="fa fa-home"></i> จัดการสาขา <span
                                    class="fa fa-chevron-down"></span></a>
                            <ul class="nav child_menu">
                                <c:if test="${branchUser.branchNo == branchUser.branch.mainBranchNo}">
                                    <li><a id="branches" href="${contextPath}/branch/branches">สาขาทั้งหมด</a></li>
                                </c:if>
                                <li><a id="mybranch"
                                       href="${contextPath}/branch/mybranch">สาขา${branchUser.branch.branchName}</a>
                                </li>
                                <li><a id="member" href="${contextPath}/branch/member">สมาชิกของสาขา</a></li>
                            </ul>
                        </li>
                    </c:if>
                    <c:if test="${branchUser.roleNo == Role.MANAGER}">
                        <li>
                            <a><i class="fa fa-book"></i> จัดการบัญชี <span class="fa fa-chevron-down"></span></a>
                            <ul class="nav child_menu">
                                <li><a id="ledgertype" href="${contextPath}/ledger/ledgertype">ประเภทบัญชี</a></li>
                                <li><a id="ledger" href="${contextPath}/ledger/ledger">บัญชี</a></li>
                            </ul>
                        </li>
                    </c:if>
                    <c:if test="${branchUser.roleNo == Role.MANAGER}">
                        <li>
                            <a><i class="fa fa-line-chart"></i> รายงาน <span class="fa fa-chevron-down"></span></a>
                            <ul class="nav child_menu">
                                <li><a id="menureport" href="${contextPath}/report/menureport">เมนูอาหาร</a></li>
                                <li>
                                    <a>รายรับ/รายจ่าย <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu">
                                        <li class="sub_menu"><a id="totalincome" href="${contextPath}/report/totalincome">ทั้งหมด</a></li>
                                        <li class="sub_menu"><a id="emppayreport" href="${contextPath}/report/emppayreport">ค่าจ้างพนักงาน</a></li>
                                        <li class="sub_menu"><a id="billreport" href="${contextPath}/report/billreport">ผลประกอบการ</a></li>
                                        <%--<li class="sub_menu"><a id="other" href="${contextPath}/report/other">อื่นๆ</a></li>--%>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                    </c:if>
                    <c:if test="${branchUser.roleNo == Role.MANAGER || branchUser.roleNo == Role.KITCHEN}">
                        <li>
                            <a><i class="fa fa-tasks"></i> ระบบหลังครัว<span class="fa fa-chevron-down"></span></a>
                            <ul class="nav child_menu">
                                <li><a id="kitchen" href="${contextPath}/kitchen/kitchen">พนักงานครัว</a></li>
                                <li><a id="chefmonitor" href="${contextPath}/kitchen/chefmonitor">พ่อครัว</a></li>
                            </ul>
                        </li>
                    </c:if>
                    <c:if test="${branchUser.roleNo == Role.MANAGER || branchUser.roleNo == Role.CASHIER}">
                        <li>
                            <a><i class="fa fa-money"></i> ระบบแคชเชียร์ <span class="fa fa-chevron-down"></span></a>
                            <ul class="nav child_menu">
                                <li><a id="cashier" href="${contextPath}/cashier/cashier">แคชเชียร์</a></li>
                                <li><a id="billpage" href="${contextPath}/cashier/billpage">ประวัติใบเสร็จ</a></li>
                        </ul>
                        </li>
                    </c:if>
                    <li>
                        <a href="${contextPath}/system/dummyorder"><i class="fa fa-american-sign-language-interpreting"></i> Dummy สั่งอาหาร </a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- /sidebar menu -->
        <!-- /menu footer buttons -->
        <div class="sidebar-footer hidden-small">
            <a data-toggle="tooltip" data-placement="top" title="ออกจากระบบ" href="${contextPath}/system/logout">
                <span class="glyphicon glyphicon-off" aria-hidden="true" style="color:white"></span>
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
                <a id="menu_toggle"><i class="fa fa-bars"  style="color:white"></i></a>
            </div>
            <ul class="nav navbar-nav navbar-right">
                <li class="">
                    <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown"
                       aria-expanded="false">
                        <img src="${contextPath}/images/img.png" alt=""> <span style="color:white">ยินดีต้อนรับ, ${branchUser.role.roleName} ของสาขา${branchUser.branch.branchName} (สาขาที่ ${branchUser.branch.branchIndex})</span>
                         <span class=" fa fa-angle-down" style="color:white"></span>
                    </a>
                    <ul class="dropdown-menu dropdown-usermenu pull-right">
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