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
                                        <th class="table-rows" style="width: 20%">จำนวน</th>
                                        <th class="table-rows" style="width: 30%">สถานะอาหาร</th>
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
            order: [[0, "asc"]],
            columnDefs: [
                {orderable: false, targets: [-1]}
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
        setInterval(refresh_table, 5000);
    });

    function refresh_table() {
        $.ajax({
            type: "PUT",
            url: "${contextPath}/kitchen/getorders",
            dataType: "json",
            success: function (json) {
                console.log(json);
                var data_array = [];
                for (var i = 0; i < json.length; i++) {
                    var obj = json[i];
                    var amountOrder = obj.quantity + "";
                    for (var j = amountOrder.length; j < 10; j++) {
                        if (status = "waiting"){
                            amountOrder += amountOrder;
                        }
                        amountOrder = "0" + amountOrder;
                    }
                    var data_refresh = {
                        menuName: obj.menu.menuNameTH + " / " + obj.menu.menuNameEN,
                        amount: obj.quantity + " จาน",
                        status: (obj.status ? '<a onclick="change_status(' + obj.orderNo + ',\'' + obj.status + '\')" class="btn btn-default">เมนูที่ได้รับมา</a>' :
                            '<a onclick="change_status(' + obj.orderNo + ',\'' + obj.status + '\')" class="btn btn-primary">เมนูที่กำลังปรุง</a>') +
                        '<a onclick="cancel_menu(' + obj.orderNo + ',\'' + obj.status + '\' )" class="btn btn-danger">ยกเลิกเมนู</a>'
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
                swal("ออเดอร์เปลี่ยนสถานะเป็น "+ status + " แล้ว", "success");
                refresh_table();
            }
        });
    }

    function cancel_menu(orderNo, status) {
        swal({
                title: "ยืนยันการยกเลิกออเดอร์ที่ " + orderNo,
                text: "เมื่อยืนยัน ออเดอร์ที่ "+ orderNo +" ของโต๊ะ " + tableName + " จะถูกยกเลิก",
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