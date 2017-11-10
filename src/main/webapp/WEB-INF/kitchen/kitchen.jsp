<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../_include/topenv.jsp"/>
    <title>ระบบหลังครัว</title>
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

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h4>
                                    เมนูอาหารที่ถูกสั่ง
                                </h4>
                            </div>
                            <div class="x_content">
                                <table id="datatable_kitchen_status" class="table table-striped table-bordered">
                                    <thead>
                                    <tr>
                                        <th class="table-rows" style="width: 30%">ชื่ออาหาร</th>
                                        <th class="table-rows" style="width: 20%">โต๊ะที่สั่ง</th>
                                        <th class="table-rows" style="width: 10%">จำนวน</th>
                                        <th class="table-rows" style="width: 20%">สถานะอาหาร</th>
                                        <th class="table-rows" style="width: 20%">ตัวเลือก</th>
                                    </tr>
                                    </thead>
                                    <tbody style="text-align:center;">
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Modal Content (cancel menu)-->
                <div class="modal fade" id="cancelmenu" role="dialog">
                    <div class="modal-dialog">
                        <!-- เนือหาของ Modal ทั้งหมด -->
                        <div class="modal-content">
                            <!-- ส่วนหัวของ Modal -->
                            <div class="modal-header">
                                <!-- ปุ่มกดปิด (X) ตรงส่วนหัวของ Modal -->
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">ยกเลิกเมนู <span id="display_menu_name"></span></h4>
                            </div>
                            <!-- ส่วนเนื้อหาของ Modal -->
                            <div class="modal-body">
                                <form class="form-horizontal form-label-left input_mask" modelAttribute="cancelMenu"
                                      id="cancel_menu">
                                    <input type="hidden" name="orderNo" id="hiddenorderno">
                                    <div class="form-group">
                                        <div class="col-md-6 col-sm-6col-xs-12 form-group has-feedback">
                                            <label class="required">ยกเลิกของโต๊ะ</label>
                                            <select id="cancel_table" class="form-control">
                                                <option disabled selected value="">เลือกโต๊ะ</option>
                                                <c:forEach items="${tables}" var="t">
                                                    <option value="${t.tableNo}"
                                                            class="table_opt">${t.tableName}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="col-md-6 col-sm-6col-xs-12 form-group has-feedback">
                                            <label class="required">จำนวนที่ยกเลิก</label>
                                            <select id="quantity" class="form-control">
                                                <option disabled selected value="">เลือกจำนวนที่ยกเลิก</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <!-- ปุ่มกดปิด (Close) ตรงส่วนล่างของ Modal -->
                                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                                            <button type="submit" class="btn btn-success"><i
                                                    class="fa fa-circle-o-notch fa-spin" id="loadingbtnedit"
                                                    style="display:none"></i> ตกลง
                                            </button>
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
                <!-- /Modal Content (cancel menu)-->
            </div>
        </div>
    </div>
