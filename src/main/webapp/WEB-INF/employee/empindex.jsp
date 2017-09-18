<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.springoeb.employee.model.Employee" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../_include/topenv.jsp"/>
    <link href="${contextPath}/vendors/mjolnic-bootstrap-colorpicker/dist/css/bootstrap-colorpicker.min.css"
          rel="stylesheet">
    <link href="${contextPath}/vendors/fullcalendar/dist/fullcalendar.css" rel="stylesheet">
    <link href="${contextPath}/vendors/fullcalendar/dist/fullcalendar.print.css" rel="stylesheet" media="print">
    <title>ข้อมูลพนักงาน</title>

</head>
<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <jsp:include page="../_include/navbar.jsp"/>
        <!-- page content -->
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
                            <h4>ข้อมูลพนักงาน</h4>
                        </div>
                        <div class="x_content">
                            <form action="#">
                                <p>
                                    <a data-toggle="modal" data-target="#addEmp"
                                       class="btn btn-success btn-sm"><i class="fa fa-plus-circle"></i>&nbsp;
                                        เพิ่มพนักงาน</a>
                                    <%--</button>--%>
                                </p>
                                <table id="datatable-employee"
                                       class="table table-striped table-bordered bulk_action1">
                                    <thead>
                                    <tr>
                                        <th style="width:20%;text-align:center;">ชื่อ</th>
                                        <th style="width:20%;text-align:center;">ประเภท</th>
                                        <th style="width:20%;text-align:center;">ประเภทการจ้าง</th>
                                        <th style="width:20%;text-align:center;">ค่าจ้างต่อหน่วยเวลา</th>
                                        <th style="width:20%;text-align:center;">ตัวเลือก</th>
                                    </tr>
                                    </thead>
                                    <tbody style="text-align:center;">
                                    </tbody>
                                </table>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- /page content -->
                <!-- Modal Content (ADD EMP)-->
                <div class="modal fade" id="addEmp" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <!-- เนือหาของ Modal ทั้งหมด -->
                        <div class="modal-content" id="add_emp_modal">
                            <!-- ส่วนหัวของ Modal -->
                            <div class="modal-header">
                                <!-- ปุ่มกดปิด (X) ตรงส่วนหัวของ Modal -->
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">เพิ่มพนักงานใหม่</h4>
                            </div>
                            <!-- ส่วนเนื้อหาของ Modal -->
                            <div class="modal-body">
                                <form class="form-horizontal form-label-left input_mask" id="add_emp"
                                      modelAttribute="employee">
                                    <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                        <label class="required">ชื่อพนักงาน</label>
                                        <input type="text" class="form-control" name="empName"
                                               placeholder="ชื่อพนักงาน" id="empname_add" required>
                                        <span class="fa fa-user form-control-feedback right"
                                              aria-hidden="true"></span>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                            <label class="required">เพศ</label>
                                            <div class="form-group">
                                                <div class="btn-group" data-toggle="buttons">
                                                    <label class="btn btn-default clear-active"
                                                           data-toggle-class="btn-primary"
                                                           data-toggle-passive-class="btn-default">
                                                        <input type="radio" name="empGender" value="${Employee.MALE}"
                                                               required> &nbsp;
                                                        ชาย &nbsp;
                                                    </label>
                                                    <label class="btn btn-default clear-active"
                                                           data-toggle-class="btn-primary"
                                                           data-toggle-passive-class="btn-default">
                                                        <input type="radio" name="empGender" value="${Employee.FEMALE}"
                                                               required> &nbsp;
                                                        หญิง &nbsp;
                                                    </label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                            <label>เบอร์โทรศัพท์มือถือ</label>
                                            <input type="text" class="form-control" name="empTel"
                                                   placeholder="เบอร์โทรศัพท์มือถือ">
                                            <span class="fa fa-phone form-control-feedback right"
                                                  aria-hidden="true"></span>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                            <label class="required">ประเภทพนักงาน</label>
                                            <div class="form-group">
                                                <div class="btn-group" data-toggle="buttons">
                                                    <label class="btn btn-default clear-active empTypeItem"
                                                           data-toggle-class="btn-primary"
                                                           data-toggle-passive-class="btn-default">
                                                        <input type="radio" name="empType" value="${Employee.FULL_TIME}"
                                                               required> Full - Time
                                                    </label>
                                                    <label class="btn btn-default clear-active empTypeItem"
                                                           data-toggle-class="btn-primary"
                                                           data-toggle-passive-class="btn-default">
                                                        <input type="radio" name="empType" value="${Employee.PART_TIME}"
                                                               required> Part - Time
                                                    </label>
                                                    <label class="btn btn-default clear-active empTypeItem"
                                                           data-toggle-class="btn-primary"
                                                           data-toggle-passive-class="btn-default">
                                                        <input type="radio" name="empType" value="${Employee.TRAINING}"
                                                               required> Training
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback"
                                             style="clear: both;">
                                            <label class="required">ประเภทการจ่าย</label>
                                            <select name="payType" class="form-control" required>
                                                <option value="" selected disabled>เลือกประเภทการจ่าย</option>
                                                <option value="${Employee.HOUR}">รายชั่วโมง</option>
                                                <option value="${Employee.DAY}">รายวัน</option>
                                            </select>
                                        </div>

                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                            <label class="required">ค่าจ้างต่อหน่วยเวลา</label>
                                            <input type="number" step="any" class="form-control"
                                                   placeholder="ค่าจ้างต่อหน่วยเวลา" name="pay" max="999999.99"
                                                   required>
                                            <span class="fa fa-bitcoin form-control-feedback right"
                                                  aria-hidden="true"></span>
                                        </div>


                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                            <label class="required">อีเมล์</label>
                                            <input type="email" class="form-control"
                                                   placeholder="อีเมล์" name="email" required>
                                            <span class="fa fa-envelope form-control-feedback right"
                                                  aria-hidden="true"></span>
                                        </div>

                                        <div class="form-group col-md-12">
                                            <label>สีป้ายชื่อพนักงานในตารางการทำงาน</label>
                                            <div class="well" style="overflow: auto">
                                                <div class="col-md-4"
                                                     style="margin-left:30%;width:40%;margin-bottom:10px;">
                                                    <a class="fc-day-grid-event fc-event" id="row_example"
                                                       style="padding:7px;background-color:#000000;border-color:#000000;color:#ffffff;">
                                                        <div class="fc-content">
                                                            <span class="fc-time"> </span>
                                                            <span class="fc-title">[เช้า]  ... ชื่อพนักงาน (เสิร์ฟอาหาร)</span>
                                                        </div>
                                                    </a>
                                                </div>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <div class="input-group demo2 colorpicker-element" id="bgColor">
                                                        <input type="text" value="#000000" name="bgColor"
                                                               class="form-control">
                                                        <span class="input-group-addon">
                                                            <i style="background-color: rgb(0, 0, 0);"></i>
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <div class="input-group demo2 colorpicker-element" id="fontColor">
                                                        <input type="text" value="#FFFFFF" name="fontColor"
                                                               class="form-control">
                                                        <span class="input-group-addon">
                                                            <i style="background-color: rgb(255, 255, 255);"></i>
                                                        </span>
                                                    </div>
                                                </div>
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
                <!-- /Modal Content (ADD EMP)-->

                <!-- Modal Content (EDIT EMP)-->
                <div class="modal fade" id="editEmp" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <!-- เนือหาของ Modal ทั้งหมด -->
                        <div class="modal-content">
                            <!-- ส่วนหัวของ Modal -->
                            <div class="modal-header">
                                <!-- ปุ่มกดปิด (X) ตรงส่วนหัวของ Modal -->
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">แก้ไขพนักงาน</h4>
                            </div>
                            <!-- ส่วนเนื้อหาของ Modal -->
                            <div class="modal-body">
                                <form class="form-horizontal form-label-left input_mask" id="edit_emp"
                                      action="${contextPath}/employee/manageemployee" method="POST"
                                      modelAttribute="employee">
                                    <input type="hidden" name="empNo" id="hiddenempno">
                                    <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                        <label class="required">ชื่อพนักงาน</label>
                                        <input type="text" class="form-control" id="editempname" name="empName"
                                               placeholder="ชื่อพนักงาน" required>
                                        <span class="fa fa-user form-control-feedback right"
                                              aria-hidden="true"></span>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                            <label class="required">เพศ</label>
                                            <div class="form-group">
                                                <div class="btn-group" data-toggle="buttons">
                                                    <label class="btn btn-default clear-active"
                                                           data-toggle-class="btn-primary"
                                                           data-toggle-passive-class="btn-default"
                                                           id="editempgender${Employee.MALE}">
                                                        <input type="radio" name="empGender" value="${Employee.MALE}"
                                                               required> &nbsp;
                                                        ชาย &nbsp;
                                                    </label>
                                                    <label class="btn btn-default clear-active"
                                                           data-toggle-class="btn-primary"
                                                           data-toggle-passive-class="btn-default"
                                                           id="editempgender${Employee.FEMALE}">
                                                        <input type="radio" name="empGender" value="${Employee.FEMALE}"
                                                               required> &nbsp;
                                                        หญิง &nbsp;
                                                    </label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                            <label>เบอร์โทรศัพท์มือถือ</label>
                                            <input type="text" class="form-control" name="empTel" id="editemptel"
                                                   placeholder="เบอร์โทรศัพท์มือถือ">
                                            <span class="fa fa-phone form-control-feedback right"
                                                  aria-hidden="true"></span>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                            <label class="required">ประเภทพนักงาน</label>
                                            <div class="form-group">
                                                <div class="btn-group" data-toggle="buttons">
                                                    <label class="btn btn-default empTypeItem clear-active"
                                                           data-toggle-class="btn-primary"
                                                           data-toggle-passive-class="btn-default">
                                                        <input type="radio" name="empType"
                                                               id="editemptype${Employee.FULL_TIME}"
                                                               value="${Employee.FULL_TIME}"
                                                               required> Full - Time
                                                    </label>
                                                    <label class="btn btn-default empTypeItem clear-active"
                                                           data-toggle-class="btn-primary"
                                                           data-toggle-passive-class="btn-default">
                                                        <input type="radio" name="empType"
                                                               id="editemptype${Employee.PART_TIME}"
                                                               value="${Employee.PART_TIME}"
                                                               required> Part - Time
                                                    </label>
                                                    <label class="btn btn-default empTypeItem clear-active"
                                                           data-toggle-class="btn-primary"
                                                           data-toggle-passive-class="btn-default">
                                                        <input type="radio" name="empType"
                                                               id="editemptype${Employee.TRAINING}"
                                                               value="${Employee.TRAINING}"
                                                               required> Training
                                                    </label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback"
                                             style="clear: both;">
                                            <label class="required">ประเภทการจ่าย</label>
                                            <select id="editpaytype" name="payType" class="form-control" required>
                                                <option value="" disabled>เลือกประเภทการจ่าย</option>
                                                <option value="${Employee.HOUR}">รายชั่วโมง</option>
                                                <option value="${Employee.DAY}">รายวัน</option>
                                            </select>
                                        </div>

                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                            <label class="required">ค่าจ้างต่อหน่วยเวลา</label>
                                            <input type="number" step="any" class="form-control"
                                                   placeholder="ค่าจ้างต่อหน่วยเวลา" name="pay" id="editpay"
                                                   max="999999.99" required>
                                            <span class="fa fa-bitcoin form-control-feedback right"
                                                  aria-hidden="true"></span>
                                        </div>

                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                            <label class="required">อีเมล์</label>
                                            <input type="email" class="form-control"
                                                   placeholder="อีเมล์" name="email" id="email" required>
                                            <span class="fa fa-envelope form-control-feedback right"
                                                  aria-hidden="true"></span>
                                        </div>

                                        <div class="form-group col-md-12">
                                            <label>สีป้ายชื่อพนักงานในตารางการทำงาน</label>
                                            <div class="well" style="overflow: auto">

                                                <div class="col-md-4"
                                                     style="margin-left:30%;width:40%;margin-bottom:10px;">
                                                    <a class="fc-day-grid-event fc-event" id="edit_row_example"
                                                       style="padding:7px;background-color:#000000;border-color:#000000;color:#ffffff;">
                                                        <div class="fc-content">
                                                            <span class="fc-time"> </span>
                                                            <span class="fc-title">[เช้า]  ... ชื่อพนักงาน (เสิร์ฟอาหาร)</span>
                                                        </div>
                                                    </a>
                                                </div>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <div class="input-group demo2 colorpicker-element"
                                                         id="edit_bgColor">
                                                        <input type="text" value="#000000" name="bgColor"
                                                               class="form-control">
                                                        <span class="input-group-addon">
                                                            <i style="background-color: rgb(0, 0, 0);"></i>
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <div class="input-group demo2 colorpicker-element"
                                                         id="edit_fontColor">
                                                        <input type="text" value="#FFFFFF" name="fontColor"
                                                               class="form-control">
                                                        <span class="input-group-addon">
                                                            <i style="background-color: rgb(255, 255, 255);"></i>
                                                        </span>
                                                    </div>
                                                </div>
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
                <!-- /Modal Content (EDIT EMP)-->
            </div>
        </div>
    </div>
