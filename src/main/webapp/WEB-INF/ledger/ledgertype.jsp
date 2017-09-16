<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../_include/topenv.jsp"/>
    <title>จัดการประเภทบัญชี</title>
</head>
<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <jsp:include page="../_include/navbar.jsp"/>
    </div>
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
                        <h4>ประเภทบัญชี</h4>
                    </div>
                    <div class="x_content">
                        <form action="#">
                            <p>
                                <a data-toggle="modal" data-target="#addLedgerType"
                                   class="btn btn-success btn-sm"><i class="fa fa-plus-circle"></i>&nbsp;
                                    เพิ่มประเภท</a>
                            </p>
                            <table id="datatable-ledgertype"
                                   class="table table-striped table-bordered">
                                <thead>
                                <tr>
                                    <th style="width:20%;text-align:center;">ชื่อประเภทบัญชี</th>
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
            <!-- Modal Content (Add Ledger Type)-->
            <div class="modal fade" id="addLedgerType" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">เพิ่มประเภทบัญชี</h4>
                        </div>
                        <div class="modal-body">
                            <form class="form-horizontal form-label-left input_mask" modelAttribute="ledgerType"
                                  id="ledger_type">
                                <div class="form-group">
                                    <div class="col-md-12 col-sm-12 col-xs-12 form-group has-feedback">
                                        <label class="required">ชื่อประเภทบัญชี</label>
                                        <input type="text" class="form-control" name="ledgerTypeName"
                                               id="ledger_type_name"
                                               placeholder="ชื่อประเภทบัญชี" required>
                                        <span class="fa fa-pencil form-control-feedback right"
                                              aria-hidden="true"></span>
                                    </div>
                                    <div class="col-md-12 col-sm-12 col-xs-12 form-group has-feedback">
                                        <label class="required">ประเภทบัญชีรายรับ/รายจ่าย</label>
                                        <select class="form-control" name="ledgerPayNo"
                                               id="pay_type" required>
                                            <option disabled selected value="">เลือกประเภทบัญชี</option>
                                            <option value="2">บัญชีรายรับ</option>
                                            <option value="1">บัญชีรายจ่าย</option>
                                        </select>
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
            <!-- /Modal Content (Add Ledger Type)-->

            <!-- Modal Content (Edit Ledger Type)-->
            <div class="modal fade" id="editLedgerType" role="dialog">
                <div class="modal-dialog">
                    <!-- เนือหาของ Modal ทั้งหมด -->
                    <div class="modal-content">
                        <!-- ส่วนหัวของ Modal -->
                        <div class="modal-header">
                            <!-- ปุ่มกดปิด (X) ตรงส่วนหัวของ Modal -->
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">แก้ไขประเภทบัญชี "<span id="show_ledger_type_name"></span>"</h4>
                        </div>
                        <!-- ส่วนเนื้อหาของ Modal -->
                        <div class="modal-body">
                            <form class="form-horizontal form-label-left input_mask" modelAttribute="ledgerType"
                                  id="ledger_type_edit">
                                <input type="hidden" name="ledgerTypeNo" id="hiddenledgertypeno">
                                <div class="form-group">
                                    <div class="col-md-12 col-sm-12 col-xs-12 form-group has-feedback">
                                        <label class="required">ชื่อประเภทบัญชี</label>
                                        <input type="text" class="form-control" id="edit_ledger_type_name"
                                               name="ledgerTypeName"
                                               placeholder="ชื่อประเภทบัญชี" required>
                                        <span class="fa fa-pencil form-control-feedback right"
                                              aria-hidden="true"></span>
                                    </div>
                                    <div class="col-md-12 col-sm-12 col-xs-12 form-group has-feedback">
                                        <label class="required">ประเภทบัญชีรายรับ/รายจ่าย</label>
                                        <select class="form-control" name="ledgerPayNo"
                                                id="edit_pay_type" required>
                                            <option disabled selected value="">เลือกประเภทบัญชี</option>
                                            <option value="2">บัญชีรายรับ</option>
                                            <option value="1">บัญชีรายจ่าย</option>
                                        </select>
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
            <!-- /Modal Content (Edit Ledger Type)-->
        </div>
    </div>
