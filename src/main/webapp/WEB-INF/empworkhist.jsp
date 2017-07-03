<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="com.springoeb.employee.model.Employee" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
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
                                <form class="form-horizontal" action="FilterWorkByDateServlet" method="POST"
                                      modelAttribute="workHistory">
                                    <p>
                                        <a data-toggle="modal" data-target="#addWorkHist"
                                           class="btn btn-success btn-sm"><i class="fa fa-plus-circle"></i>&nbsp;
                                            เพิ่มทำงาน</a>
                                        <button type="submit" name="submit" value="del"
                                                class="btn btn-danger btn-sm" disabled><i class="fa fa-trash"></i>&nbsp;
                                            ลบที่เลือก
                                        </button>
                                    </p>
                                    <%--<fieldset>--%>
                                    <%--<div class="control-group show-grid">--%>
                                    <%--<p id="text-before-calendar">เลือกวันที่ต้องการแสดง</p>--%>
                                    <%--<div class="controls">--%>
                                    <%--<div class="input-prepend input-group col-md-6 col-md-offset-4">--%>
                                    <%--<span class="add-on input-group-addon">--%>
                                    <%--<i class="glyphicon glyphicon-calendar fa fa-calendar"></i>--%>
                                    <%--</span>--%>
                                    <%--<input type="text" name="date" id="reservation"--%>
                                    <%--class="form-control datepicker" value="${daterange}"/>--%>
                                    <%--<button type="submit" class="btn btn-default">--%>
                                    <%--<span class="glyphicon glyphicon-search"></span> ค้นหา--%>
                                    <%--</button>--%>
                                    <%--</div>--%>
                                    <%--</div>--%>
                                    <%--</div>--%>
                                    <%--</fieldset>--%>
                                </form>
                            </div>
                            <table id="datatable-work" class="table table-striped table-bordered">
                                <thead>
                                <tr>
                                    <th style="text-align:center;width:14.28%;">วัน/เดือน/ปี</th>
                                    <th style="text-align:center;width:14.28%;">ชื่อ</th>
                                    <th style="text-align:center;width:14.28%;">เวลาเข้างาน</th>
                                    <th style="text-align:center;width:14.28%;">เวลาออกงาน</th>
                                    <th style="text-align:center;width:14.28%;">ชั่วโมงงาน</th>
                                    <th style="text-align:center;width:14.28%;">ค่าจ้างวันนี้</th>
                                    <th style="text-align:center;width:14.28%;">ตัวเลือก</th>
                                </tr>
                                </thead>

                                <tbody>
                                <c:forEach items="${workHistories}" var="wh">
                                    <tr style="text-align:center;">
                                        <fmt:formatDate pattern="yyyyMMdd" value="${wh.workDate}" var="timeorder"/>
                                        <td data-order="${timeorder}">
                                            <fmt:formatDate pattern="dd/MM/yyyy" value="${wh.workDate}"/>
                                        </td>
                                        <td>
                                                ${wh.employee.empName}
                                        </td>
                                        <fmt:formatDate pattern="HHmm" value="${wh.workStart}" var="workStartOrder"/>
                                        <td data-order="${workStartOrder}">
                                            <c:choose>
                                                <c:when test="${wh.workStart != null}">
                                                    <fmt:formatDate pattern="HH.mm" value="${wh.workStart}"/> น.
                                                </c:when>
                                                <c:otherwise>
                                                    -
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <fmt:formatDate pattern="HHmm" value="${wh.workEnd}" var="workEndOrder"/>
                                        <td data-order="${workEndOrder}">
                                            <c:choose>
                                                <c:when test="${wh.workEnd != null}">
                                                    <fmt:formatDate pattern="HH.mm" value="${wh.workEnd}"/> น.
                                                </c:when>
                                                <c:otherwise>
                                                    -
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td data-order="${wh.workHour}${wh.workMin}">
                                            <c:if test="${wh.workHour > 0}">
                                                <fmt:formatNumber type="number" pattern="#0" value="${wh.workHour}"/>
                                                ชั่วโมง
                                            </c:if>
                                            <fmt:formatNumber type="number" pattern="#0" value="${wh.workMin}"/>
                                            นาที
                                        </td>
                                        <td data-order="${wh.workPay}">
                                            <fmt:formatNumber type="number" pattern="#,###,###0.00"
                                                              value="${wh.workPay}"/> บาท
                                        </td>
                                        <td>
                                            <a onclick="editEmp(${e.empNo})" class="btn btn-warning btn-sm"
                                               data-toggle="modal"
                                               data-target="#editEmp" disabled=""><i class="fa fa-pencil"></i>&nbsp;
                                                แก้ไข </a>
                                            <a href="${contextPath}/employee/deleteworkhistory/${wh.workHistNo}" )
                                               class="btn btn-danger btn-sm"><i
                                                    class="fa fa-trash"></i>&nbsp; ลบ</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- modal ADD WORK HIST -->
                <div class="modal fade" id="addWorkHist" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <!-- เนือหาของ Modal ทั้งหมด -->
                        <div class="modal-content">
                            <!-- ส่วนหัวของ Modal -->
                            <div class="modal-header">
                                <!-- ปุ่มกดปิด (X) ตรงส่วนหัวของ Modal -->
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">เพิ่มประวัติการทำงาน</h4>
                                <a class="btn btn-success btn-sm" id="addworkfieldbtn">
                                    <i class="fa fa-plus-circle"></i>
                                    &nbsp;เพิ่มรายการ
                                </a>
                            </div>
                            <!-- ส่วนเนื้อหาของ Modal -->
                            <div class="modal-body">
                                <form class="form-horizontal form-label-left input_mask"
                                      action="${contextPath}/employee/manageworkhistory" method="POST">
                                    <div class="form-group" id="addworkfield">
                                        <div class="col-md-3 col-sm-3 col-xs-6 form-group has-feedback"
                                             style="text-align: center;">
                                            <input type="date" class="form-control workdate" name="workDate"
                                                   required>
                                            <span class="fa fa-calendar form-control-feedback right"
                                                  aria-hidden="true"></span>
                                        </div>
                                        <div>
                                            <div class="col-md-4 col-sm-4 col-xs-4 form-group has-feedback"
                                                 style="clear:both;">
                                                <select name="empNo" class="form-control" required>
                                                    <c:forEach items="${employees}" var="e">
                                                        <option value="${e.empNo}">${e.empName}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="col-md-3 col-sm-3 col-xs-3 form-group has-feedback">
                                                <input type="number" class="form-control" min="0" max="24" step="1"
                                                       placeholder="ชั่วโมง" name="workHour" required>
                                                <span class="fa fa-hourglass form-control-feedback right"
                                                      aria-hidden="true"></span>
                                            </div>
                                            <div class="col-md-3 col-sm-3 col-xs-3 form-group has-feedback">
                                                <input type="number" class="form-control" min="0" max="59" step="1"
                                                       placeholder="นาที" name="workMin" required>
                                                <span class="fa fa-hourglass-end form-control-feedback right"
                                                      aria-hidden="true"></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <!-- ปุ่มกดปิด (Close) ตรงส่วนล่างของ Modal -->
                                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                                            <button type="submit" class="btn btn-success">ตกลง</button>
                                            <button type="button" class="btn btn-default" data-dismiss="modal">
                                                ยกเลิก
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- modal ADD WORK HIST -->
            </div>
        </div>
    </div>