</div>
<jsp:include page="../_include/bottomenv.jsp"/>
<script src="${contextPath}/vendors/mjolnic-bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
<%--<script src="/handmade/empindex.js"></script>--%>

<script>
    // Add Employee Modal
    $("#bgColor").colorpicker().on('changeColor', function (e) {
        $("#row_example").css('background-color', e.color.toString());
        $("#row_example").css('border-color', e.color.toString());
    });

    $("#fontColor").colorpicker().on('changeColor', function (e) {
        $("#row_example").css('color', e.color.toString());
    });

    // Edit Employee Modal
    var edit_bgColor = $("#edit_bgColor").colorpicker().on('changeColor', function (e) {
        $("#edit_row_example").css('background-color', e.color.toString());
        $("#edit_row_example").css('border-color', e.color.toString());
    });

    var edit_fontColor = $("#edit_fontColor").colorpicker().on('changeColor', function (e) {
        $("#edit_row_example").css('color', e.color.toString());
    });

    $(document).ready(function () {
        $("#datatable-employee").DataTable({
            order: [[0, "asc"]],
            columnDefs: [
                {orderable: false, targets: [-1]}
            ],
            columns: [
                {
                    data: "empName"
                },
                {
                    data: "empType"
                },
                {
                    data: "payType"
                },
                {
                    data: {
                        _: "pay.display",
                        sort: "pay.order"
                    }
                },
                {
                    data: "empNo"
                }
            ]
        });

        refresh_table();

        setInterval(refresh_table, 60000);
    });

    /////////////////////////////////////////// Function //////////////////////////////////////////

    //TODO : Add Employee Function
    $("#add_emp").submit(function () {
        var object = $("#add_emp").serialize();
        var empName = $("#empname_add").val();
        $.ajax({
            type: "POST",
            data: object,
            url: "${contextPath}/employee/manageemployee",
            success: function (result) {
                swal("สำเร็จ", "พนักงาน " + empName + " ถูกเพิ่มเรียบร้อยแล้ว", "success");
                reset_field();
                refresh_table();
                $("#addEmp").modal('toggle');
            }, error: function (result) {
                swal("ไม่สำเร็จ", "ชื่อพนักงานอาจซ้ำหรือเซิร์ฟเวอร์มีปัญหา", "error")
            }
        });
        return false;
    });

    $('.modal').on('hidden.bs.modal', function () {
        reset_field();
    });

    function reset_field() {
        $("#add_emp")[0].reset();
        $(".clear-active").removeClass('active');
    }

    //TODO : Set Employee For Editing Function
    function editEmp(empNo) {
        $.ajax({
            type: "GET",
            url: "${contextPath}/employee/ajax/getemployee/" + empNo,
            dataType: "json",
            success: function (result) {
                $("#hiddenempno").val(result.empNo);
                $("#editempname").val(result.empName);
                $("#editempgender" + result.empGender).click();
                $("#editemptel").val(result.empTel);
                $("#editemptype" + result.empType).click();
                $("#editpaytype").val(result.payType);
                $("#editpay").val((result.pay).toFixed(2));
                $("#email").val(result.email);
                if (result.admin) {
                    $("#isAdmin").parent().addClass('checked');
                    $("#isAdmin").attr('checked', true);
                } else {
                    $("#isAdmin").parent().removeClass('checked');
                    $("#isAdmin").attr('checked', false);
                }
                edit_bgColor.colorpicker('setValue', result.bgColor == '' ? '#000000' : result.bgColor);
                edit_fontColor.colorpicker('setValue', result.fontColor == '' ? '#FFFFFF' : result.fontColor);
            }
        });
    }

    //TODO : Edit Employee Function
    $("#edit_emp").submit(function () {
        var object = $("#edit_emp").serialize();
        var empName = $("#editempname").val();
        $.ajax({
            type: "POST",
            data: object,
            url: "${contextPath}/employee/manageemployee",
            success: function (result) {
                swal("สำเร็จ", "แก้ไขเรียบร้อยแล้ว", "success");
                $("#edit_emp")[0].reset();
                $(".clear-active").removeClass('active');
                $("#editEmp").modal('toggle');
                refresh_table();
            }, error: function (result) {
                swal("ไม่สำเร็จ", "ชื่อพนักงานอาจซ้ำหรือเซิร์ฟเวอร์มีปัญหา", "error");
            }
        });
        return false;
    });

    // TODO : Delete Employee Function
    function delEmp(empNo, empName) {
        swal({
                title: "ยืนยันการลบ " + empName,
                text: "เมื่อยืนยัน ข้อมูลของ " + empName + " จะหายไปทั้งหมด และไม่สามารถนำกลับมาได้",
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
                    url: "${contextPath}/employee/deleteemployee/" + empNo + "",
                    success: function (result) {
                        swal("สำเร็จ", "พนักงาน " + empName + " ถูกลบเรียบร้อยแล้ว", "success");
                        refresh_table();
                    }, error: function (result) {
                        swal("ไม่สำเร็จ", "กรุณาลองใหม่ในภายหลัง", "error");
                    }
                });
            });
    }

    function resetpassword(empName,username) {
        swal({
                title: "รีเซ็ตรหัสผ่านของ " + empName ,
                text: "ต้องการรีเซ็ตรหัสผ่านของ " + empName + " ใช่หรือไม่",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "ใช่",
                cancelButtonText: "ยกเลิก",
                closeOnConfirm: false
            },
            function () {
                $.ajax({
                    type: "PUT",
                    url: "${contextPath}/employee/",
                    success: function (result) {
                        swal("สำเร็จ", "รหัสผ่านของ " + empName + " ถูกรีเซ็ตเรียบร้อยแล้ว", "success");
                        refresh_table();
                    }, error: function (result) {
                        swal("ไม่สำเร็จ", "กรุณาลองใหม่ในภายหลัง", "error");
                    }
                });
            });
    }


    // TODO : Refresh Table
    function refresh_table() {
        $.ajax({
            type: "POST",
            url: "${contextPath}/employee/ajax/getemployees",
            dataType: "json",
            success: function (json) {
                var data_array = [];
                for (var iterator = 0; iterator < json.length; iterator++) {
                    var emp_obj = json[iterator];
                    console.log(emp_obj);
                    var pay_order = emp_obj.payType == '${Employee.HOUR}' ? (emp_obj.pay * 800 + "") : (emp_obj.pay * 100 + "");
                    for (var i = pay_order.length; i < 20; i++) {
                        pay_order = "0" + pay_order;
                    }
                    var pay_format = "" + emp_obj.pay.toFixed(2);
                    if (pay_format.length >= 7) {
                        pay_format = pay_format.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                    }
                    var data_refresh = {
                        empName: '<a style="cursor:pointer;font-weight:bold;" onclick="editEmp(' + emp_obj.empNo + ')" data-toggle="modal"' +
                        'data-target="#editEmp" style="font-weight: bold;">' + emp_obj.empName + '</a>',
                        empType: emp_obj.empType == '${Employee.FULL_TIME}' ? 'Full-Time' : (emp_obj.empType == '${Employee.PART_TIME}' ? 'Part-Time' : 'Training'),
                        payType: emp_obj.payType == '${Employee.HOUR}' ? 'รายชั่วโมง' : 'รายวัน',
                        pay: {
                            display: pay_format + ' บาท / ' + (emp_obj.payType == '${Employee.HOUR}' ? 'ชั่วโมง' : 'วัน'),
                            order: pay_order
                        },
                        empNo: (!emp_obj.branchUser ? '<a onclick="resent(' + emp_obj.empNo + ')" class="btn btn-info btn-sm"><i class="fa fa-envelope"></i>&nbsp; ส่งซ้ำ</a>' : '<a onclick="resetpassword(\'' + emp_obj.empName + '\',\'' + emp_obj.username + '\')" class="btn btn-dark btn-sm"><i class="fa fa-undo"></i>&nbsp; รีเซ็ต</a>') +
                        '<a onclick="editEmp(' + emp_obj.empNo + ')" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#editEmp"><i class="fa fa-pencil"></i>&nbsp; แก้ไข </a>' +
                        '<a onclick="delEmp(' + emp_obj.empNo + ',\'' + emp_obj.empName + '\')" class="btn btn-danger btn-sm"> <i class="fa fa-trash"></i>&nbsp; ลบ</a>'
                    };
                    data_array.push(data_refresh);
                }
                $("#datatable-employee").DataTable().clear();
                $("#datatable-employee").DataTable().rows.add(data_array).draw(false);
            }
        });
    }

    function resent(empNo) {
        $.ajax({
            type: "POST",
            url: "${contextPath}/employee/confirmresent/"+empNo,
            dataType: "json",
            success: function (result) {
                swal({
                    title: "คุณต้องการส่งซ้ำ",
                    text: "การสมัครสมาชิกของ \"" + result.empName + "\" ไปยังอีเมล",
                    type: "input",
                    showCancelButton: true,
                    closeOnConfirm: false,
                    inputPlaceholder: "Input Email",
                    inputValue: result.email
                }, function (email) {
                    if (email === false) return false;
                    if (email === "") {
                        swal.showInputError("กรุณากรอกอีเมล");
                        return false;
                    }
                    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                    if (!re.test(email)){
                        swal.showInputError("กรุณากรอกรูปแบบอีเมลให้ถูกต้อง");
                        return false;
                    }

                    $.ajax({
                        type: "POST",
                        data: {
                            'empNo' : empNo,
                            'email' : email
                        },
                        url: "${contextPath}/employee/resent",
                        success: function(){
                            swal("สำเร็จ", "ส่งซ้ำเรียบร้อยแล้ว", "success");
                        },
                        error: function(){
                            swal("ไม่สำเร็จ", "อีเมลอาจผิด กรุณาลองอีกครั้ง", "error");
                        }
                    });
                });
            }
        });
    }
    /////////////////////////////////////////// Function //////////////////////////////////////////
</script>
</body>
</html>