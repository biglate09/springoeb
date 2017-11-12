<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="com.springoeb.cashier.model.Order" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../_include/topenv.jsp"/>
    <title>แคชเชียร์</title>

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
                            <h4>
                                ระบบแคชเชียร์
                            </h4>
                        </div>
                        <div class="x_content">
                            <form action="#">
                                <div class="col-md-4 col-md-offset-8 form-group" style="padding:0px;margin-right: 5px;">
                                    <input type="text" class="form-control" id="myInput"
                                           onkeyup="filterCard()" placeholder="ค้นหาโต๊ะ...">
                                    <span class="fa fa-search form-control-feedback right"
                                          aria-hidden="true"></span>
                                </div>
                                <div id="menu_thumbnail">
                                </div>
                                <div id="error_show"></div>
                            </form>
                        </div>
                    </div>
                    <div class="modal fade" id="cashiermodal" role="dialog">
                        <div class="modal-dialog">
                            <!-- เนือหาของ Modal ทั้งหมด -->
                            <div class="modal-content modal-body-test" style="overflow-y:hidden;font-size: large">
                                <!-- ส่วนหัวของ Modal -->
                                <div class="modal-header">
                                    <!-- ปุ่มกดปิด (X) ตรงส่วนหัวของ Modal -->
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h3 class="modal-title">จ่ายเงิน <span id="show_table_name"></span>
                                    </h3>
                                </div>
                                <!-- ส่วนเนื้อหาของ Modal -->
                                <div class="modal-body">
                                    <form class="form-horizontal form-label-left input_mask" id="paybill">
                                        <input type="hidden" name="billNo" id="hiddenbillno">
                                        <div class="row">
                                            <div class="col-md-6 col-xs-12">
                                                <div class="x_panel">
                                                    <div id="printableArea">
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
                                                                        <label class="inline-label"
                                                                               for="receivemoney">รับเงิน </label>
                                                                        <div id="receivemoney"
                                                                             style="margin-right: 5%;text-align: right">
                                                                            <span class="receive_money reset_element"></span>
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
                                                </div>
                                                <button <%--onclick="printDiv('printableArea')"--%>
                                                        onClick="window.print();return false" class="btn btn-success"
                                                        style="margin-left: 40%"><i class="fa fa-print"
                                                                                    aria-hidden="true"></i> พิมพ์ใบเสร็จ
                                                </button>
                                            </div>
                                            <div class="col-md-6 col-xs-12">
                                                <div class="x_panel">
                                                    <div class="x_title">
                                                        <h4>โปรโมชั่น</h4>
                                                        <div class="clearfix"></div>
                                                    </div>
                                                    <div class="x_content">
                                                        <form class="form-horizontal form-label-left">
                                                            <div class="form-group">
                                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                                    <div class="radio">
                                                                        <label class="not_use_pro">
                                                                            <p class="not_use_pro">
                                                                                <input type="radio"
                                                                                       class="flat not_use_pro pro_selected protype"
                                                                                       protype="not_use_pro"
                                                                                       name="iCheck"
                                                                                       value="0"
                                                                                       checked>
                                                                                ไม่ใช้</p>
                                                                        </label>
                                                                    </div>
                                                                    <div class="radio">
                                                                        <label class="selected_pro">
                                                                            <input type="radio"
                                                                                   class="flat selected_pro inline-label protype"
                                                                                   protype="selected_pro"
                                                                                   value="1" name="iCheck"
                                                                                   for="select_promotion">
                                                                            <select name="promotion"
                                                                                    id="select_promotion"
                                                                                    class="form-control selected_pro"
                                                                                    style="width: 220px;float: right;margin-left: 7px">
                                                                                <option disabled selected value="">
                                                                                    เลือกโปรโมชั่น
                                                                                </option>
                                                                                <c:forEach items="${promotions}"
                                                                                           var="p">
                                                                                    <option value="${p.promotionNo}"
                                                                                            discount="${p.discount}"
                                                                                            menu_discount="<c:forEach items="${p.menuGroupPromotions}" var="mg" varStatus="vs"><c:if test="${vs.index!=0}">|</c:if>${mg.menuGroupNo}</c:forEach>"
                                                                                            name="${p.promotionNameTH}">${p.promotionNameTH}
                                                                                        (-<fmt:formatNumber
                                                                                                value="${p.discount}"
                                                                                                pattern="#0.00"/> %)
                                                                                    </option>
                                                                                </c:forEach>
                                                                            </select>
                                                                        </label>
                                                                    </div>
                                                                    <div class="radio">
                                                                        <label class="inline-label selected_other">
                                                                            <input type="radio"
                                                                                   class="flat selected_other protype"
                                                                                   value="2"
                                                                                   protype="selected_other"
                                                                                   name="iCheck" for="other"> อื่นๆ
                                                                            <input class="reset_field selected_other"
                                                                                   type="text" id="distype"
                                                                                   style="width:100px;margin-left: 10px;margin-bottom: 9px">
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="ln_solid"></div>
                                                            <div class="form-group">
                                                                <div class="col-md-12">
                                                                    <label class="inline-label"
                                                                           style="margin-left: 10%;color: green"
                                                                           for="totalprice">ยอดเงินสุทธิ</label>
                                                                    <div id="totalprice"
                                                                         style="margin-right: 5%;text-align: right">
                                                                        <span class="totalprice reset_element"></span>
                                                                        บาท
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12 inline-label" for="receive">
                                                                    <label style="margin-left: 10%;">รับเงินมา</label>
                                                                    <input type="number" class="reset_field receive"
                                                                           id="receive" placeholder="0.00" step="0.01"
                                                                           style="width: 100px;margin-left: 35%;text-align: right">
                                                                    บาท
                                                                </div>
                                                                <div class="col-md-12 inline-label">
                                                                    <label class="inline-label" for="change"
                                                                           style="margin-left: 10%;color: crimson">เงินทอน </label>
                                                                    <div id="change"
                                                                         style="margin-right: 5%;text-align: right">
                                                                        <span class="change"></span> บาท
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-offset-4 col-md-4">
                                                                    <button id="confirm" class="btn btn-warning"
                                                                            style="width: 100%;text-align: center;font-size: initial;">
                                                                        ยืนยันจ่ายเงิน <i class="fa fa-check"
                                                                                          id="done"
                                                                                          aria-hidden="true"
                                                                                          style="display:none;"></i>
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-xs-12" id="unserve">
                                                <div class="x_panel">
                                                    <div class="x_title">
                                                        <h4>เมนูที่ยังไม่เสิร์ฟ</h4>
                                                        <div class="clearfix"></div>
                                                    </div>
                                                    <div class="x_content">
                                                        <table style="width: 100%">
                                                            <thead style="font-weight: bold;">
                                                            <tr>
                                                                <td style="width: 30%;">จำนวน</td>
                                                                <td style="width: 70%;text-align: center;">
                                                                    รายการอาหาร
                                                                </td>
                                                            </tr>
                                                            </thead>
                                                            <tbody class="menu_unserve_lists">
                                                            </tbody>
                                                        </table>
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
                                                data-dismiss="modal"
                                                id="closeModal">
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
</div>
</div>
<jsp:include page="../_include/bottomenv.jsp"/>
<script>
    var realprice = 0;
    var price = 0;
    var billNoCurrent = 0;
    var current_bill;

    $(document).ready(function () {
        refresh_table();
        setInterval(refresh_table, 10000);
        2
    });

    function refresh_table() {
        $.ajax({
            type: "POST",
            url: "${contextPath}/cashier/getbills",
            dataType: "json",
            success: function (json) {
                //remove
                $("#menu_thumbnail").empty();
                $("#menu_thumbnail_list").empty();
                var data_array = [];
                for (var i = 0; i < json.length; i++) {
                    var obj = json[i];
                    var currentTime = new Date();
                    curhours = currentTime.getHours();
                    curmins = currentTime.getMinutes() == 0 ? 60 : currentTime.getMinutes();
                    usedHours = parseInt(obj.billTime.substr(0, 2));
                    usedMins = parseInt(obj.billTime.substr(3, 2)) == 0 ? 60 : parseInt(obj.billTime.substr(3, 2));
                    times = (usedMins <= curmins ? ((Math.abs(curhours - usedHours) * 60) + Math.abs(curmins - usedMins)) : ((curhours - usedHours) * 60) - (usedMins - curmins)) + " นาที";
                    refresh_price = 0;
                    var totalPerUnit = 0;
                    var complete = 0;
                    obj.orders.forEach(function (order) {
                        totalPerUnit = order.amount;
                        if (order.status != '${Order.CANCELLED}') {
                            refresh_price += totalPerUnit;
                        }
                        if (order.status == '${Order.SERVED}' || order.status == '${Order.CANCELLED}') {
                            complete++;
                        }
                    });
                    var div = '\
                        <div class="col-md-55">\
                        <div class="thumbnail thumbnail_inline">\
                        <div class="image view view-first" style="height:auto;">\
                        <img style="width: 100%;position:relative;" src="${contextPath}/images/table.png" alt="image"/>\
                        <div style="margin-left: auto;margin-right: auto;position: absolute;bottom:-14px;left: 50%;transform: translate(-50%, -50%);font-weight: bold; " class="cardname">' + obj.table.tableName + '</div>\
                        </div>\
                        <div class="caption col-md-12" style="color:#73879C">\
                        <p class="col-md-12" style="white-space:nowrap;overflow:hidden;text-overflow: ellipsis;padding:0px;" >ใช้บริการมาแล้ว : ' + times + '</p>\
                        <p class="col-md-12" style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;padding:0px;">ราคาอาหาร : ' + refresh_price.toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ",") + ' บาท</p>\
                        <p class="col-md-12" style="padding:0px;"> สถานะอาหาร : ' + (complete == obj.orders.length ? 'ครบแล้ว' : 'ยังไม่ครบ') + '</p>\
                        <div style="text-align:center;" class="col-md-12"><button type="button" class="btn btn-success" data-toggle="modal" data-target="#cashiermodal" \
                        style="width: 80%;" onclick="set_bill(' + obj.billNo + ')">จ่ายเงิน</button></div>\
                        </div>\
                        </div>\
                        </div>\
                        ';
                    $("#menu_thumbnail").append(div);
                }
                $("#error_show").html('');

                filterCard();
            }
        });
    }

    $('.modal').on('hidden.bs.modal', function () {
        reset_field();
    });

    function reset_field() {
        $(".reset_field").val('');
        $(".reset_element").html('');
        $("#select_promotion").val('');
        $("#done").css('display', 'none');
        $(".flat").iCheck('uncheck');
        $(".not_use_pro").iCheck('check');
        $('.menu_lists').empty();
        $(".change").empty();
    }

    function set_bill(billNo) {
        $.ajax({
            type: "PUT",
            url: "${contextPath}/cashier/getbill/" + billNo,
            dataType: "json",
            success: function (result) {
                $("#unserve").css('display', 'none');
                current_bill = result;
                billNoCurrent = billNo;
                $("#hiddenbillno").html(result.billNo);
                $("#tablename").html(result.table.tableName);
                $("#show_table_name").html(result.table.tableName);
                var showDate = result.billDate.substr(8, 2) + "/" + result.billDate.substr(5, 2) + "/" + result.billDate.substr(0, 4);
                $("#showBillDate").html(showDate);
                var showTime = result.billTime.substr(0, 2) + ":" + result.billTime.substr(3, 2);
                $("#billtime").html(showTime);
                price = 0;
                order_array = {};
                result.orders.forEach(function (order, index, orders) {
                    if (order.status != '${Order.CANCELLED}') {
                        var addon = '';
                        order.orderAddOnList.forEach(function (ao) {
                            if(addon != ''){
                                addon += ' , ';
                            }
                            addon += ' { "name" : "' + ao.addOn.materialItem.matItemName + '" , "price" : ' + ao.addOn.price + ' } ';
                        });
                        var keyName = ' { "menuNameTH": "' + order.menu.menuNameTH + '" , "menuPrice" : ' + order.menu.menuPrice + ' , "orderPrice" : ' + order.amount + ' , "addons" : [ ' + addon + ' ] }';
                        if (order_array[keyName]) {
                            order_array[keyName] = order_array[keyName] + order.quantity;
                        } else {
                            order_array[keyName] = order.quantity;
                        }

                        price += order.amount;
                    }
                });

                var str = "";
                for (var key in order_array) {
                    json_key = JSON.parse(key);
                    str += '<tr>' +
                        '<td class="quantity" style="width: 15%">' + order_array[key] + '</td>' +
                        '<td class="menu" style="width: 65%">' + json_key.menuNameTH + '</td>' +
                        '<td class="price_all_unit" style="width: 20%;text-align: center;">' + (json_key.menuPrice * order_array[key]).toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '</td>' +
                        '</tr>';

                    addons = json_key.addons;
                    addons.forEach(function (addon) {
                        str += '<tr>' +
                            '<td class="quantity" style="width: 15%">' + order_array[key] + '</td>' +
                            '<td class="menu" style="width: 65%">++ ' + addon.name + '</td>' +
                            '<td class="price_all_unit" style="width: 20%;text-align: center;">' + (addon.price * order_array[key]).toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '</td>' +
                            '</tr>';
                    });
                }

                $(".menu_lists").html(str);
                $('.sumprice').html(price.toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                $('.totalprice').html(price.toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                realprice = price;
            }, error: function () {
                swal("ไม่สำเร็จ", "กรุณาเช็คสัญญาณอินเทอร์เน็ต", "error");
            }
        });
    }

    function filterCard() {
        var input = $("#myInput").val();
        var hascard = false;
        $(".cardname").each(function () {
            if (($(this).text().toLowerCase()).indexOf(input.toLowerCase()) == -1) {
                $(this).parent().parent().parent().css('display', 'none');
            } else {
                $(this).parent().parent().parent().css('display', '');
                hascard = true;
            }
        });

        if (!hascard) {
            $("#error_show").html('\
                    <div class="well col-md-12" style="overflow: auto">\
                        <p style="text-align:center;font-weight:bold;"> ไม่พบข้อมูลโต๊ะ ' + $("#filter_by_category option:selected").text() + ($("#myInput").val() != '' ? (' ด้วยคำค้นหา \"' + $("#myInput").val() + '\"') : '') + ' </p>\
                    </div>\
                    ');
        } else {
            $("#error_show").html('');
        }
    }

    (function ($) {
        $(document).ready(function () {
            // Add Print Classes for Modal
            $('.modal').on('shown.bs.modal', function () {
                $('.modal,.modal-backdrop').addClass('toPrint');
                $('body').addClass('non-print');
            });
            // Remove classes
            $('.modal').on('hidden.bs.modal', function () {
                $('.modal,.modal-backdrop').removeClass('toPrint');
                $('body').removeClass('non-print');
            });
        });
    })(jQuery);

    $("#confirm").click(function () {
        type = $('input[name="iCheck"]:checked').val();
        if ($("#receive").val() >= realprice) {
            billdata = {
                totalAmount: realprice,
                amount: price,
                type: type,
                value: (type == 0 ? null : type == 1 ? $("#select_promotion option:selected").text() : $("#distype").val()),
                receive: $("#receive").val()
            };
            $.ajax({
                type: "POST",
                url: "${contextPath}/cashier/checkbill/" + billNoCurrent,
                data: billdata,
                success: function (result) {
                    swal("สำเร็จ", "ยืนยันการจ่ายเงินเรียบร้อย", "success");
                    $("#done").css('display', 'inline-block');
                    refresh_table();
                }, error: function (result) {
                    swal("ไม่สำเร็จ", "ออเดอร์ยังเสิร์ฟไม่ครบหรือมีข้อผิดพลาด กรุณาลองใหม่ภายหลัง", "error");
                }
            });
        } else {
            swal("ไม่สำเร็จ", "จำนวนเงินที่รับ น้อยกว่าค่าอาหารทั้งหมด", "error");
        }
        return false;
    });

    function cal_change() {
        var money = $("#receive").val();
        if (money == 0) {
            $(".change").html('');
        } else {
            var change = (money - realprice).toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            $(".change").html(change);
        }
    }

    $("#receive").keyup(function () {
        var rm = $(this).val();
        $('.receive_money').html(rm);
    });

    $(".protype").on('ifChanged', function () {
        if ($(this).attr('protype') == 'not_use_pro') {
            $("#proname").parent().css('display', 'none');
            $("#proname").html("");
            $("#prodis").empty();
            realprice = price;
            cal_change();
        } else if ($(this).attr('protype') == 'selected_pro') {
            pro_chosen();
        } else {
            discount_chosen();
        }
        $(".totalprice").html(realprice.toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ","));
    });

    $("#select_promotion").change(pro_chosen);
    $("#distype").keyup(discount_chosen);
    $(".receive").keyup(cal_change);

    function pro_chosen() {
        chosen_pro = $("#select_promotion :checked");
        discount = chosen_pro.attr('discount');
        if (discount != null && discount != '' && discount != 0) {
            // แบบไม่รวมทุกเมนู
            money_discount = 0;
            menu_discount = chosen_pro.attr('menu_discount').split('|');
            $("#proname").parent().css('display', 'inline-block');
            $("#proname").html(chosen_pro.attr('name'));
            $("#prodis").html(parseFloat(discount).toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " %");
            orders_arr = current_bill.orders;
            orders_arr.forEach(function (order) {
                menugroupno = order.menu.menuGroupNo;
                if (menu_discount.indexOf("" + menugroupno) != -1) {
                    money_discount += order.amount;
                }
            });
            money_discount = (discount / 100) * money_discount;
            realprice = Math.floor(price - money_discount);
        } else {
            $("#proname").parent().css('display', 'none');
            $("#proname").html('');
            $("#prodis").empty();
            realprice = price;
        }
        cal_change();
        $(".totalprice").html(realprice.toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ","));
    }

    function discount_chosen() {
        chosen_discount = $("#distype");
        discount = chosen_discount.val();
        if (discount.length > 0) {
            $("#proname").parent().css('display', 'inline-block');
            $("#proname").html('โปรโมชั่นลดพิเศษ');
            if (discount.substr(discount.length - 1, 1) == '%') {
                discount = discount.substr(0, discount.length - 1);
                realprice = Math.floor(((100 - discount) / 100) * price);
                $("#prodis").html(parseInt(discount).toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ",") + ' %');
            } else {
                if (!isNaN(discount)) {
                    realprice = Math.floor(price - discount);
                    $("#prodis").html(parseInt(discount).toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ",") + ' บาท');
                }
            }
        } else {
            $("#proname").parent().css('display', 'none');
            $("#proname").html("");
            $("#prodis").empty();
            realprice = price;
        }
        cal_change();
        $(".totalprice").html(realprice.toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ","));
    }
