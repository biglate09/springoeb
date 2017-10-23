<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../_include/topenv.jsp"/>
    <title>จัดการบัญชี</title>
    <link href="${contextPath}/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
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
                            <h4>จัดการบัญชี</h4>
                        </div>
                        <div class="x_content">
                            <form action="#">
                                <p>
                                    <a data-toggle="modal" data-target="#ledger_modal"
                                       class="btn btn-success btn-sm"><i class="fa fa-plus-circle"></i>&nbsp;
                                        เพิ่มรายการ</a>
                                </p>
                                <table id="datatable-ledger"
                                       class="table table-striped table-bordered bulk_action1">
                                    <thead>
                                    <tr>
                                        <th style="text-align:center;">วันที่</th>
                                        <th style="text-align:center;">ประเภท</th>
                                        <th style="text-align:center;">จำนวนเงิน</th>
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
                <!-- Modal Content-->
                <div class="modal fade" id="ledger_modal" role="dialog">
                    <div class="modal-dialog">
                        <div class="modal-content modal-body-test" style="overflow-y:hidden;">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">จัดการรายการบัญชี</h4>
                            </div>
                            <div class="modal-body">
                                <form class="form-horizontal form-label-left input_mask"
                                      id="manageLedger" modelAttribute="ledger">
                                    <input type="hidden" name="ledgerNo" id="ledgerNo">
                                    <div class="form-group">
                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                            <label class="required">ประเภทรายการบัญชี</label>
                                            <select name="ledgerTypeNo" id="ledgerTypeNo" class="form-control" required>
                                                <c:forEach items="${ledgerType}" var="l">
                                                    <option value="${l.ledgerTypeNo}">${l.ledgerTypeName}</option>
                                                </c:forEach>
                                            </select>
                                        </div>

                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                            <label class="required">วันที่ของรายการบัญชี</label>
                                            <input type="text" class="date form-control" name="date_unformat"
                                                   id="date"
                                                   placeholder="วันที่ของรายการบัญชี" required>
                                            <span class="fa fa-calendar form-control-feedback right"
                                                  aria-hidden="true"></span>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                            <label class="required">จำนวนเงิน</label>
                                            <input type="number" min="0" step="0.25" class="form-control" name="amount"
                                                   id="amount"
                                                   placeholder="จำนวนเงินที่ได้รับหรือที่ต้องจ่าย" required>
                                            <span class="fa fa-money form-control-feedback right"
                                                  aria-hidden="true"></span>
                                        </div>
                                        <div class="col-md-12 col-sm-12 col-xs-12 form-group has-feedback">
                                            <label>รายละเอียดของรายการบัญชี</label>
                                            <textarea rows="4" cols="50" class="form-control"
                                                      name="ledgerDesc"
                                                      id="ledgerDesc"
                                                      placeholder="รายละเอียด"></textarea>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <!-- ปุ่มกดปิด (Close) ตรงส่วนล่างของ Modal -->
                                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                                            <button type="submit" style="margin-left:5px;"
                                                    class="btn btn-success"><i class="fa fa-circle-o-notch fa-spin" id="loadingbtn" style="display:none"></i>
                                                 ตกลง
                                            </button>
                                            <button type="button" class="btn btn-default"
                                                    data-dismiss="modal">
                                                ยกเลิก
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /Modal Content-->
            </div>
        </div>
    </div>
