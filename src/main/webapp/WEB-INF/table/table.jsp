<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../_include/topenv.jsp"/>
    <title>จัดการโต๊ะ</title>
</head>
<body class="nav-md">
<div class="container body">
    <div class="main_container">
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
                            <h4>จัดการโต๊ะ</h4>
                        </div>
                        <div class="x_content">
                            <form action="#">
                                <p>
                                    <a data-toggle="modal" data-target="#addTable"
                                       class="btn btn-success btn-sm"><i class="fa fa-plus-circle"></i>&nbsp;
                                        เพิ่มโต๊ะ
                                    </a>
                                </p>
                                <table id="datatable-table"
                                       class="table table-striped table-bordered bulk_action1">
                                    <thead>
                                    <tr>
                                        <th style="text-align:center;">ชื่อโต๊ะ</th>
                                        <th style="text-align:center;">จำนวนที่นั่ง</th>
                                        <th style="text-align:center;">สถานะ</th>
                                        <th style="text-align:center;">ตัวเลือก</th>
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
                <!-- Modal Content (ADD TABLE)-->
                <div class="modal fade" id="addTable" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <!-- เนือหาของ Modal ทั้งหมด -->
                        <div class="modal-content">
                            <!-- ส่วนหัวของ Modal -->
                            <div class="modal-header">
                                <!-- ปุ่มกดปิด (X) ตรงส่วนหัวของ Modal -->
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">เพิ่มโต๊ะใหม่</h4>
                            </div>
                            <!-- ส่วนเนื้อหาของ Modal -->
                            <div class="modal-body">
                                <form class="form-horizontal form-label-left input_mask" id="add_table"
                                      modelAttribute="table">
                                    <div class="form-group">
                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                            <label>ชื่อโต๊ะ</label>
                                            <input type="text" class="form-control" name="tableName"
                                                   placeholder="ชื่อโต๊ะ" required>
                                            <span class="fa fa-table form-control-feedback right"
                                                  aria-hidden="true"></span>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                            <label>จำนวนที่นั่ง (คน)</label>
                                            <input type="number" step="1" min="1" class="form-control" name="seatAmount"
                                                   placeholder="จำนวนที่นั่ง" required>
                                            <span class="fa fa-user form-control-feedback right"
                                                  aria-hidden="true"></span>
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
                <!-- /Modal Content (ADD TABLE)-->

                <!-- Modal Content (EDIT TABLE)-->
                <div class="modal fade" id="editTable" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <!-- เนือหาของ Modal ทั้งหมด -->
                        <div class="modal-content">
                            <!-- ส่วนหัวของ Modal -->
                            <div class="modal-header">
                                <!-- ปุ่มกดปิด (X) ตรงส่วนหัวของ Modal -->
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">แก้ไขโต๊ะ "<span id="display_table_name"></span>"</h4>
                            </div>
                            <!-- ส่วนเนื้อหาของ Modal -->
                            <div class="modal-body">
                                <form class="form-horizontal form-label-left input_mask" id="edit_table"
                                      method="POST" modelAttribute="table">
                                    <input type="hidden" name="tableNo" id="hiddentableno">
                                    <div class="form-group">
                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                            <label>ชื่อโต๊ะ</label>
                                            <input type="text" class="form-control" id="edit_table_name"
                                                   name="tableName"
                                                   placeholder="ชื่อโต๊ะ" required>
                                            <span class="fa fa-table form-control-feedback right"
                                                  aria-hidden="true"></span>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                            <label>จำนวนที่นั่ง (คน)</label>
                                            <input type="number" step="1" min="1" id="edit_seat_amount"
                                                   class="form-control" name="seatAmount"
                                                   placeholder="จำนวนที่นั่ง" required>
                                            <span class="fa fa-user form-control-feedback right"
                                                  aria-hidden="true"></span>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <!-- ปุ่มกดปิด (Close) ตรงส่วนล่างของ Modal -->
                                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                                            <button type="submit" class="btn btn-success"><i class="fa fa-circle-o-notch fa-spin" id="loadingbtnedit" style="display:none"></i> ตกลง</button>
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
                <!-- /Modal Content (EDIT TABLE)-->
            </div>
        </div>
    </div>
