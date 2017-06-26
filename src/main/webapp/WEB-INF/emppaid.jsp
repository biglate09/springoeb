<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.List" %>
<%@page import="com.springoeb.employee.model.Employee" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="include/topenv.jsp"/>
    <title>จ่ายเงินพนักงาน</title>
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
                <div class="clearfix"></div>
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h4>จ่ายเงินพนักงาน</h4>
                            </div>
                            <div class="x_content">
                                <table id="datatable-pay" class="table table-striped table-bordered">
                                    <thead>
                                    <tr>
                                        <th class="table-rows">ชื่อ</th>
                                        <th class="table-rows">ประเภทการจ้าง</th>
                                        <th class="table-rows">ค่าจ้างต่อหน่วยเวลา</th>
                                        <th class="table-rows">ค่าจ้างที่คงเหลือเบิกได้</th>
                                        <th class="table-rows">ตัวเลือก</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${employees}" var="e" varStatus="vs">
                                        <tr id="tr${e.empNo}">
                                            <td style="text-align:center;">${e.empName}</td>
                                            <td style="text-align:center;">
                                                    ${e.empType==Employee.FULL_TIME?'Full-Time':e.empType==Employee.PART_TIME?'Part-Time':'Training'}
                                            </td>
                                            <td style="text-align:center;" data-order="${e.payType==Employee.HOUR?e.pay*8:e.pay}">
                                                <fmt:formatNumber value="${e.pay}" pattern="#,###,##0.00"/> บาท /
                                                    ${e.payType==Employee.HOUR?'ชั่วโมง':'วัน'}
                                            </td>
                                            <c:set var="sumpay" value="0"/>
                                            <c:forEach items="${e.workHistories}" var="wh">
                                                <c:set var="sumpay" value="${sumpay + wh.workPay}"/>
                                            </c:forEach>
                                            <c:forEach items="${e.employeePays}" var="ep">
                                                <c:set var="sumpay" value="${sumpay - ep.pay}"/>
                                            </c:forEach>

                                            <td style="text-align:center;" data-order="${sumpay}"><fmt:formatNumber value="${sumpay}"
                                                                                             pattern="#,###,##0.00"/>
                                                บาท
                                            </td>

                                                <%--<td style="text-align:center;">${e.constraint.employmentType.empTypeName}--%>
                                                <%--ราย${e.constraint.payType.payTypeName}</td>--%>
                                                <%--<td style="text-align:center;"><fmt:formatNumber type="number"--%>
                                                <%--pattern="#,###,##0.00"--%>
                                                <%--value="${e.SUMPAY}"/> ฿--%>
                                                <%--</td>--%>
                                            <td style="text-align:center;">
                                                <button class="btn btn-primary btn-sm" data-toggle="modal"
                                                        data-target="#paidDetail" onclick="setemppaid(${e.empNo})"><i
                                                        class="fa fa-money"></i>&nbsp; จ่ายเงิน
                                                </button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- /page content -->
                    <!-- Modal Content (ADD EMP)-->
                    <div class="modal fade" id="paidDetail" role="dialog">
                        <div class="modal-dialog">
                            <!-- เนือหาของ Modal ทั้งหมด -->
                            <div class="modal-content modal-body-test">
                                <!-- ส่วนหัวของ Modal -->
                                <div class="modal-header">
                                    <!-- ปุ่มกดปิด (X) ตรงส่วนหัวของ Modal -->
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">รายละเอียดประวัติรายได้ของ <span id="empName"></span></h4>
                                </div>
                                <!-- ส่วนเนื้อหาของ Modal -->
                                <div class="modal-body">
                                    <table id="datatable-workhist" class="table table-striped table-bordered">
                                        <thead>
                                        <tr>
                                            <th class="table-rows">วันที่ (ว/ด/ป)</th>
                                            <th class="table-rows">เวลาเข้างาน</th>
                                            <th class="table-rows">เวลาออกงาน</th>
                                            <th class="table-rows">ชั่วโมงงาน</th>
                                            <th class="table-rows">จำนวนเงินที่ได้รับ</th>
                                        </tr>

                                        </thead>
                                        <tbody style="text-align: center;">
                                        </tbody>
                                    </table>
                                    <table id="datatable-workpay" class="table table-striped table-bordered">
                                        <thead>
                                        <tr>
                                            <th style="text-align:center;">ครั้งที่</th>
                                            <th style="text-align:center;">วัน/เวลา ที่เบิก</th>
                                            <th style="text-align:center;">จำนวนเงินที่เบิก</th>
                                        </tr>

                                        </thead>
                                        <tbody style="text-align: center;">
                                        </tbody>
                                    </table>
                                </div>
                                <form id="pay-form" method="GET" action="#">
                                    <div class="modal-footer">
                                        <!-- ปุ่มกดปิด (Close) ตรงส่วนล่างของ Modal -->
                                        <%--<input type="hidden" id="empno">--%>
                                        <div class="col-md-3">จำนวนเงินที่เบิกได้ : <span id="sumpay"></span> บาท</div>
                                        <div class="col-md-4 col-md-offset-5">
                                            <div class="input-group">
                                                <input type="number" name="pay" id="input-withdraw"
                                                       class="form-control"
                                                       placeholder="กรุณาใส่จำนวนเงิน..">
                                                <span class="input-group-btn">
                                                            <button class="btn btn-default" type="submit" id="css-irow"
                                                                    name="paymoney">จ่ายเงิน</button>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="include/bottomenv.jsp"/>