</div>
<jsp:include page="../_include/bottomenv.jsp"/>
<script src="${contextPath}/vendors/moment/min/moment.min.js"></script>
<script src="${contextPath}/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
<script>
    $(document).ready(function () {
        $('.date').daterangepicker({
                locale: 'DD-MM-YYYY',
                singleDatePicker: true,
                showDropdowns: true
            }
        );

        $("#datatable-ledger").DataTable({
            order: [[0, "desc"]],
            columnDefs: [
                {orderable: false, targets: [-1]}
            ],
            columns: [
                {
                    data: {
                        _: 'date.display',
                        sort: 'date.order'
                    }
                },
                {
                    data: 'ledgerType'
                },
                {
                    data: 'amount'
                },
                {
                    data: 'option'
                },
            ]
        });

        refresh_table();
    });

    function refresh_table() {
        $.ajax({
            type: "POST",
            url: "${contextPath}/ledger/getledgers",
            dataType: "json",
            success: function (json) {
                var data_array = [];
                for (var i = 0; i < json.length; i++) {
                    var ledger = json[i];
                    var date = new Date(ledger.date);
                    var date_format = (date.getDate() < 10 ? '0' : '') + date.getDate() + "/" + (date.getMonth() + 1 < 10 ? '0' : '') + (date.getMonth() + 1) + "/" + date.getFullYear();
                    var date_order = date.getFullYear() + (date.getMonth() + 1 < 10 ? '0' : '') + (date.getMonth() + 1) + (date.getDate() < 10 ? '0' : '') + date.getDate();
                    var data_refresh = {
                        date: {
                            display: date_format,
                            order: date_order
                        },
                        ledgerType: ledger.ledgerType.ledgerTypeName,
                        amount: "<span style='color:" + (ledger.amount < 0 ? 'red' : 'green') + "'>" + ledger.amount.toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " บาท</span>",
                        option: '<a onclick = "set_ledger(' + ledger.ledgerNo + ')" class = "btn btn-warning btn-sm" data-toggle = "modal" data-target = "#ledger_modal"> <i class = "fa fa-pencil"> </i> &nbsp; แก้ไข </a>' +
                        '<a onclick = "del_ledger(' + ledger.ledgerNo + ')" class = "btn btn-danger btn-sm"> <i class = "fa fa-trash"></i> &nbsp; ลบ </a>'
                    };
                    data_array.push(data_refresh);
                }
                $("#datatable-ledger").DataTable().clear();
                $("#datatable-ledger").DataTable().rows.add(data_array).draw(false);
            }
        });
    }

    function del_ledger(ledgerNo) {
        swal({
                title: "ยืนยันการลบรายการนี้",
                text: "เมื่อยืนยัน ข้อมูลจะหายไปทั้งหมด และไม่สามารถนำกลับมาได้",
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
                    url: "${contextPath}/ledger/deleteledger/" + ledgerNo,
                    success: function (result) {
                        swal("สำเร็จ", "รายการบัญชีถูกลบเรียบร้อยแล้ว", "success");
                        refresh_table();
                    }, error: function (result) {
                        swal("ไม่สำเร็จ", "กรุณาลองใหม่ในภายหลัง", "error");
                    }
                });
            });
    }

    $("#manageLedger").submit(function () {
        $('#loadingbtn').show();
        $.ajax({
            type: "POST",
            data: $(this).serialize(),
            url: "${contextPath}/ledger/manageledger",
            success: function (result) {
                $('#loadingbtn').hide();
                swal("สำเร็จ", "รายการบัญชีถูก" + ($("#ledgerNo").val() == '' ? 'เพิ่ม' : 'แก้ไข') + "เรียบร้อยแล้ว", "success");
                reset_field();
                $("#ledger_modal").modal('toggle');
                refresh_table();
            }, error: function (result) {
                swal("ไม่สำเร็จ", "กรุณาลองใหม่ในภายหลัง", "error");
            }
        });
        return false;
    });

    $('.modal').on('hidden.bs.modal', function () {
        reset_field();
    });

    function reset_field() {
        $("#manageLedger")[0].reset();
    }

    function set_ledger(ledgerNo) {
        $.ajax({
            type: "PUT",
            url: "${contextPath}/ledger/getledger/" + ledgerNo,
            dataType: "json",
            success: function (ledger) {
                $("#ledgerName").val(ledger.ledgerName);
                $("#ledgerTypeNo").val(ledger.ledgerTypeNo);
                $("#date").val(ledger.date.substr(8, 2) + "-" + ledger.date.substr(5, 2) + "-" + ledger.date.substr(0, 4));
                $("#amount").val(ledger.amount < 0 ? ledger.amount * -1 : ledger.amount);
                $("#ledgerDesc").val(ledger.ledgerDesc);
                $("#ledgerNo").val(ledger.ledgerNo);
            }
        });
    }
</script>
</body>
</html>