</div>
<jsp:include page="../_include/bottomenv.jsp"/>
</body>
<script>
    $(document).ready(function () {
        $("#datatable_kitchen_status").DataTable({
            order: [[4, "asc"]],
            columnDefs: [
                {orderable: false, targets: '_all'}
            ],
            columns: [
                {
                    data: "menuName"
                },
                {
                    data: "tableName"
                },
                {
                    data: "amount"
                },
                {
                    data: "currentStatus"
                },
                {
                    data: "status"
                }
            ]
        });
        refresh_table();
        setInterval(refresh_table, 10000);
    });

    function refresh_table() {
        $.ajax({
            type: "PUT",
            url: "${contextPath}/kitchen/getmonitororders",
            dataType: "json",
            success: function (json) {
                var data_array = [];
                for (var key in json) {
                    var obj = JSON.parse(key);
                    var vals = json[key];
                    var table_str = "";
                    var orderNo = "";
                    var qty = 0;
                    var cancelmenu = "";
                    vals.forEach(function (val) {
                        table_str += val.table.tableName + " (" + val.qty + ")<br>";
                        qty += val.qty;
                        if (orderNo != "") {
                            orderNo += "-";
                        }
                        orderNo += val.orderNo;
                        if (cancelmenu != "") {
                            cancelmenu += "|";
                        }
                        cancelmenu += val.table.tableNo + "," + val.qty + "," + val.orderNo;
                    });
                    var addon_str = "";
                    obj.addOns.forEach(function (addOn) {
                        addon_str += "<br> + " + (addOn.addOn.materialItem.matItemName + " " + addOn.addOn.qty + " " + addOn.addOn.materialItem.unit.unitName);
                    });

                    var data_refresh = {
                        menuName: '<div style="text-align: left">' + obj.menu.menuNameTH + " " + addon_str + '</div>',
                        tableName: table_str,
                        amount: qty,
                        currentStatus: (obj.status == 'reserved' ? 'จองไว้แล้ว' :
                            obj.status == 'waiting' ? 'เมนูที่ได้รับมา' :
                                obj.status == 'cooking' ? ' กำลังปรุงอาหาร' :
                                    obj.status == 'ready' ? 'ปรุงอาหารเสร็จแล้ว' : '' ),

                        status: (obj.status == 'reserved' ? '<a onclick="change_status(\'' + orderNo + '\')" class="btn btn-secondary"><i class="fa fa-circle-o-notch fa-spin" id="loading' + orderNo + '" style="display:none"></i> จองไว้แล้ว</a>' :
                            obj.status == 'waiting' ? '<a onclick="change_status(\'' + orderNo + '\')" class="btn btn-default"><i class="fa fa-circle-o-notch fa-spin" id="loading' + orderNo + '" style="display:none"></i> ปรุงอาหาร</a>' :
                                obj.status == 'cooking' ? '<a onclick="change_status(\'' + orderNo + '\')" class="btn btn-primary"><i class="fa fa-circle-o-notch fa-spin" id="loading' + orderNo + '" style="display:none"></i> ปรุงสำเร็จ</a>' : '' ) +
                        '<a class="btn btn-danger" data-toggle="modal" data-target="#cancelmenu" onclick="set_cancel_option(\'' + cancelmenu + '\')">ยกเลิกเมนู</a>'
                    };
                    data_array.push(data_refresh);
                }

                $("#datatable_kitchen_status").DataTable().clear();
                $("#datatable_kitchen_status").DataTable().rows.add(data_array).draw(false);
            }, error: function (json) {
                swal("การเชื่อมต่อถูกตัดขาด", "กรุณาเช็คสัญญาณอินเทอร์เน็ต", "error");
            }
        });
    }

    function change_status(orderNo) {
        $('#loading' + orderNo).show();
        $.ajax({
            type: "POST",
            url: "${contextPath}/kitchen/changestatus/" + orderNo,
            success: function (result) {
                refresh_table();
//                $('#loading'+orderNo).hide();
            }
        });
    }

    function set_cancel_option(table_option) {
        var tb_option = table_option.split('|');
        $(".table_opt").css('display', 'none');
        $(".table_opt").attr('qty', '');
        $(".table_opt").attr('orderNo', '');
        tb_option.forEach(function (tb) {
            tb = tb.split(',');
            $(".table_opt[value='" + tb[0] + "']").css('display', 'inline-block');
            $(".table_opt[value='" + tb[0] + "']").attr('orderNo', tb[2]);
            $(".table_opt[value='" + tb[0] + "']").attr('qty', tb[1]);
        });
    }

    $("#cancel_table").change(function () {
        max = $("#cancel_table option:selected").attr('qty');
        $("#quantity").html('<option disabled="" selected="" value="">เลือกจำนวนที่ยกเลิก</option>');
        for (var i = 1; i <= max; i++) {
            $("#quantity").append('<option value="' + i + '">' + i + '</option>');
        }
    });

    $("#cancel_menu").submit(function () {
        swal({
                title: "ยืนยันการยกเลิกออเดอร์หรือไม่",
                text: "เมื่อยืนยัน ออเดอร์ของจะถูกยกเลิก",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "ใช่, ต้องการยกเลิก",
                cancelButtonText: "ไม่",
                closeOnConfirm: false
            },
            function () {
                var a = $("#cancel_table option:selected").val();
                $.ajax({
                    type: "DELETE",
                    url: "${contextPath}/kitchen/cancelorder/" + $("#cancel_table option:selected").attr('orderNo') + "-" + $("#quantity option:selected").val() + "-" + $("#cancel_table option:selected").val(),
                    success: function (result) {
                        swal("สำเร็จ", "ออเดอร์ถูกยกเลิกเรียบร้อยแล้ว", "success");
                        refresh_table();
                    }, error: function (xhr, status, error) {
                        swal("ไม่สำเร็จ", "กรุณาลองใหม่ในภายหลัง", "error");
                    }
                });
            }
        );
        return false;
    });
</script>
</html>