</div>
<jsp:include page="../_include/bottomenv.jsp"/>
<script>
    $(document).ready(function () {
        $("#datatable-ledgertype").DataTable({
            order: [[0, "asc"]],
            columnDefs: [
                {orderable: false, targets: [-1]}
            ],
            columns: [
                {
                    data: 'ledgerTypeName'
                },
                {
                    data: 'option'
                }
            ]
        });

        refresh_table();
    });

    $("#ledger_type").submit(function () {
        var object = $(this).serialize();
        $.ajax({
            type: "POST",
            data: object,
            url: "${contextPath}/ledger/manageledgertype",
            success: function (result) {
                swal("สำเร็จ", "ประเภท " + $("#ledger_type_name").val() + " ถูกเพิ่มเรียบร้อยแล้ว", "success");
                reset_field();
                $("#addLedgerType").modal('toggle');
                refresh_table();
            }, error: function (result) {
                swal("ไม่สำเร็จ", "ชื่อประเภทอาจซ้ำหรือเซิร์ฟเวอร์มีปัญหา", "error");
            }
        });
        return false;
    });

    $('.modal').on('hidden.bs.modal', function () {
        reset_field();
    });

    function reset_field() {
        $("#ledger_type")[0].reset();
    }

    function setLedgerType(ledgerTypeNo) {
        $.ajax({
            type: "PUT",
            url: "${contextPath}/ledger/getledgertype/" + ledgerTypeNo,
            dataType: "json",
            success: function (result) {
                $("#hiddenledgertypeno").val(result.ledgerTypeNo);
                $("#edit_ledger_type_name").val(result.ledgerTypeName);
                $("#show_ledger_type_name").html(result.ledgerTypeName);
                $("#edit_pay_type").val(result.ledgerPayNo);
            }
        });
    }

    $("#ledger_type_edit").submit(function () {
        var object = $(this).serialize();
        $.ajax({
            type: "POST",
            data: object,
            url: "${contextPath}/ledger/manageledgertype",
            success: function (result) {
                swal("สำเร็จ", "แก้ไขเรียบร้อยแล้ว", "success");
                $("#editLedgerType").modal('toggle');
                refresh_table();
            }, error: function (result) {
                swal("ไม่สำเร็จ", "เซิร์ฟเวอร์อาจมีปัญหา", "error");
            }
        });
        return false;
    });

    function delLedgerType(ledgerTypeNo, ledgerTypeName) {
        swal({
                title: "ยืนยันการลบ " + ledgerTypeName,
                text: "เมื่อยืนยัน จะไม่สามารถนำข้อมูล " + ledgerTypeName + " กลับมาได้",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "ใช่, ต้องการลบ",
                cancelButtonText: "ยกเลิก",
                closeOnConfirm: false
            },
            function () {
                $.ajax({
                    type: "DELETE",
                    url: "${contextPath}/" + ledgerTypeNo,
                    success: function (result) {
                        swal("สำเร็จ", ledgerTypeName + " ถูกลบเรียบร้อยแล้ว", "success");
                        refresh_table();
                    }, error: function (result) {
                        swal("ไม่สำเร็จ", "ลบไม่ได้เนื่องจาก มีบัญชีที่อยู่ในบัญชีประเภทนี้อยู่", "error");
                    }
                });
            });
    }

    function refresh_table() {
        $.ajax({
            type: "POST",
            url: "${contextPath}/ledger/getledgertypes",
            dataType: "json",
            success: function (json) {
                var data_array = [];
                for (var iterator = 0; iterator < json.length; iterator++) {
                    var obj = json[iterator];
                    var data_refresh = {
                        ledgerTypeName: '<a onclick = "setLedgerType(' + obj.ledgerTypeNo + ',\'' + obj.ledgerTypeName + '\')" data-toggle = "modal" data-target = "#editLedgerType" style = "font-weight: bold;cursor:pointer;" >' + obj.ledgerTypeName + '</a>',
                        option: '<a onclick = "setLedgerType(' + obj.ledgerTypeNo + ',' + obj.ledgerPayNo + ')" class = "btn btn-warning btn-sm" data-toggle = "modal" data-target = "#editLedgerType"> <i class = "fa fa-pencil"> </i> &nbsp; แก้ไข </a>' +
                        '<a onclick = "delLedgerType(' + obj.ledgerTypeNo + ',\'' + obj.ledgerTypeName + '\')" class = "btn btn-danger btn-sm"> <i class = "fa fa-trash"></i> &nbsp; ลบ </a>'
                    };
                    data_array.push(data_refresh);
                }
                $("#datatable-ledgertype").DataTable().clear();
                $("#datatable-ledgertype").DataTable().rows.add(data_array).draw(false);
            }
        });
    }

    function delLedgerType(ledgerTypeNo, ledgerTypeName) {
        swal({
                title: "ยืนยันการลบ " + ledgerTypeName,
                text: "เมื่อยืนยัน จะไม่สามารถนำข้อมูลกลับมาได้",
                type: "warning",
                showCancelButton: true,
                cancelButtonText: "ยกเลิก",
                confirmButtonText: "ใช่, ต้องการลบ",
                confirmButtonColor: "#DD6B55",
                closeOnConfirm: false

            },
            function () {
                $.ajax({
                    type: "DELETE",
                    url: "${contextPath}/ledger/deleteledgertype/" + ledgerTypeNo,
                    success: function (json) {
                        swal("สำเร็จ", "ลบประเภท " + ledgerTypeName + " เรียบร้อยแล้ว", "success");
                        refresh_table();
                    },
                    error: function (json) {
                        swal("ไม่สำเร็จ", "กรุณาลองใหม่อีกครั้ง", "error");
                    }
                });
            }
        );
    }

</script>
</body>
</html>