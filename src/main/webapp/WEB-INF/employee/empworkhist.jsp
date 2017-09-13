<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="com.springoeb.employee.model.Employee" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../_include/topenv.jsp"/>
    <link href="${contextPath}/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
    <title>ประวัติการทำงาน</title>
    <style>
        .required:after {
            content:" *";
            color:red;
        }
    </style>
</head>
<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <!-- page content -->
        <div class="container">
            <jsp:include page="../_include/navbar.jsp"/>
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
                                <p>
                                    <a data-toggle="modal" onclick="smartgen(true)" data-target="#addWorkHist"
                                       class="btn btn-success btn-sm"><i class="fa fa-plus-circle"></i>&nbsp;
                                        เพิ่มทำงาน</a>
                                </p>
                                <div class="well" style="overflow: auto">
                                    <div class="col-md-12">
                                        <p style="text-align: center;">เลือกวันที่ต้องการดูประวัติการทำงานของพนักงาน</p>
                                    </div>
                                    <div class="control-group col-md-12">
                                        <form id="filterdate" method="POST">
                                            <div class="col-md-offset-4 col-md-3" style="padding-right:0px;">
                                                <input type="text" name="filterdate" id="test"
                                                       class="form-control" required>
                                            </div>
                                            <div class="input-group-btn">
                                                <button class="btn btn-default"
                                                        type="submit"
                                                        id="css-irow">
                                                        <i class="glyphicon glyphicon-search fa fa-search"></i>
                                                        ค้นหา
                                                </button>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="col-md-12">
                                        <p style="text-align:center;" id="sumofpay"></p>
                                    </div>
                                </div>
                            </div>
                            <table id="datatable-work" class="table table-striped table-bordered">
                                <thead>
                                <tr>
                                    <th style="text-align:center;width:14.28%;">วัน/เดือน/ปี</th>
                                    <th style="text-align:center;width:14.28%;">ชื่อ</th>
                                    <%--<th style="text-align:center;width:14.28%;">เวลาเข้างาน</th>--%>
                                    <%--<th style="text-align:center;width:14.28%;">เวลาออกงาน</th>--%>
                                    <th style="text-align:center;width:14.28%;">ชั่วโมงงาน</th>
                                    <th style="text-align:center;width:14.28%;">ค่าจ้างวันนี้</th>
                                    <th style="text-align:center;width:14.28%;">ตัวเลือก</th>
                                </tr>
                                </thead>

                                <tbody style="text-align:center;">
                                <%--<c:forEach items="${workHistories}" var="wh">--%>
                                <%--<tr style="text-align:center;">--%>
                                <%--<fmt:formatDate pattern="yyyyMMdd" value="${wh.workDate}" var="timeorder"/>--%>
                                <%--<td data-order="${timeorder}">--%>
                                <%--<fmt:formatDate pattern="dd/MM/yyyy" value="${wh.workDate}"/>--%>
                                <%--</td>--%>
                                <%--<td>--%>
                                <%--${wh.employee.empName}--%>
                                <%--</td>--%>
                                <%--<fmt:formatDate pattern="HHmm" value="${wh.workStart}" var="workStartOrder"/>--%>
                                <%--<td data-order="${workStartOrder}">--%>
                                <%--<c:choose>--%>
                                <%--<c:when test="${wh.workStart != null}">--%>
                                <%--<fmt:formatDate pattern="HH.mm" value="${wh.workStart}"/> น.--%>
                                <%--</c:when>--%>
                                <%--<c:otherwise>--%>
                                <%-----%>
                                <%--</c:otherwise>--%>
                                <%--</c:choose>--%>
                                <%--</td>--%>
                                <%--<fmt:formatDate pattern="HHmm" value="${wh.workEnd}" var="workEndOrder"/>--%>
                                <%--<td data-order="${workEndOrder}">--%>
                                <%--<c:choose>--%>
                                <%--<c:when test="${wh.workEnd != null}">--%>
                                <%--<fmt:formatDate pattern="HH.mm" value="${wh.workEnd}"/> น.--%>
                                <%--</c:when>--%>
                                <%--<c:otherwise>--%>
                                <%-----%>
                                <%--</c:otherwise>--%>
                                <%--</c:choose>--%>
                                <%--</td>--%>
                                <%--<td data-order="${wh.workHour}${wh.workMin}">--%>
                                <%--<c:if test="${wh.workHour > 0}">--%>
                                <%--<fmt:formatNumber type="number" pattern="#0" value="${wh.workHour}"/>--%>
                                <%--ชั่วโมง--%>
                                <%--</c:if>--%>
                                <%--<fmt:formatNumber type="number" pattern="#0" value="${wh.workMin}"/>--%>
                                <%--นาที--%>
                                <%--</td>--%>
                                <%--<td data-order="${wh.workPay}">--%>
                                <%--<fmt:formatNumber type="number" pattern="#,###,###0.00"--%>
                                <%--value="${wh.workPay}"/> บาท--%>
                                <%--</td>--%>
                                <%--<td>--%>
                                <%--<a onclick="editEmp(${e.empNo})" class="btn btn-warning btn-sm"--%>
                                <%--data-toggle="modal"--%>
                                <%--data-target="#editEmp" disabled=""><i class="fa fa-pencil"></i>&nbsp;--%>
                                <%--แก้ไข </a>--%>
                                <%--<a href="${contextPath}/employee/deleteworkhistory/${wh.workHistNo}" )--%>
                                <%--class="btn btn-danger btn-sm"><i--%>
                                <%--class="fa fa-trash"></i>&nbsp; ลบ</a>--%>
                                <%--</td>--%>
                                <%--</tr>--%>
                                <%--</c:forEach>--%>
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
                            </div>
                            <!-- ส่วนเนื้อหาของ Modal -->
                            <div class="modal-body">
                                <form class="form-horizontal form-label-left input_mask" id="work_hist_add">
                                    <div class="form-group" id="addworkfield">
                                        <div class="col-md-3 col-sm-3 col-xs-6 form-group has-feedback"
                                             style="text-align: center;">
                                            <input type="date" id="workDate" class="form-control workdate"
                                                   name="workDate"
                                                   required>
                                            <span class="fa fa-calendar form-control-feedback right"
                                                  aria-hidden="true"></span>
                                        </div>
                                        <div class="col-md-3">
                                            <a class="btn btn-success btn-sm" id="addworkfieldbtn">
                                                <i class="fa fa-plus-circle"></i>
                                                &nbsp;เพิ่มรายการ
                                            </a>
                                        </div>
                                        <div>
                                            <div class="col-md-4 col-sm-4 col-xs-4 form-group has-feedback"
                                                 style="clear:both;">
                                                <label class="required">ชื่อพนักงาน</label>
                                                <select name="empNo" class="form-control chooseEmpName" required>
                                                    <c:forEach items="${employees}" var="e">
                                                        <option value="${e.empNo}">${e.empName}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="col-md-3 col-sm-3 col-xs-3 form-group has-feedback">
                                                <label>จำนวนชั่วโมงในการทำงาน</label>
                                                <input type="number" class="form-control" min="0" max="24" step="1"
                                                       placeholder="ชั่วโมง" name="workHour">
                                                <span class="fa fa-hourglass form-control-feedback right"
                                                      aria-hidden="true"></span>
                                            </div>
                                            <div class="col-md-3 col-sm-3 col-xs-3 form-group has-feedback">
                                                <label>จำนวนนาทีในการทำงาน</label>
                                                <input type="number" class="form-control" min="0" max="59" step="1"
                                                       placeholder="นาที" name="workMin">
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

                <!-- modal EDIT WORK HIST -->
                <div class="modal fade" id="editWorkHist" role="dialog">
                    <div class="modal-dialog">
                        <!-- เนือหาของ Modal ทั้งหมด -->
                        <div class="modal-content">
                            <!-- ส่วนหัวของ Modal -->
                            <div class="modal-header">
                                <!-- ปุ่มกดปิด (X) ตรงส่วนหัวของ Modal -->
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">แก้ไขประวัติการทำงาน</h4>
                            </div>
                            <!-- ส่วนเนื้อหาของ Modal -->
                            <div class="modal-body">
                                <form class="form-horizontal form-label-left input_mask" id="work_hist_edit">
                                    <input type="hidden" id="edithiddenworkhistno" name="workHistNo">
                                    <input type="hidden" id="edithiddenempno" name="empNo">
                                    <div class="form-group">
                                        <div class="col-md-6 col-sm-6 col-xs-6 form-group has-feedback">
                                            <label>วันที่ทำงาน</label>
                                            <input type="date" id="editWorkDate" class="form-control workdate"
                                                   name="workDate"
                                                   required readonly>
                                            <span class="fa fa-calendar form-control-feedback right"
                                                  aria-hidden="true"></span>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-6 form-group has-feedback">
                                            <label class="required">ชื่อพนักงาน</label>
                                            <select class="form-control chooseEmpName" id="editEmpNo" disabled required>
                                                <c:forEach items="${employees}" var="e">
                                                    <option value="${e.empNo}">${e.empName}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="col-md-6 col-sm-3 col-xs-3 form-group has-feedback">
                                            <label>จำนวนชั่วโมงในการทำงาน</label>
                                            <input type="number" class="form-control" min="0" max="24" step="1"
                                                   placeholder="ชั่วโมง" name="workHour" id="editWorkHour">
                                            <span class="fa fa-hourglass form-control-feedback right"
                                                  aria-hidden="true"></span>
                                        </div>
                                        <div class="col-md-6 col-sm-3 col-xs-3 form-group has-feedback">
                                            <label>จำนวนนาทีในการทำงาน</label>
                                            <input type="number" class="form-control" min="0" max="59" step="1"
                                                   placeholder="นาที" name="workMin" id="editWorkMin">
                                            <span class="fa fa-hourglass-end form-control-feedback right"
                                                  aria-hidden="true"></span>
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
<jsp:include page="../_include/bottomenv.jsp"/>
<script src="${contextPath}/vendors/moment/min/moment.min.js"></script>
<script src="${contextPath}/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
<script>
    $(document).ready(function () {
        $('#test').daterangepicker();

        $("#datatable-work").DataTable({
            order: [[0, "desc"]],
            columnDefs: [
                {orderable: false, targets: [-1]}
            ],
            columns: [
                {
                    data: {
                        _: "workdate.display",
                        sort: "workdate.order"
                    },
                },
                {
                    data: "empname",
                },
                {
                    data: {
                        _: "hour.display",
                        sort: "hour.order"
                    }
                },
                {
                    data: {
                        _: "pay.display",
                        sort: "pay.order"
                    }
                },
                {
                    data: "option"
                }
            ]
        });

        refresh_table(true);

        setInterval(refresh_table(true), 60000);
    })
    ;

    var wrapper = $("#addworkfield");
    var add_button = $("#addworkfieldbtn");
    var work_field = '<div class="removable_div">' +
        '<div class="col-md-4 col-sm-4 col-xs-4 form-group has-feedback" style="clear:both;">' +
        '<select name="empNo" class="form-control chooseEmpName" required>' +
        <c:forEach items="${employees}" var="e">
        '<option value="${e.empNo}">${e.empName}</option>' +
        </c:forEach>
        '</select>' +
        '</div>' +
        '<div class="col-md-3 col-sm-3 col-xs-3 form-group has-feedback">' +
        '<input type="number" class="form-control" min="0" step="1" placeholder="ชั่วโมง" name="workHour">' +
        '<span class="fa fa-hourglass form-control-feedback right" aria-hidden="true"></span>' +
        '</div>' +
        '<div class="col-md-3 col-sm-3 col-xs-3 form-group has-feedback">' +
        '<input type="number" class="form-control" min="0" max="59" step="1" placeholder="นาที" name="workMin">' +
        '<span class="fa fa-hourglass-end form-control-feedback right" aria-hidden="true"></span>' +
        '</div>' +
        '<div class="col-md-1 col-sm-1 col-xs-1">' +
        '<a style="cursor:pointer" class="removeworkfieldbtn"><i class="fa fa-trash"></i></a>' +
        '</div>' +
        '</div>';
    $(add_button).click(function () {
        $(wrapper).append(work_field);
    });

    $(wrapper).on("click", ".removeworkfieldbtn", function () {
        $(this).parent('div').parent('div').remove();
    });

    //TODO : Add Work History
    $("#work_hist_add").submit(function () {
        var object = $(this).serialize();
        $.ajax({
            type: "POST",
            data: object,
            url: "${contextPath}/employee/manageworkhistory",
            success: function (result) {
                swal("สำเร็จ", "เพิ่มการทำงานเรียบร้อยแล้ว", "success");
                reset_field();
                var d = new Date();
                var year = d.getFullYear();
                var month = (d.getMonth() + 1) < 10 ? '0' + (d.getMonth() + 1) : (d.getMonth() + 1);
                var date = d.getDate() < 10 ? '0' + d.getDate() : d.getDate();
                var dateformat = year + "-" + month + "-" + date;

                $(".workdate").val('' + dateformat);
                refresh_table(true);
            }, error: function (result) {
                swal("ไม่สำเร็จ", "กรุณาลองใหม่ในภายหลัง", "error");
            }
        });
        $("#addWorkHist").modal('toggle');
        return false;
    });

    $('.modal').on('hidden.bs.modal', function () {
        reset_field();
    });

    function reset_field() {
        $(".removable_div").remove();
        $("#work_hist_add")[0].reset();
    }

    $("#work_hist_edit").submit(function () {
        var object = $(this).serialize();
        $.ajax({
            type: "POST",
            data: object,
            url: "${contextPath}/employee/manageworkhistory",
            success: function (result) {
                swal("สำเร็จ", "แก้ไขการทำงานเรียบร้อยแล้ว", "success");
                refresh_table(true);
            }, error: function (result) {
                swal("ไม่สำเร็จ", "กรุณาลองใหม่ในภายหลัง", "error");
            }
        });
        $("#editWorkHist").modal('toggle');
        return false;
    });

    //TODO: Set Work History Function
    function setWork(workNo) {
        $.ajax({
            type: "GET",
            url: "${contextPath}/employee/ajax/getworkhistory/" + workNo,
            dataType: "json",
            success: function (result) {
                var workhistno = result.workHistNo;
                var workdate = result.workDate;
                var empno = result.empNo;
                var workhour = result.workHour;
                var workmin = result.workMin;

                $("#edithiddenworkhistno").val(workhistno);
                $("#editWorkDate").val(workdate);
                $("#editEmpNo").val(empno);
                $("#edithiddenempno").val(empno);
                $("#editWorkHour").val(workhour);
                $("#editWorkMin").val(workmin);
            }
        });
    }
    //TODO: Delete Work History Function
    function delWork(workNo, empName) {
        swal({
                title: "ยืนยันการลบ",
                text: "เมื่อยืนยัน จะไม่สามารถนำประวัติการทำงานของ " + empName + " กลับมาได้",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "ใช่, ต้องการลบ",
                cancelButtonText: "ยกเลิก",
                closeOnConfirm: false
            },
            function () {
                $.ajax({
                    type: "GET",
                    url: "${contextPath}/employee/deleteworkhistory/" + workNo,
                    success: function (result) {
                        swal("สำเร็จ", "ลบการทำงานเรียบร้อยแล้ว", "success");
                        refresh_table(true);
                    }, error: function (result) {
                        swal("ไม่สำเร็จ", "กรุณาลองใหม่ในภายหลัง", "error");
                    }
                });
            });
    }

    //TODO: Smart Gen History
    function smartgen(today) {
        if (today == true) {
            var d = new Date();
        } else {
            var d = today;
        }

        $("#work_hist_add")[0].reset();

        var year = d.getFullYear();
        var month = (d.getMonth() + 1) < 10 ? '0' + (d.getMonth() + 1) : (d.getMonth() + 1);
        var date = d.getDate() < 10 ? '0' + d.getDate() : d.getDate();
        var dateformat = year + "-" + month + "-" + date;
        $(".workdate").val('' + dateformat);

        $.ajax({
            type: "POST",
            data: {date: d.getFullYear() + '-' + (d.getMonth() + 1) + '-' + d.getDate()},
            url: "${contextPath}/employee/ajax/smartgenworkhistory",
            dataType: "json",
            success: function (result) {
                $(".removable_div").remove();
                for (i = 0; i < Object.keys(result).length; i++) {
                    if (i != Object.keys(result).length - 1) {
                        $(wrapper).append(work_field);
                    }
                    $(".chooseEmpName:eq(" + i + ")").val(result[i]);
                }
            }
        });
    }

    //TODO: Refresh Table Function
    function refresh_table(url) {
        var object = $("#filterdate").serialize();
        $.ajax({
            type: "POST",
            data: object,
            url: url == true ? "${contextPath}/employee/ajax/getworkhistories" : url,
            dataType: "json",
            success: function (json) {
                var data_array = [];
                var sum_of_pay = 0;
                for (var iterator = 0; iterator < json.length; iterator++) {
                    var work_obj = json[iterator];
                    if (work_obj.workPay != null) {
                        // sum of pay
                        sum_of_pay = sum_of_pay + work_obj.workPay;
                        // Initial
                        workdate_d = new Date(work_obj.workDate);
                        workdate_display = (workdate_d.getDate() < 10 ? "0" + workdate_d.getDate() : workdate_d.getDate()) + "/" + ((workdate_d.getMonth() + 1) < 10 ? "0" + (workdate_d.getMonth() + 1) : (workdate_d.getMonth() + 1)) + "/" + workdate_d.getFullYear();
                        workdate_order = "" + workdate_d.getFullYear() + ((workdate_d.getMonth() + 1) < 10 ? "0" + (workdate_d.getMonth() + 1) : (workdate_d.getMonth() + 1)) + (workdate_d.getDate() < 10 ? "0" + workdate_d.getDate() : workdate_d.getDate());
                        hour_display = "" + (work_obj.workHour > 0 ? work_obj.workHour + " ชั่วโมง " : "") + (work_obj.workMin > 0 ? work_obj.workMin + " นาที " : "");
                        hour_order = "" + (work_obj.workHour < 10 ? "0" + work_obj.workHour : work_obj.workHour) + (work_obj.workMin < 10 ? "0" + work_obj.workMin : work_obj.workMin);
                        pay_display = "" + (work_obj.workPay.toFixed(2)).replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " บาท";
                        pay_order = work_obj.workPay * 100;
                        for (var i = ("" + pay_order).length; i < 30; i++) {
                            pay_order = "0" + pay_order;
                        }
                        var data_refresh = {
                            workdate: {
                                display: workdate_display,
                                order: workdate_order
                            },
                            empname: work_obj.empName,
                            hour: {
                                display: hour_display,
                                order: hour_order
                            },
                            pay: {
                                display: pay_display,
                                order: pay_order
                            },
                            option: '<a onclick="setWork(' + work_obj.workHistNo + ')" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#editWorkHist"><i class="fa fa-pencil"></i>&nbsp; แก้ไข </a>' +
                            '<a onclick="delWork(' + work_obj.workHistNo + ',\'' + work_obj.empName + '\')" class="btn btn-danger btn-sm"><i class="fa fa-trash"></i>&nbsp; ลบ</a>'
                        };
                        data_array.push(data_refresh);
                    }
                }

                $("#datatable-work").DataTable().clear();
                $("#datatable-work").DataTable().rows.add(data_array).draw();

                if (url != true && sum_of_pay != 0) {
                    $("#sumofpay").html('ค่าจ้างรวมทั้งหมดคือ : ' + sum_of_pay.toFixed(2) + ' บาท');
                } else {
                    $("#sumofpay").html('');
                }
            }
        });
    }

    //TODO: Filter Date Function
    $("#filterdate").submit(function () {
        refresh_table('${contextPath}/employee/ajax/filterworkhistory');
        return false;
    });

    $(".workdate").change(function () {
        workdate_field = $(".workdate").val();
        today = new Date(workdate_field);
        smartgen(today);
    });
</script>
</body>
</html>