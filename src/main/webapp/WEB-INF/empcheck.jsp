<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="include/topenv.jsp"/>
    <title>เช็คชื่อพนักงาน</title>
</head>
<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <jsp:include page="include/navbar.jsp"/>
        <!-- page content -->
        <div class="right_col" role="main">
            <div class="">
                <div class="page-title">
                    <div class="title_right">
                        <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h4>เช็คเวลาเข้าทำงานวันนี้</h4>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <table id="datatable_check" class="table table-striped table-bordered">
                                    <thead>
                                    <tr>
                                        <th class="table-rows">ชื่อ</th>
                                        <th class="table-rows">ตำแหน่งงาน</th>
                                        <th class="table-rows">ระยะเวลาทำงาน</th>
                                        <th class="table-rows">สถานะเข้างาน</th>
                                        <th class="table-rows">ตัวเลือก</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${employeeTables}" var="et">
                                        <tr>
                                            <td style="text-align:center;">${et.employee.empName}</td>
                                            <td style="text-align:center;">${et.employeePosition.empPosName}</td>
                                            <fmt:formatDate value="${et.timeStart}" var="timeStartOrder"
                                                            pattern="HHmm"/>
                                            <td style="text-align:center;" data-value="${timeStartOrder}">
                                                <fmt:formatDate value="${et.timeStart}" pattern="HH.mm"/> น. -
                                                <fmt:formatDate value="${et.timeEnd}" pattern="HH.mm"/> น.
                                            </td>
                                            <td style="text-align:center;">
                                                <c:if test="${et.workHistory.workStart != null}">
                                                    <i class="fa fa-sign-in"></i>&nbsp; เข้างาน : <fmt:formatDate
                                                        value="${et.workHistory.workStart}" pattern="HH.mm"/> น.
                                                </c:if>
                                                <c:if test="${et.workHistory.workEnd != null}">
                                                    <br>
                                                    <i class="fa fa-sign-out"></i>&nbsp; ออกงาน : <fmt:formatDate
                                                        value="${et.workHistory.workEnd}" pattern="HH.mm"/> น.
                                                </c:if>
                                            </td>
                                            <td style="text-align:center;">
                                                <c:choose>
                                                    <c:when test="${et.workHistory.workEnd != null}">
                                                        ทำงานเรียบร้อยแล้ว
                                                    </c:when>
                                                    <c:when test="${et.workHistory.workStart != null}">
                                                        <a href="${contextPath}/employee/clockout?workHistNo=${et.workHistory.workHistNo}">
                                                            <button type="button" class="btn btn-warning btn-sm">
                                                                <i class="fa fa-sign-out"></i>&nbsp; ออกงาน
                                                            </button>
                                                        </a>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <a href="${contextPath}/employee/clockin?empNo=${et.employee.empNo}&empTimeNo=${et.empTimeNo}">
                                                            <button type="button" class="btn btn-primary btn-sm">
                                                                <i class="fa fa-sign-in"></i>&nbsp; เข้างาน
                                                            </button>
                                                        </a>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="include/bottomenv.jsp"/>
</body>
<script>
    $(document).ready(function () {
        $("#datatable_check").DataTable({
            "order": [[2, "asc"]],
            "columnDefs": [
                {
                    orderable: false, targets: [-1]
                }
            ]
        });
    });
</script>
</html>