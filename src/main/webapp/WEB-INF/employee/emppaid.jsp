<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.List" %>
<%@page import="com.springoeb.employee.model.Employee" %>
<%@page import="com.springoeb.system.model.Role" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../_include/topenv.jsp"/>
    <title>${branchUser.roleNo == Role.EMPLOYEE ? 'ประวัติการทำงาน' : 'จ่ายเงินพนักงาน'}</title>
</head>
<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <jsp:include page="../_include/navbar.jsp"/>
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
                                <h4>${branchUser.roleNo == Role.EMPLOYEE ? 'ประวัติการทำงาน' : 'จ่ายเงินพนักงาน'}</h4>
                            </div>
                            <div class="x_content">
                                <div class="well" style="overflow: auto">
                                    <p style="text-align:center;">ค่าจ้างคงเหลือของ${branchUser.roleNo == Role.EMPLOYEE ? 'คุณ' : 'พนักงานทุกคนคือ'} : <b
                                            id="all_sum_pay"></b> บาท</p>
                                </div>
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
                                    <tbody style="text-align:center;">

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
                                    <h4 class="modal-title" style="text-align:center;margin-bottom:10px;">
                                        รายละเอียดการทำงาน</h4>
                                    <table id="datatable-workhist" class="table table-striped table-bordered">
                                        <thead>
                                        <tr>
                                            <th class="table-rows">วันที่ (ว/ด/ป)</th>
                                            <%--<th class="table-rows">เวลาเข้างาน</th>--%>
                                            <%--<th class="table-rows">เวลาออกงาน</th>--%>
                                            <th class="table-rows">ชั่วโมงงาน</th>
                                            <th class="table-rows">จำนวนเงินที่ได้รับ</th>
                                        </tr>

                                        </thead>
                                        <tbody style="text-align: center;">
                                        </tbody>
                                    </table>
                                    <h4 class="modal-title" style="text-align:center;margin-bottom:10px;">
                                        รายละเอียดการเบิกเงิน</h4>
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
                                <div class="modal-footer">
                                    <div class="well">
                                        <form id="pay-form">
                                            <div class="col-md-4" style="text-align:left;">
                                                เบิกไปแล้วทั้งหมด : <span id="withdraw"
                                                                          style="font-weight: bold;"></span> บาท
                                            </div>
                                            <div class="col-md-4" style="text-align:left;">
                                                คงเหลือ : <span id="sumpay" style="font-weight: bold;"></span> บาท
                                            </div>
                                            <c:if test="${branchUser.roleNo == Role.MANAGER}">
                                                <div class="col-md-4">
                                                    <div class="input-group">
                                                        <input type="number" name="pay" id="input-withdraw"
                                                               class="form-control"
                                                               step="0.25"
                                                               placeholder="กรุณาใส่จำนวนเงิน..">
                                                        <input type="hidden" id="empno" name="empNo">
                                                        <span class="input-group-btn">
                                                    <button class="btn btn-default" type="submit"
                                                            id="css-irow">จ่ายเงิน</button>
                                                </span>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../_include/bottomenv.jsp"/>