</div>
<jsp:include page="../_include/bottomenv.jsp"/>
<script>
    $(document).ready(function () {
        $("#datatable-table").DataTable({
            order: [[1, "asc"]],
            columnDefs: [
                {orderable: false, targets: [-1]}
            ],
            columns: [
                {
                    data: "tableName"
                },
                {
                    data: {
                        _: "seatAmount.display",
                        sort: "seatAmount.order"
                    }
                },
                {
                    data: "available"
                },
                {
                    data: "option"
                }
            ]
        });

        refresh_table();
        setInterval(refresh_table, 5000);
    });

    function refresh_table() {
        $.ajax({
            type: "POST",
            url: "${contextPath}/table/gettables",
            dataType: "json",
            success: function (json) {
                var data_array = [];
                for (var i = 0; i < json.length; i++) {
                    var table = json[i];
                    var seatAmountOrder = table.seatAmount + "";
                    for (var j = seatAmountOrder.length; j < 10; j++) {
                        seatAmountOrder = "0" + seatAmountOrder;
                    }

                    var data_refresh = {
                        tableName: '<a style="font-weight:bold;cursor:pointer;" onclick="set_table(' + table.tableNo + ')" data-toggle="modal" data-target="#editTable">' + table.tableName + '</a>',
                        seatAmount: {
                            display: table.seatAmount + " ที่นั่ง",
                            order: seatAmountOrder
                        },
                        available: (table.available ? '<span style="color:green;font-weight:bold;">ว่าง</span>' : '<span style="color:red;font-weight:bold;">ไม่ว่าง</span>'),
                        option: '<a onclick="set_table(' + table.tableNo + ')" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#editTable"><i class="fa fa-pencil"></i>&nbsp; แก้ไข </a>' +
                        '<a onclick="del_table(' + table.tableNo + ',\'' + table.tableName + '\')" class="btn btn-danger btn-sm"> <i class="fa fa-trash"></i>&nbsp; ลบ</a>'
                    };
                    data_array.push(data_refresh);
                }
                $("#datatable-table").DataTable().clear();
                $("#datatable-table").DataTable().rows.add(data_array).draw(false);
            }
        });
    }

    $("#add_table").submit(function () {
        $('#loadingbtn').show();
        var object = $(this).serialize();
        $.ajax({
            type: "POST",
            data: object,
            url: "${contextPath}/table/managetable",
            success: function (result) {
                $('#loadingbtn').hide();
                swal("สำเร็จ", "โต๊ะถูกเพิ่มเรียบร้อยแล้ว", "success");
                reset_field();
                $("#addTable").modal('toggle');
                refresh_table();
            }, error: function (result) {
                swal("ไม่สำเร็จ", "ชื่อโต๊ะอาจซ้ำ", "error");
            }
        });
        return false;
    });

    $("#edit_table").submit(function () {
        $('#loadingbtnedit').show();
        var object = $(this).serialize();
        $.ajax({
            type: "POST",
            data: object,
            url: "${contextPath}/table/managetable",
            success: function (result) {
                $('#loadingbtnedit').hide();
                swal("สำเร็จ", "โต๊ะถูกแก้ไขเรียบร้อยแล้ว", "success");
                reset_field();
                $("#editTable").modal('toggle');
                refresh_table();
            }, error: function (result) {
                swal("ไม่สำเร็จ", "ชื่อโต๊ะอาจซ้ำ", "error");
            }
        });
        return false;
    });

    function set_table(tableNo) {
        $.ajax({
            type: "PUT",
            url: "${contextPath}/table/gettable/" + tableNo,
            dataType: "json",
            success: function (result) {
                $("#hiddentableno").val(tableNo);
                $("#display_table_name").html(result.tableName);
                $("#edit_table_name").val(result.tableName);
                $("#edit_seat_amount").val(result.seatAmount);
            }
        });
    }

    function del_table(tableNo, tableName) {
        swal({
                title: "ยืนยันการลบ " + tableName,
                text: "เมื่อยืนยัน ข้อมูลของ " + tableName + " จะหายไปทั้งหมด และไม่สามารถนำกลับมาได้",
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
                    url: "${contextPath}/table/deltable/" + tableNo,
                    success: function (result) {
                        swal("สำเร็จ", "โต๊ะ " + tableName + " ถูกลบเรียบร้อยแล้ว", "success");
                        refresh_table();
                    }, error: function (xhr, status, error) {
                        swal("ไม่สำเร็จ", "กรุณาลองใหม่ในภายหลัง", "error");
                    }
                });
            }
        );
    }

    $('.modal').on('hidden.bs.modal', function () {
        reset_field();
    });

    function reset_field() {
        $("#add_table")[0].reset();
    }
</script>
</body>
</html>