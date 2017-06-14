<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.springoeb.employee.model.Employee" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="include/topenv.jsp"/>
    <title>ข้อมูลพนักงาน</title>
</head>
<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <jsp:include page="include/navbar.jsp"/>
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
                                    <a href="javascript:void(0)" data-toggle="modal" data-target="#addEmp"
                                       class="btn btn-success btn-sm"><i class="fa fa-plus-circle"></i>&nbsp;
                                        เพิ่มพนักงาน</a>
                                    <button type="submit" name="submit" value="del" href="javascript:void(0)"
                                            class="btn btn-danger btn-sm" disabled><i class="fa fa-trash"></i>&nbsp;
                                        ลบที่เลือก
                                    </button>
                                </p>
                                <table id="datatable-checkbox"
                                       class="table table-striped table-bordered bulk_action1">
                                    <thead>
                                    <tr>
                                        <th><input title="checkall" type="checkbox" class="flat" id="check-all-1"
                                                   disabled></th>
                                        <th style="width:20%;text-align:center;">ชื่อ</th>
                                        <th style="width:20%;text-align:center;">ประเภท</th>
                                        <th style="width:20%;text-align:center;">ประเภทการจ้าง</th>
                                        <th style="width:20%;text-align:center;">ค่าจ้างต่อหน่วยเวลา</th>
                                        <th style="width:20%;text-align:center;">ตัวเลือก</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${employees}" var="e" varStatus="vs">
                                    <tr id="tr${e.empNo}" style="text-align:center;">
                                        <td>
                                            <input type="checkbox" name="tabdle_records" value="${e.empNo}" class="flat"
                                                   disabled>
                                        </td>
                                        <td>
                                            <a href="javascript:void(0)" onclick="editEmp(${e.empNo})"
                                               data-toggle="modal"
                                               data-target="#editEmp" style="font-weight: bold;">${e.empName}</a>
                                        </td>
                                        <td>
                                                ${e.empType == Employee.FULL_TIME ? 'Full-Time' : e.empType == Employee.PART_TIME ? 'Part-Time' : 'Training'}
                                        </td>
                                        <td>
                                            ราย${e.payType == Employee.HOUR ? 'ชั่วโมง' : 'วัน'}
                                        </td>
                                        <td>
                                            <fmt:formatNumber value="${e.pay}" pattern="#,###,###.00"/> บาท
                                            / ${e.payType == Employee.HOUR ? 'ชั่วโมง' : 'วัน'}
                                        </td>
                                        <td>
                                            <a onclick="editEmp(${e.empNo})" class="btn btn-warning btn-sm"
                                               href="javascript:void(0)" data-toggle="modal"
                                               data-target="#editEmp"><i class="fa fa-pencil"></i>&nbsp;
                                                แก้ไข </a>
                                            <a href="${pageContext}/employee/deleteemployee/${e.empNo}" )
                                               class="btn btn-danger btn-sm" href="javascript:void(0)"><i
                                                    class="fa fa-trash"></i>&nbsp; ลบ</a>
                                        </td>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- /page content -->
                <!-- Modal Content (ADD EMP)-->
                <div class="modal fade" id="addEmp" role="dialog">
                    <div class="modal-dialog">
                        <!-- เนือหาของ Modal ทั้งหมด -->
                        <div class="modal-content">
                            <!-- ส่วนหัวของ Modal -->
                            <div class="modal-header">
                                <!-- ปุ่มกดปิด (X) ตรงส่วนหัวของ Modal -->
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">เพิ่มพนักงานใหม่</h4>
                            </div>
                            <!-- ส่วนเนื้อหาของ Modal -->
                            <div class="modal-body">
                                <form class="form-horizontal form-label-left input_mask"
                                      action="${pageContext}/employee/manageemployee" method="POST" modelAttribute="employee">
                                    <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                        <input type="text" class="form-control" name="empName"
                                               placeholder="ชื่อพนักงาน" required>
                                        <span class="fa fa-user form-control-feedback right"
                                              aria-hidden="true"></span>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                            <div class="form-group">
                                                <div class="btn-group" data-toggle="buttons">
                                                    <label class="btn btn-default" data-toggle-class="btn-primary"
                                                           data-toggle-passive-class="btn-default">
                                                        <input type="radio" name="empGender" value="${Employee.MALE}"
                                                               required> &nbsp;
                                                        ชาย &nbsp;
                                                    </label>
                                                    <label class="btn btn-default" data-toggle-class="btn-primary"
                                                           data-toggle-passive-class="btn-default">
                                                        <input type="radio" name="empGender" value="${Employee.FEMALE}"
                                                               required> &nbsp;
                                                        หญิง &nbsp;
                                                    </label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                            <input type="text" class="form-control" name="empTel"
                                                   placeholder="เบอร์โทรศัพท์มือถือ">
                                            <span class="fa fa-phone form-control-feedback right"
                                                  aria-hidden="true"></span>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                            <div class="btn-group" data-toggle="buttons">
                                                <label class="btn btn-default empTypeItem"
                                                       data-toggle-class="btn-primary"
                                                       data-toggle-passive-class="btn-default">
                                                    <input type="radio" name="empType" value="${Employee.FULL_TIME}"
                                                           required> Full - Time
                                                </label>
                                                <label class="btn btn-default empTypeItem"
                                                       data-toggle-class="btn-primary"
                                                       data-toggle-passive-class="btn-default">
                                                    <input type="radio" name="empType" value="${Employee.PART_TIME}"
                                                           required> Part - Time
                                                </label>
                                                <label class="btn btn-default empTypeItem"
                                                       data-toggle-class="btn-primary"
                                                       data-toggle-passive-class="btn-default">
                                                    <input type="radio" name="empType" value="${Employee.TRAINING}"
                                                           required> Training
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback"
                                             style="clear: both;">
                                            <select name="payType" class="form-control" required>
                                                <option value="">---เลือกประเภทการจ่าย---</option>
                                                <option value="${Employee.HOUR}">รายชั่วโมง</option>
                                                <option value="${Employee.DAY}">รายวัน</option>
                                            </select>
                                        </div>

                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                            <input type="number" step="any" class="form-control"
                                                   placeholder="ค่าจ้างต่อหน่วยเวลา" name="pay" required>
                                            <span class="fa fa-bitcoin form-control-feedback right"
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
                <!-- /Modal Content (ADD EMP)-->

                <!-- Modal Content (EDIT EMP)-->
                <div class="modal fade" id="editEmp" role="dialog">
                    <div class="modal-dialog">
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
                                <form class="form-horizontal form-label-left input_mask"
                                      action="${pageContext}/employee/manageemployee" method="POST" modelAttribute="employee">
                                    <input type="hidden" name="empNo" id="hiddenempno">
                                    <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                        <input type="text" class="form-control" id="editempname" name="empName"
                                               placeholder="ชื่อพนักงาน" required>
                                        <span class="fa fa-user form-control-feedback right"
                                              aria-hidden="true"></span>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                            <div class="form-group">
                                                <div class="btn-group" data-toggle="buttons">
                                                    <label class="btn btn-default" data-toggle-class="btn-primary"
                                                           data-toggle-passive-class="btn-default"
                                                           id="editempgender${Employee.MALE}">
                                                        <input type="radio" name="empGender" value="${Employee.MALE}"
                                                               required> &nbsp;
                                                        ชาย &nbsp;
                                                    </label>
                                                    <label class="btn btn-default" data-toggle-class="btn-primary"
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
                                            <input type="text" class="form-control" name="empTel" id="editemptel"
                                                   placeholder="เบอร์โทรศัพท์มือถือ">
                                            <span class="fa fa-phone form-control-feedback right"
                                                  aria-hidden="true"></span>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                            <div class="btn-group" data-toggle="buttons">
                                                <label class="btn btn-default empTypeItem"
                                                       data-toggle-class="btn-primary"
                                                       data-toggle-passive-class="btn-default">
                                                    <input type="radio" name="empType"
                                                           id="editemptype${Employee.FULL_TIME}"
                                                           value="${Employee.FULL_TIME}"
                                                           required> Full - Time
                                                </label>
                                                <label class="btn btn-default empTypeItem"
                                                       data-toggle-class="btn-primary"
                                                       data-toggle-passive-class="btn-default">
                                                    <input type="radio" name="empType"
                                                           id="editemptype${Employee.PART_TIME}"
                                                           value="${Employee.PART_TIME}"
                                                           required> Part - Time
                                                </label>
                                                <label class="btn btn-default empTypeItem"
                                                       data-toggle-class="btn-primary"
                                                       data-toggle-passive-class="btn-default">
                                                    <input type="radio" name="empType"
                                                           id="editemptype${Employee.TRAINING}"
                                                           value="${Employee.TRAINING}"
                                                           required> Training
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback"
                                             style="clear: both;">
                                            <select id="editpaytype" name="payType" class="form-control" required>
                                                <option value="">---เลือกประเภทการจ่าย---</option>
                                                <option value="${Employee.HOUR}">รายชั่วโมง</option>
                                                <option value="${Employee.DAY}">รายวัน</option>
                                            </select>
                                        </div>

                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                            <input type="number" step="any" class="form-control"
                                                   placeholder="ค่าจ้างต่อหน่วยเวลา" name="pay" id="editpay" required>
                                            <span class="fa fa-bitcoin form-control-feedback right"
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
                <!-- /Modal Content (EDIT EMP)-->
            </div>
        </div>
    </div>
</div>
<jsp:include page="include/bottomenv.jsp"/>
<%--<script src="/handmade/empindex.js"></script>--%>
<script>
    $(document).ready(function () {

    });

    function editEmp(empNo) {
        $.ajax({
            type: "GET",
            url: "${pageContext}/employee/ajax/getemployee/" + empNo,
            dataType: "json",
            success: function (result) {
                $("#hiddenempno").val(result.empNo);
                $("#editempname").val(result.empName);
                $("#editempgender" + result.empGender).click();
                $("#editemptel").val(result.empTel);
                $("#editemptype" + result.empType).click();
                $("#editpaytype").val(result.payType);
                $("#editpay").val((result.pay).toFixed(2));
            }
        });
    }
</script>
</body>
</html>