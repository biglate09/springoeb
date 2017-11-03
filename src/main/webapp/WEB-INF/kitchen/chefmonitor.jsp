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
                            <div class="x_content">
                                <table id="datatable_kitchen_status" class="table table-striped table-bordered">
                                    <thead>
                                    <tr>
                                        <th class="table-rows" style="width: 60%"><h1>ชื่ออาหาร</h1></th>
                                        <th class="table-rows" style="width: 20%"><h1>จำนวน</h1></th>
                                        <th class="table-rows" style="width: 20%"><h1>สถานะอาหาร</h1></th>
                                    </tr>
                                    </thead>
                                    <tbody style="text-align:center;font-size: 250%">
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
            order: [[2, "asc"]],
            columnDefs: [
                {orderable: false, targets: '_all'}
            ],
            columns: [
                {
                    data: "menuName"
                },
                {
                    data: "amount"
                },
                {
                    data: "status"
                }
            ]
        });
        refresh_table();
//        setInterval(refresh_table, 15000);
    });

    function refresh_table() {
        $.ajax({
            type: "PUT",
            url: "${contextPath}/kitchen/getcheforders",
            dataType: "json",
            success: function (json) {
                console.log(json);
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
                        addon_str += "<br>+ " + (addOn.addOn.materialItem.matItemName + " " + addOn.addOn.qty + " " + addOn.addOn.materialItem.unit.unitName);
                    });

                    var data_refresh = {
                        menuName: '<p style="font-weight: bold;text-align: left;">' + obj.menu.menuNameTH + " " + addon_str + '</p>',
                        amount: qty + " ที่",
                        status: (obj.status == 'waiting' ? ('<img src="../images/ordered.png" style="width: 100px;height: auto;">') : ('<img src="../images/cooking.png" style="width: 100px;height: auto;">'))
                    };
                    data_array.push(data_refresh);
                }

                $("#datatable_kitchen_status").DataTable().clear();
                $("#datatable_kitchen_status").DataTable().rows.add(data_array).draw(false);
            }
        });
    }

    function change_status(orderNo, status) {
        $.ajax({
            type: "POST",
            url: "${contextPath}/kitchen/changestatus/" + orderNo,
            dataType: "json",
            success: function (result) {
                swal("ออเดอร์เปลี่ยนสถานะเป็น " + status + " แล้ว", "success");
                refresh_table();
            }
        });
    }

    function cancel_menu(orderNo, status) {
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