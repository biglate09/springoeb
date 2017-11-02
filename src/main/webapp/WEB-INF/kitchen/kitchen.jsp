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
//        setInterval(refresh_table, 10000);
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
                    vals.forEach(function(val){
                        table_str += val.table.tableName + " (" + val.qty + " ที่)<br>";
                        qty += val.qty;
                        if(orderNo != ""){
                            orderNo += ",";
                        }
                        orderNo += val.orderNo;
                    });

                    var addon_str = "";
                    obj.addOns.forEach(function(addOn){
                        addon_str += " (" + (addOn.addOn.materialItem.matItemName + " " + addOn.addOn.qty + " " + addOn.addOn.materialItem.unit.unitName) + ")";
                    });

                    var data_refresh = {
                        menuName: obj.menu.menuNameTH + " " + addon_str,
                        tableName: table_str,
                        amount: qty + " ที่",
                        currentStatus: (obj.status == 'reserved' ? 'จองไว้แล้ว' :
                            obj.status == 'waiting' ? 'เมนูที่ได้รับมา' :
                                obj.status == 'cooking' ? ' กำลังปรุงอาหาร' :
                                    obj.status == 'ready' ? 'ปรุงอาหารเสร็จแล้ว' : '' ),

                        status: (obj.status == 'reserved' ? '<a onclick="change_status(\'' + orderNo + '\')" class="btn btn-secondary"><i class="fa fa-circle-o-notch fa-spin" id="loading'+orderNo+'" style="display:none"></i> จองไว้แล้ว</a>' :
                            obj.status == 'waiting' ? '<a onclick="change_status(\'' + orderNo + '\')" class="btn btn-default"><i class="fa fa-circle-o-notch fa-spin" id="loading'+orderNo+'" style="display:none"></i> ปรุงอาหาร</a>' :
                                obj.status == 'cooking' ? '<a onclick="change_status(\'' + orderNo + '\')" class="btn btn-primary"><i class="fa fa-circle-o-notch fa-spin" id="loading'+orderNo+'" style="display:none"></i> ปรุงสำเร็จ</a>' : '' ) +
                        '<a onclick="cancel_menu(\'' + orderNo + '\')" class="btn btn-danger">ยกเลิกเมนู</a>'
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
        $('#loading'+orderNo).show();
        $.ajax({
            type: "POST",
            url: "${contextPath}/kitchen/changestatus/" + orderNo,
            success: function (result) {
                refresh_table();
//                $('#loading'+orderNo).hide();
            }
        });
    }

    function cancel_menu(orderNo) {
        swal({
                title: "ยืนยันการยกเลิกออเดอร์ที่ " + orderNo,
                text: "เมื่อยืนยัน ออเดอร์ที่ " + orderNo + " ของโต๊ะ " + tableName + " จะถูกยกเลิก",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "ใช่, ต้องการยกเลิก",
                cancelButtonText: "ไม่",
                closeOnConfirm: false
            },
            function () {
                $.ajax({
                    type: "DELETE",
                    url: "${contextPath}/kitchen/cancelorder/" + orderNo,
                    dataType: "json",
                    success: function (result) {
                        swal("สำเร็จ", "ออเดอร์ที่ " + orderNo + " ถูกยกเลิกเรียบร้อยแล้ว", "success");
                        refresh_table();
                    }, error: function (xhr, status, error) {
                        swal("ไม่สำเร็จ", "กรุณาลองใหม่ในภายหลัง", "error");
                    }
                });
            }
        );
    }
</script>
</html>