</script>

<style>
    .thumbnail_inline {
        height: 257px !important;
        width: 210px;
    }

    .inline-label {
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        float: left;
    }

    /*@media print {*/
    /*body * {*/
    /*visibility: hidden;*/
    /*}*/

    /*#printableArea * {*/
    /*visibility: visible;*/
    /*position: absolute;*/
    /*left: 0;*/
    /*top: 0;*/
    /*width: 57mm;*/
    /*}*/

    /*body {*/
    /*width: 57mm;*/
    /*}*/
    /*}*/

    @media print {
        Header, Footer {
            display: none !important;
        }

        body * {
            visibility: hidden;
        }

        #printableArea, #printableArea * {
            visibility: visible;
        }

        #printableArea {
            position: absolute;
            left: 3.5cm;
            margin-top: -2.3cm;
            padding: 0;
            width: 5in;
        }
    }

    @page :right {
        margin-right: 0;
    }

    @page {
        margin: 0;
        size: auto;
    }

    @media only print, print {
        /*body.non-print #product-nav,*/
        /*body.non-print #product-content,*/
        /*body.non-print #sales-forms-container,*/
        /*body.non-print #tab-quote,*/
        /*body.non-print #tab-upgrade,*/
        /*body.non-print #tab-contact,*/
        /*body.non-print #sales-form-phone,*/
        /*body.non-print .product-jumbo-strech .bottom-wrapper,*/
        /*body.non-print .panel-block-text,*/
        /*body.non-print footer,*/
        .modal-backdrop.toPrint {
            display: none !important;
            visibility: hidden !important;
        }

        .modal.toPrint {
            position: absolute;
            overflow: hidden;
            visibility: visible;
            width: 100%;
            height: 20cm;
            font-size: 80%;
            margin-top: 0%;
        }

        .modal.toPrint .nav .li {
            visibility: hidden;
        }

        .modal.toPrint .nav .li.active {
            visibility: visible;
        }
    }
</style>
</body>
</html>