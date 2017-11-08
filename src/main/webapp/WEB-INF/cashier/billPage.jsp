<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../_include/topenv.jsp"/>
    <title>ตำแหน่งพนักงาน</title>

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
                            <h4>ใบเสร็จ</h4>
                        </div>
                        <div class="x_content">
                            <form action="#">
                                <p>
                                    <a data-toggle="modal" data-target="#addEmpPos"
                                       class="btn btn-success btn-sm"><i class="fa fa-plus-circle"></i>&nbsp;
                                        เพิ่มตำแหน่ง</a>
                                </p>
                                <table id="datatable-position"
                                       class="table table-striped table-bordered bulk_action1">
                                    <thead>
                                    <tr>
                                        <th style="width:20%;text-align:center;">โต๊ะที่</th>
                                        <th style="width:20%;text-align:center;">วันที่</th>
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
                <!--Modal Content-->
                <div class="modal fade" id="addEmpPos" role="dialog">
                    <div class="modal-dialog">
                        <!-- เนือหาของ Modal ทั้งหมด -->
                        <div class="modal-content">
                            <!-- ส่วนหัวของ Modal -->
                            <div class="modal-header">
                                <!-- ปุ่มกดปิด (X) ตรงส่วนหัวของ Modal -->
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">ใบเสร็จโต๊ะที่</h4>
                            </div>
                            <!-- ส่วนเนื้อหาของ Modal -->
                            <div class="modal-body">
                                <form class="form-horizontal form-label-left input_mask" modelAttribute="employeeposition" id="emp_pos_add">
                                    <div class="form-group">

                                        <div class="x_content">
                                            <form class="form-horizontal form-label-left">
                                                <div class="form-group">
                                                    <table style="width: 100%">
                                                        <thead style="font-weight: bold;">
                                                        <tr>
                                                            <td style="width: 15%;">จำนวน</td>
                                                            <td style="width: 65%;text-align: center;">
                                                                รายการอาหาร
                                                            </td>
                                                            <td style="width: 20%;text-align: center;">
                                                                ราคา
                                                            </td>
                                                        </tr>
                                                        </thead>
                                                        <tbody class="menu_lists">
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div class="ln_solid"></div>
                                                <div class="form-group">
                                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                                        <label class="inline-label">ยอดเงินรวม</label>
                                                        <div style="text-align:right;margin-right: 5%;">
                                                            <span class="sumprice reset_element"></span>
                                                            บาท
                                                        </div>
                                                    </div>
                                                    <div class="col-md-12 col-sm-12 col-xs-12"
                                                         style="text-align: right;display:none;">
                                                        <%--<span class="col-md-2">-----</span>--%>
                                                        <span class="col-md-6" id="proname"
                                                              style="white-space:nowrap;overflow:hidden;text-overflow: ellipsis;padding:0px;text-align: left"></span>
                                                        <span id="prodis"
                                                              style="text-align:right;margin-right: 5%;"></span>
                                                    </div>
                                                    <div class="col-md-12 col-sm-12 col-xs-12"
                                                         style="font-size: larger">
                                                        <label class="inline-label"
                                                               for="price">ยอดเงินสุทธิ </label>
                                                        <div id="price"
                                                             style="margin-right: 5%;text-align: right">
                                                            <span class="totalprice reset_element"></span>
                                                            บาท
                                                        </div>
                                                    </div>
                                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                                        <label class="inline-label" for="change_bill">เงินทอน </label>
                                                        <div id="change_bill"
                                                             style="margin-right: 5%;text-align: right">
                                                            <span class="change"></span> บาท
                                                        </div>
                                                    </div>
                                                    <div class="col-md-12 col-sm-12 col-xs-12"
                                                         id="promotion"></div>
                                                    <div class="col-md-12 col-sm-12 col-xs-12"
                                                         style="text-align: center">********
                                                        ขอบคุณที่ใช้บริการ ********
                                                    </div>
                                                </div>
                                            </form>
                                        </div>

                                    </div>
                                    <div class="modal-footer">
                                        <!-- ปุ่มกดปิด (Close) ตรงส่วนล่างของ Modal -->
                                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                                            <button type="submit" class="btn btn-success"><i class="fa fa-circle-o-notch fa-spin" id="loadingbtn" style="display:none"></i> ตกลง</button>
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
                <!--Modal Content-->
            </div>
        </div>
    </div>