<%--<script src="handmade/emppaid.js"></script>--%>
</body>
<script>
    refresh_table();

    $(document).ready(function () {
        $("#datatable-pay").DataTable({
            order: [[3, "desc"]],
            columnDefs: [
                {
                    orderable: false, targets: [-1]
                }
            ],
            columns: [
                {
                    data: "empName"
                },
                {
                    data: "empType"
                },
                {
                    data: {
                        _: "empPay.display",
                        sort: "empPay.order"
                    }
                },
                {
                    data: {
                        _: "sumPay.display",
                        sort: "sumPay.order"
                    }
                },
                {
                    data: "option"
                }
            ]
        });

        $("#datatable-workhist").DataTable({
            order: [[0, "desc"]],
            columns: [
                {
                    data: {
                        _: "date.display",
                        sort: "date.order"
                    }
                },
//                {
//                    data: {
//                        _: "workStart.display",
//                        sort: "workStart.order"
//                    }
//                },
//                {
//                    data: {
//                        _: "workEnd.display",
//                        sort: "workEnd.order"
//                    }
//                },
                {
                    data: {
                        _: "workTime.display",
                        sort: "workTime.order"
                    }
                },
                {
                    data: {
                        _: "workPay.display",
                        sort: "workPay.order"
                    }
                }
            ]
        });

        $("#datatable-workpay").DataTable({
            order: [[0, "desc"]],
            columns: [
                {
                    data: "payNo"
                },
                {
                    data: {
                        _: "payTime.display",
                        sort: "payTime.order"
                    }
                },
                {
                    data: {
                        _: "pay.display",
                        sort: "pay.order"
                    }
                }
            ]
        });
    });

    var sumpay = 0;

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
                sumpay = 0;
                var withdraw = 0;
                var tableworkhist = $("#datatable-workhist").DataTable();
                var tableworkpay = $("#datatable-workpay").DataTable();
                $("#empno").val(empNo);
                tableworkhist.clear();
                tableworkpay.clear();
                $("#input-withdraw").val('');
                for (var i = 0; i < workHistories.length; i++) {
                    var workHistory = workHistories[i];
                    var hour = workHistory.workHour;
                    var minute = workHistory.workMin;
                    var date = new Date(workHistory.workDate);
                    var formatDate = (date.getDate() < 10 ? '0' + date.getDate() : date.getDate()) + '/' + ((date.getMonth() + 1) < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '/' + date.getFullYear();
                    if (workHistory.workPay == null) {
                        continue;
                    }
                    workPayOrder = "" + (workHistory.workPay * 100);

                    for (var j = workPayOrder.length; j < 30; j++) {
                        workPayOrder = "0" + workPayOrder;
                    }

                    tableworkhist.row.add({
                        date: {
                            display: formatDate,
                            order: '' + date.getFullYear() + ((date.getMonth() + 1) < 10 ? ('0' + (date.getMonth() + 1)) : (date.getMonth() + 1)) + ((date.getDate()) < 10 ? ('0' + (date.getDate())) : (date.getDate())),
                        },
//                        workStart: {
//                            display: workHistory.workStart == null ? '-' : (workHistory.workStart.substr(0, 2) + "." + workHistory.workStart.substr(3, 2) + " น."),
//                            order: workHistory.workStart == null ? '-' : ("" + workHistory.workStart.substr(0, 2) + workHistory.workStart.substr(3, 2))
//                        },
//                        workEnd: {
//                            display: workHistory.workEnd == null ? '-' : (workHistory.workEnd.substr(0, 2) + "." + workHistory.workEnd.substr(3, 2) + " น."),
//                            order: workHistory.workEnd == null ? '-' : ("" + workHistory.workEnd.substr(0, 2) + workHistory.workEnd.substr(3, 2))
//                        },
                        workTime: {
                            display: hour+minute == 0 ? '0 นาที' : (hour > 0 ? hour + ' ชั่วโมง ' : '') + (minute > 0 ? minute + ' นาที' : ''),
                            order: "" + (hour < 10 ? '0' + hour : hour) + (minute < 10 ? '0' + minute : minute)
                        },
                        workPay: {
                            display: workHistory.workPay.toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ",") + ' บาท',
                            order: workPayOrder
                        }
                    });
                    sumpay += workHistory.workPay;
                }

                //workhistory iterator
                var whi = 0;
                workhist = workHistories[whi];
                workhist_sumpay = 0;
                if (workhist != null) {
                    workhist_sumpay = workhist.workPay; // เงินประวัติชั่วคราว
                }
                for (var i = 0; i < employeePays.length; i++) {
                    var employeePay = employeePays[i];
                    var date = new Date(employeePay.date);
                    var formatDate = (date.getDate() < 10 ? '0' + date.getDate() : date.getDate()) + '/' + ((date.getMonth() + 1) < 10 ? '0' + (date.getMonth() + 1) : date.getMonth()) + '/' + date.getFullYear();
                    formatDate += ' ' + date.getHours() + '.' + (date.getMinutes() < 10 ? '0' + date.getMinutes() : date.getMinutes()) + ' น.';
                    payOrder = "" + (employeePay.pay * 100);

                    for (var j = payOrder.length; j < 30; j++) {
                        payOrder = "0" + payOrder;
                    }

                    var tmppay = employeePay.pay;
                    var ofTheseDays = "";

                    while (tmppay >= workhist_sumpay) {
                        if (workhist_sumpay != null) {
                            ofTheseDays += 'เบิกวันที่ : ' + workhist.workDate + ' จำนวน ' + workhist_sumpay.toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " บาท\\n";
                            tmppay = tmppay - workhist_sumpay;
                        }
                        whi++;
                        if (whi < workHistories.length) {
                            workhist = workHistories[whi];
                            workhist_sumpay = workhist.workPay;
                        } else {
                            break;
                        }
                    }

                    if (tmppay < workhist_sumpay && tmppay != 0) {
                        ofTheseDays += 'เบิกวันที่ : ' + workhist.workDate + ' จำนวน ' + tmppay.toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " บาท";
                        workhist_sumpay -= tmppay;
                    }

                    tableworkpay.row.add({
                        payNo: '<a style="cursor:pointer" onclick="alert(\'' + ofTheseDays + '\')">' + (i + 1) + '</a>',
                        payTime: {
                            display: formatDate,
                            order: "" + date.getFullYear() + ((date.getMonth() + 1) < 10 ? '0' + (date.getMonth() + 1) : (date.getMonth() + 1)) + (date.getDate() < 10 ? '0' + date.getDate() : date.getDate()) + (date.getHours() < 10 ? "0" + date.getHours() : date.getHours()) + (date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes()),
                        },
                        pay: {
                            display: employeePay.pay.toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ",") + ' บาท',
                            order: payOrder
                        }
                    });

                    sumpay -= employeePay.pay;
                    withdraw += employeePay.pay;
                }

                tableworkhist.draw(false);
                tableworkpay.draw(false);

                $("#sumpay").html(sumpay.toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                $("#withdraw").html(withdraw.toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ","));
            }
        });
    }

    $("#pay-form").submit(function () {
        var send_form = false;
        inputwd = $("#input-withdraw").val();
        empno = $("#empno").val();
        if (inputwd === '') {
            alert('กรุณาใส่เงินที่ต้องการเบิกก่อน');
//        } else if (inputwd <= sumpay && inputwd > 0) {
        } else {
            var object = $("#pay-form").serialize();
            swal({
                    title: "ต้องการเบิกเงินให้ " + $("#empName").text(),
                    text: "จำนวนเงิน " + inputwd.replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " บาท จากที่เบิกได้ " + ("" + sumpay.toFixed(2)).replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " บาท",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    cancelButtonText: "ยกเลิก",
                    confirmButtonText: "ใช่, ฉันต้องการเบิก",
                    closeOnConfirm: false
                },
                function () {
                    $.ajax({
                        type: "POST",
                        data: object,
                        url: "${contextPath}/employee/payforemp",
                        success: function (json) {
                            swal("สำเร็จ", "เบิกเรียบร้อยแล้ว", "success");
                            reset_field();
                            setemppaid(empno);
                            refresh_table();
                        }, error: function (json) {
                            swal("ไม่สำเร็จ", "คุณเบิกเงินมากกว่าที่เบิกได้หรือเซิร์ฟเวอร์มีปัญหา", "error");
                        }
                    });
                });
        }
        return false;
    });

    $('.modal').on('hidden.bs.modal', function () {
        reset_field();
    });

    function reset_field() {
        $("#input-withdraw").val('');
    }

    //TODO : Refresh Table Function
    function refresh_table() {
        $.ajax({
            type: "POST",
            url: "${contextPath}/employee/ajax/getemployees",
            dataType: "json",
            success: function (json) {
                var data_array = [];
                var all_sum_pay = 0;
                for (var iterator = 0; iterator < json.length; iterator++) {
                    var emp_obj = json[iterator];
                    var pay_order = emp_obj.payType == '${Employee.HOUR}' ? (emp_obj.pay * 800 + "") : (emp_obj.pay * 100 + "");
                    for (var i = pay_order.length; i < 20; i++) {
                        pay_order = "0" + pay_order;
                    }
                    var pay_format = "" + emp_obj.pay.toFixed(2);
                    if (pay_format.length >= 7) {
                        pay_format = pay_format.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                    }

                    var sumpay = 0;

                    for (ir = 0; ir < emp_obj.workHistories.length; ir++) {
                        if (emp_obj.workHistories[ir].workPay != null) {
                            sumpay = sumpay + parseFloat(emp_obj.workHistories[ir].workPay);
                        }
                    }

                    for (ir = 0; ir < emp_obj.employeePays.length; ir++) {
                        if (emp_obj.employeePays[ir].pay != null) {
                            sumpay = sumpay - parseFloat(emp_obj.employeePays[ir].pay);
                        }
                    }

                    all_sum_pay += sumpay;
                    sumpay_order = "" + (sumpay * 100).toFixed(2);

                    for (ir = sumpay_order.length; ir < 30; ir++) {
                        sumpay_order = "0" + sumpay_order;
                    }

                    var data_refresh = {
                        empName: '<a style="cursor:pointer;font-weight:bold;" onclick="setemppaid(' + emp_obj.empNo + ')" data-toggle="modal"' +
                        'data-target="#paidDetail" style="font-weight: bold;">' + emp_obj.empName + '</a>',
                        empType: emp_obj.empType == '${Employee.FULL_TIME}' ? 'Full-Time' : (emp_obj.empType == '${Employee.PART_TIME}' ? 'Part-Time' : 'Training'),
                        empPay: {
                            display: pay_format + ' บาท / ' + (emp_obj.payType == '${Employee.HOUR}' ? 'ชั่วโมง' : 'วัน'),
                            order: pay_order
                        },
                        sumPay: {
                            display: (sumpay.toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ",")) + " บาท",
                            order: sumpay_order
                        },
                        option: '<button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#paidDetail" onclick="setemppaid(' + emp_obj.empNo + ')"><i class="fa fa-${branchUser.roleNo == Role.EMPLOYEE ? 'search' : 'money'}"></i>&nbsp; ${branchUser.roleNo == Role.EMPLOYEE ? 'ดูรายละเอียด' : 'จ่ายเงิน'} </button>'
                    };
                    data_array.push(data_refresh);
                }
                $("#all_sum_pay").html(all_sum_pay.toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                $("#datatable-pay").DataTable().clear();
                $("#datatable-pay").DataTable().rows.add(data_array).draw(false);
            }
        });
    }
</script>
</html>