<%--<script src="handmade/emppaid.js"></script>--%>
</body>
<script>
    $(document).ready(function () {
        $("#datatable-pay").DataTable({
            "order": [[3, "desc"]],
            "columnDefs": [
                {
                    orderable: false, targets: [-1]
                }
            ]
        });
    });

    function setemppaid(empNo) {
        $.ajax({
            type: "GET",
            url: "${contextPath}/employee/ajax/getemployee/" + empNo,
            dataType: "json",
            success: function (result) {
                $("#empName").html(result.empName);
                $("#pay-form").attr('action', '${contextPath}/employee/pay/' + empNo);
                var workHistories = result.workHistories;
                var employeePays = result.employeePays;
                var sumpay = 0;
                var tableworkhist = $("#datatable-workhist").DataTable();
                var tableworkpay = $("#datatable-workpay").DataTable();
                tableworkhist.clear();
                tableworkpay.clear();
                for (var i = 0; i < workHistories.length; i++) {
                    var workHistory = workHistories[i];
                    var hour = Math.floor(workHistory.workHour);
                    var minute = Math.ceil(((workHistory.workHour) % 1) * 60);
                    var date = new Date(workHistory.workDate);
                    var formatDate = date.getDate() + '/' + ((date.getMonth() + 1) < 10 ? '0' + date.getMonth() : date.getMonth()) + '/' + date.getFullYear();
                    tableworkhist.row.add([formatDate, workHistory.workStart == null ? '-' : workHistory.workStart, workHistory.workEnd == null ? '-' : workHistory.workEnd, hour + ' ชั่วโมง ' + minute + ' นาที', workHistory.workPay.toFixed(2) + ' บาท']);
                    sumpay += workHistory.workPay;
                }

                for (var i = 0; i < employeePays.length; i++) {
                    var employeePay = employeePays[i];
                    var date = new Date(employeePay.date);
                    var formatDate = date.getDate() + '/' + ((date.getMonth() + 1) < 10 ? '0' + date.getMonth() : date.getMonth()) + '/' + date.getFullYear();
                    formatDate += ' '+date.getHours()+':'+date.getMinutes()+' น.';
                    tableworkpay.row.add([(i + 1), formatDate, employeePay.pay.toFixed(2) + ' บาท']);
                    sumpay -= employeePay.pay;
                }

                tableworkhist.draw();
                tableworkpay.draw();

                $("#sumpay").html(sumpay.toFixed(2));
            }
        });
    }

    $("#pay-form").submit(function () {
        var sumpay = parseFloat($("#sumpay").html());
        var send_form = false;
        inputwd = $("#input-withdraw").val();
        empno = $("#empno").val();
        if (inputwd === '') {
            alert('กรุณาใส่เงินที่ต้องการเบิกก่อน');
            return false;
        } else if (inputwd <= sumpay && inputwd > 0) {
//            swal({
//                    title: "คุณต้องการเบิกเงินให้ " + $("#empName").text() + " ?",
//                    text: "จำนวนเงิน " + inputwd + " ฿ จากที่เบิกได้ " + sumpay + " ฿",
//                    type: "warning",
//                    showCancelButton: true,
//                    confirmButtonColor: "#DD6B55",
//                    cancelButtonText: "ยกเลิก",
//                    confirmButtonText: "ใช่, ฉันต้องการเบิก",
//                    closeOnConfirm: false
//                },
//                function () {
                    return true;
//                });
        } else {
            alert('เงินที่ต้องการเบิกน้อยกว่าเงินที่เบิกได้ หรือใส่เงินที่ต้องการเบิกเป็น 0 หรือน้อยกว่า');
            return false;
        }

        console.log(send_form);
    });
</script>
</html>