</div>
<jsp:include page="../_include/bottomenv.jsp"/>
<script>
    $(document).ready(function () {
        $("#datatable-position").DataTable({
            order: [[0, "asc"]],
            columnDefs: [
                {orderable: false, targets: [-1]}
            ],
            columns: [
                {
                    data: 'empPos'
                },
                {
                    data: 'option'
                }
            ]
        });

        refresh_table();
        setInterval(refresh_table, 60000);
    });

    //TODO: Add Employee Position
    $("#emp_pos_add").submit(function(){
        var object = $("#emp_pos_add").serialize();
        $('#loadingbtn').show();
        $.ajax({
            type: "POST",
            data: object,
            url: "${contextPath}/employee/manageemployeeposition",
            success: function (result) {
                $('#loadingbtn').hide();
                swal("สำเร็จ", "ตำแหน่ง " + $("#emp_pos_name_add").val() + " ถูกเพิ่มเรียบร้อยแล้ว", "success");
                reset_field();
                $("#addEmpPos").modal('toggle');
                refresh_table();
            },error: function(result){
                $('#loadingbtn').hide();
                swal("ไม่สำเร็จ", "กรุณาลองใหม่ในภายหลัง", "error");
            }
        });
        return false;
    });

    $('.modal').on('hidden.bs.modal', function(){
        reset_field();
    });

    function reset_field(){
        $("#emp_pos_add")[0].reset();
    }

    //TODO: Set Employee Position Function For Editing
    function setEmpPos(empPosNo) {
        $.ajax({
            type: "GET",
            url: "${contextPath}/employee/ajax/getemployeeposition/" + empPosNo,
            dataType: "json",
            success: function (result) {
                $("#hiddenempposno").val(result.empPosNo);
                $("#editempposname").val(result.empPosName);
                $("#empposnamedit").html(result.empPosName);
            }
        });
    }

    //TODO: Edit Employee Position
    $("#emp_pos_edit").submit(function(){
        $('#loadingbtnedit').show();
        var object = $("#emp_pos_edit").serialize();
        $.ajax({
            type: "POST",
            data: object,
            url: "${contextPath}/employee/manageemployeeposition",
            success: function (result) {
                $('#loadingbtnedit').hide();
                swal("สำเร็จ", "แก้ไขเรียบร้อยแล้ว", "success");
                $("#emp_pos_edit")[0].reset();
                $("#editEmpPos").modal('toggle');
                refresh_table();
            },error: function(result){
                $('#loadingbtnedit').hide();
                swal("ไม่สำเร็จ", "ชื่อตำแหน่งอาจซ้ำหรือเซิร์ฟเวอร์มีปัญหา", "error");
            }
        });
        return false;
    });

    //TODO: Delete Employee Position
    function delEmpPos(empPosNo,empPosName){
        swal({
                title: "ยืนยันการลบ " + empPosName,
                text: "เมื่อยืนยัน จะไม่สามารถนำข้อมูล " + empPosName + " กลับมาได้",
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
                    url: "${contextPath}/employee/deleteemployeeposition/" + empPosNo,
                    success: function (result) {
                        swal("สำเร็จ", empPosName + " ถูกลบเรียบร้อยแล้ว", "success");
                        refresh_table();
                    }, error: function (result) {
                        swal("ไม่สำเร็จ", "ชื่อตำแหน่งอาจซ้ำหรือเซิร์ฟเวอร์มีปัญหา", "error");
                    }
                });
            });
    }

    //TODO: Refresh Table Function
    function refresh_table() {
        $.ajax({
            type: "POST",
            url: "${contextPath}/employee/ajax/getemployeepositions",
            dataType: "json",
            success: function (json) {
                var data_array = [];
                for (var iterator = 0; iterator < json.length; iterator++) {
                    var emp_pos_obj = json[iterator];
                    var data_refresh = {
                        empPos: '<a onclick = "setEmpPos(' + emp_pos_obj.empPosNo + ')" data-toggle = "modal" data-target = "#editEmpPos" style = "font-weight: bold;cursor:pointer;" >' + emp_pos_obj.empPosName + '</a>',
                        option: '<a onclick = "setEmpPos(' + emp_pos_obj.empPosNo + ')" class = "btn btn-warning btn-sm" data-toggle = "modal" data-target = "#editEmpPos"> <i class = "fa fa-pencil"> </i> &nbsp; แก้ไข </a>' +
                        '<a onclick = "delEmpPos(' + emp_pos_obj.empPosNo + ',\'' + emp_pos_obj.empPosName +'\')") class = "btn btn-danger btn-sm"> <i class = "fa fa-trash"></i> &nbsp; ลบ </a>'
                    };
                    data_array.push(data_refresh);
                }
                $("#datatable-position").DataTable().clear();
                $("#datatable-position").DataTable().rows.add(data_array).draw(false);
            }
        });
    }
</script>
</body>
</html>