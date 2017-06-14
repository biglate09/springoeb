<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="include/topenv.jsp"/>
    <title>ประวัติการทำงาน</title>
</head>
<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <!-- page content -->
        <div class="container">
            <jsp:include page="include/navbar.jsp"/>
            <div class="right_col" role="main">
                <div class="page-title">
                    <div class="title_right">
                        <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h4>ประวัติการทำงาน</h4>
                                <!-- <button type="submit" class="btn btn-success" data-toggle="modal" data-target="#addEmp">เพิ่มพนักงาน</button> -->
                            </div>
                            <div class="x_content">
                                <form class="form-horizontal" action="FilterWorkByDateServlet" method="POST">
                                    <fieldset>
                                        <div class="control-group show-grid">
                                            <p id="text-before-calendar">เลือกวันที่ต้องการแสดง</p>
                                            <div class="controls">
                                                <div class="input-prepend input-group col-md-6 col-md-offset-4">
                                                                <span class="add-on input-group-addon">
                                                                    <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
                                                                </span>
                                                    <input type="text" name="date" id="reservation"
                                                           class="form-control datepicker" value="${daterange}"/>
                                                    <button type="submit" class="btn btn-default">
                                                        <span class="glyphicon glyphicon-search"></span> ค้นหา
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                </form>
                            </div>
                            <table id="datatable" class="table table-striped table-bordered">
                                <thead>
                                <tr>
                                    <th>วัน/เดือน/ปี</th>
                                    <th>ชื่อ</th>
                                    <th>เวลาเข้างาน</th>
                                    <th>เวลาออกงาน</th>
                                    <th>ชั่วโมงงาน</th>
                                    <th>ค่าจ้างวันนี้</th>

                                </tr>
                                </thead>

                                <tbody>
                                <c:forEach items="${workHistories}" var="wh">
                                    <tr>
                                        <td>
                                            <fmt:formatDate pattern="dd/MM/yyyy" value="${wh.work_start}"/>
                                        </td>
                                        <td style="text-align:center;">
                                                ${wh.empName}
                                        </td>
                                        <td>
                                            <fmt:formatNumber type="number" pattern="00.00"
                                                              value="${Math.floor(wh.
                                                              fromTime/60)+(wh.fromTime%60)/100}"/>
                                            น.
                                        </td style="text-align: center
                                        ;">
                                        <td>
                                            <fmt:formatNumber type="number" pattern="00.00"
                                                              value="${Math.floor(wh.toTime/60)+(wh.toTime%60)/100}"/>
                                            น.
                                        </td>
                                        <td style="text-align:center;">
                                            <fmt:formatNumber type="number" pattern="#0"
                                                              value="${Math.floor(((wh.toTime - wh.fromTime)/60))}"/>
                                            ชั่วโมง
                                            <fmt:formatNumber type="number" pattern="#0"
                                                              value="${Math.floor(((wh.toTime - wh.fromTime)%60))}"/>
                                            นาที
                                        </td>
                                        <td style="text-align:center;">
                                            <fmt:formatNumber type="number" pattern="##,###0.00"
                                                              value="${wh.workingPay}"/> ฿
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
</html>