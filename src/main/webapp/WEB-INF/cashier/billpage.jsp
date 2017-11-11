<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../_include/topenv.jsp"/>
    <title>ประวัติใบเสร็จ</title>

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
                            <h4>ประวัติใบเสร็จ</h4>
                        </div>
                        <div class="x_content">
                            <form action="#">
                                <table id="datatable-bills"
                                       class="table table-striped table-bordered bulk_action1">
                                    <thead>
                                    <tr>
                                        <th style="width:25%;text-align:center;">โต๊ะ</th>
                                        <th style="width:25%;text-align:center;">วันที่</th>
                                        <th style="width:25%;text-align:center;">ราคาอาหาร</th>
                                        <th style="width:25%;text-align:center;">ตัวเลือก</th>
                                    </tr>
                                    </thead>
                                    <tbody style="text-align:center;">
                                    </tbody>
                                </table>
                            </form>
                        </div>
                    </div>
                    <div class="modal fade" id="viewbills" role="dialog">
                        <div class="modal-dialog">
                            <!-- เนือหาของ Modal ทั้งหมด -->
                            <div class="modal-content" style="overflow-y:hidden;font-size: large">
                                <!-- ส่วนหัวของ Modal -->
                                <div class="modal-header">
                                    <!-- ปุ่มกดปิด (X) ตรงส่วนหัวของ Modal -->
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h3 class="modal-title">ใบเสร็จ <span id="show_table_name"></span></h3>
                                </div>
                                <!-- ส่วนเนื้อหาของ Modal -->
                                <div class="modal-body">
                                    <form class="form-horizontal form-label-left input_mask" id="view_bill">
                                        <input type="hidden" name="billNo" id="hiddenbillno">
                                        <div class="row">
                                            <div class="col-md-12 col-xs-12">
                                                <div class="x_panel">
                                                    <div class="x_title">
                                                        <div style="text-align: center;font-size: larger">
                                                            ใบเสร็จรับเงิน
                                                        </div>
                                                        <div style="text-align: center;font-size: larger">${branchUser.branch.restaurant.restName} ${branchUser.branch.branchName}</div>
                                                        <div style="text-align: center;">
                                                            วันที่ <span id="showBillDate"
                                                                         style="color: #73879C"></span> <span
                                                                id="billtime" style="color: #73879C"></span>
                                                        </div>
                                                        <div id="tablename"></div>
                                                        <div class="clearfix"></div>
                                                    </div>
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
                                                                    <label class="inline-label col-md-8">ยอดเงินรวม</label>
                                                                    <div style="text-align:right;margin-right: 5%;">
                                                                        <span class="sumprice reset_element"></span>
                                                                        บาท
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12 col-sm-12 col-xs-12" id="prodesc">
                                                                </div>
                                                                <div class="col-md-12 col-sm-12 col-xs-12"
                                                                     style="font-size: larger">
                                                                    <label class="inline-label col-md-8"
                                                                           for="price">ยอดเงินสุทธิ </label>
                                                                    <div id="price"
                                                                         style="margin-right: 5%;text-align: right">
                                                                        <span class="totalprice reset_element"></span>
                                                                        บาท
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12 col-sm-12 col-xs-12">
                                                                    <label class="inline-label col-md-8"
                                                                           for="receivemoney">รับเงิน </label>
                                                                    <div id="receivemoney"
                                                                         style="margin-right: 5%;text-align: right">
                                                                        <span class="receive_money reset_element"></span>
                                                                        บาท
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12 col-sm-12 col-xs-12">
                                                                    <label class="inline-label col-md-8" for="change_bill">เงินทอน </label>
                                                                    <div id="change_bill"
                                                                         style="margin-right: 5%;text-align: right">
                                                                        <span class="change"></span> บาท
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12 col-sm-12 col-xs-12"
                                                                     style="text-align: center">********
                                                                    ขอบคุณที่ใช้บริการ ********
                                                                </div>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <!-- ปุ่มกดปิด (Close) ตรงส่วนล่างของ Modal -->
                                    <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                                        <button type="button" class="btn btn-default" style="font-size: initial"
                                                data-dismiss="modal">
                                            ปิด
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../_include/bottomenv.jsp"/>
<script>
    $(document).ready(function () {
        $("#datatable-bills").DataTable({
            order: [[0, "asc"]],
            columnDefs: [
                {orderable: false, targets: [-1]}
            ],
            columns: [
                {
                    data: 'tableName'
                },
                {
                    data: 'dateTime'
                },
                {
                    data: 'amount'
                },
                {
                    data: 'option'
                }
            ]
        });
        refresh_table();
    });

    function refresh_table() {
        $.ajax({
            type: "POST",
            url: "${contextPath}/cashier/getallbills",
            dataType: "json",
            success: function (json) {
                //remove
                $("#menu_thumbnail").empty();
                $("#menu_thumbnail_list").empty();
                var data_array = [];
                for (var i = 0; i < json.length; i++) {
                    var obj = json[i];
                    console.log(obj);
                    var showDate = obj.billDate.substr(8, 2) + "/" + obj.billDate.substr(5, 2) + "/" + obj.billDate.substr(0, 4);
                    var showTime = obj.billTime.substr(0, 2) + ":" + obj.billTime.substr(3, 2);
                    var data_refresh = {
                        tableName: '<a onclick = "set_bill(' + obj.billNo + ')" data-toggle = "modal" data-target = "#viewbills" style = "font-weight: bold;cursor:pointer;" >' + obj.table.tableName + '</a>',
                        dateTime: showDate + " " + showTime + " น.",
                        amount: obj.totalAmount.toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " บาท",
                        option: '<a onclick = "set_bill(' + obj.billNo + ')" class = "btn btn-warning btn-sm" data-toggle = "modal" data-target = "#viewbills"> <i class = "fa fa-file-text-o"> </i> &nbsp; ดูใบเสร็จ </a>'
                    };
                    data_array.push(data_refresh);
                }
                $("#datatable-bills").DataTable().clear();
                $("#datatable-bills").DataTable().rows.add(data_array).draw(false);
            }
        });
    }


    function set_bill(billNo) {
        $.ajax({
            type: "PUT",
            url: "${contextPath}/cashier/getbill/" + billNo,
            dataType: "json",
            success: function (result) {
                current_bill = result;
                billNoCurrent = billNo;
                $("#hiddenbillno").html(result.billNo);
                $("#tablename").html(result.table.tableName);
                $("#show_table_name").html(result.table.tableName);
                var showDate = result.billDate.substr(8, 2) + "/" + result.billDate.substr(5, 2) + "/" + result.billDate.substr(0, 4);
                $("#showBillDate").html(showDate);
                var showTime = result.billTime.substr(0, 2) + ":" + result.billTime.substr(3, 2);
                $("#billtime").html(showTime);
                $('.sumprice').html(result.amount.toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                var bill_change = result.receive - result.totalAmount;
                $('.change').html(bill_change.toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                $('.totalprice').html(result.totalAmount.toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                $('#prodesc').html(result.promotionDesc == null ? '' : '<label class="col-md-3">โปรโมชั่น</label>' +
                    '<div style="white-space:nowrap;overflow:hidden;text-overflow: ellipsis;text-align:right;margin-right: 5%">' + result.promotionDesc + '</div>');
                $('.receive_money').html(result.receive.toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                var str = '';
                var sameordercount = 0;
                result.orders.forEach(function (order,index,orders) {
                    sameordercount += order.quantity;
                    if(!orders[index+1] || order.menu.menuNo != orders[index+1].menu.menuNo) {
                        str += '<tr>' +
                            '<td class="quantity" style="width: 15%">' + (order.quantity == 0 ? '-' : order.quantity) + '</td>' +
                            '<td class="menu" style="width: 65%">' + order.menu.menuNameTH + '</td>' +
                            '<td class="price_all_unit" style="width: 20%;text-align: center;">' + (order.menu.menuPrice * order.quantity).toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '</td>' +
                            '</tr>';
                        order.orderAddOnList.forEach(function (addon) {
                            str += '<tr>' +
                                '<td class="quantity" style="width: 15%"></td>' +
                                '<td class="menu" style="width: 65%"> ++ ' + addon.addOn.materialItem.matItemName + '</td>' +
                                '<td class="price_all_unit" style="width: 20%;text-align: center;">' + addon.addOn.price.toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '</td>' +
                                '</tr>';
                        });
                        sameordercount = 0;
                    }
                    $('.menu_lists').html(str);
                });
            }, error: function () {
                swal("ไม่สำเร็จ", "กรุณาเช็คสัญญาณอินเทอร์เน็ต", "error");
            }
        });
    }
</script>
</body>
</html>