</div>
</div>
<jsp:include page="include/bottomenv.jsp"/>
<script>
    $(document).ready(function () {
        var d = new Date();
        var year = d.getFullYear();
        var month = d.getMonth() + 1;
        if (month < 9) {
            month = "0" + month;
        }
        var date = d.getDate();
        var dateformat = year + "-" + month + "-" + date;
        $(".workdate").val(dateformat);

        $("#datatable-work").DataTable({
            "order": [[0, "desc"]],
            "columnDefs": [
                {orderable: false, targets: [-1]}
            ]
        });
    });

    var wrapper = $("#addworkfield");
    var add_button = $("#addworkfieldbtn");
    var work_field = '<div>' +
        '<div class="col-md-4 col-sm-4 col-xs-4 form-group has-feedback" style="clear:both;">' +
        '<select name="empNo" class="form-control" required>' +
        <c:forEach items="${employees}" var="e">
        '<option value="${e.empNo}">${e.empName}</option>' +
        </c:forEach>
        '</select>' +
        '</div>' +
        '<div class="col-md-3 col-sm-3 col-xs-3 form-group has-feedback">' +
        '<input type="number" class="form-control" min="0" step="1" placeholder="ชั่วโมง" name="workHour" required>' +
        '<span class="fa fa-hourglass form-control-feedback right" aria-hidden="true"></span>' +
        '</div>' +
        '<div class="col-md-3 col-sm-3 col-xs-3 form-group has-feedback">' +
        '<input type="number" class="form-control" min="0" max="59" step="1" placeholder="นาที" name="workMin" required>' +
        '<span class="fa fa-hourglass-end form-control-feedback right" aria-hidden="true"></span>' +
        '</div>' +
        '<div class="col-md-1 col-sm-1 col-xs-1">' +
        '<a style="cursor:pointer" class="removeworkfieldbtn">remove</a>' +
        '</div>' +
        '</div>';
    $(add_button).click(function () {
        $(wrapper).append(work_field);
        $('.workdate').val(dateformat);
    });

    $(wrapper).on("click", ".removeworkfieldbtn", function () {
        $(this).parent('div').parent('div').remove();
    });
</script>
</body>
</html>