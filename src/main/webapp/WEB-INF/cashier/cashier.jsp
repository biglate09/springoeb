<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="com.springoeb.branch.model.Branch" %>
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
                    <div class="modal fade" id="cashier" role="dialog">
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
                                <div class="modal-body" >
                                    <form class="form-horizontal form-label-left input_mask" id="paybill">
                                    <input type="hidden" name="billNo" id="hiddenbillno">
                                    <div class="row">
                                        <div class="col-md-6 col-xs-12">
                                            <div class="x_panel">
                                                <div class="x_title">
                                                    <div style="text-align: center;font-size: larger">ใบเสร็จรับเงิน</div>
                                                    <div style="text-align: center;font-size: larger">${branchUser.branch.restaurant.restName} ${branchUser.branch.branchName}</div>
                                                    <div style="text-align: center;">
                                                        วันที่ <span id="billdate" style="color: #73879C"></span>  เวลา <span id="billtime" style="color: #73879C"></span> น.
                                                    </div>
                                                    <div id="tablename"></div>
                                                    <div class="clearfix"></div>
                                                </div>
                                                <div class="x_content">
                                                    <form class="form-horizontal form-label-left">
                                                        <div class="form-group">
                                                            <table style="width: 100%">
                                                                <thead>
                                                                <tr>
                                                                    <td style="width: 15%;">จำนวน</td>
                                                                    <td style="width: 65%;text-align: center;">รายการอาหาร</td>
                                                                    <td style="width: 20%;text-align: center;">ราคา</td>
                                                                </tr>
                                                                </thead>
                                                                <tbody>
                                                                <tr name="menu_lists">
                                                                    <td class="quantity" style="width: 15%"></td>
                                                                    <td class="menu" style="width: 65%"></td>
                                                                    <td class="price" style="width: 20%;text-align: center;"></td>
                                                                </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                        <div class="ln_solid"></div>
                                                        <div class="form-group">
                                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                                <label class="inline-label" for="price">ยอดสุทธิ </label>
                                                                <div class="totalprice" id="price" style="margin-left: 75%;"></div>
                                                            </div>
                                                            <div class="col-md-12 col-sm-12 col-xs-12" id="promotion"></div>
                                                            <div class="col-md-12 col-sm-12 col-xs-12" style="text-align: center">**** ขอบคุณที่ใช้บริการ ****</div>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
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
                                                                    <label>
                                                                        <input type="radio" class="flat" name="iCheck"> โปรโมชั่น 1
                                                                    </label>
                                                                </div>
                                                                <div class="radio">
                                                                    <label>
                                                                        <input type="radio" class="flat" name="iCheck"> โปรโมชั่น 2
                                                                    </label>
                                                                </div>
                                                                <div class="radio">
                                                                    <label class="inline-label">
                                                                        <input type="radio" class="flat" name="iCheck" for="other"> อื่นๆ <input class="reset_field" type="number" id="other" style="width:100px;margin-left: 10px;margin-bottom: 9px">
                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="ln_solid"></div>
                                                        <div class="form-group">
                                                            <%--<form oninput="x.value=parseInt(a.value)+parseInt(b.value)">--%>
                                                            <div class="col-md-11">
                                                                <label class=" inline-label" for="totalprice" style="margin-left: 10%;color: green">ยอดสุทธิ </label>
                                                                <div id="totalprice" name="totalprice" style="margin-left: 75%;text-align: right">120.00 บาท</div>
                                                            </div>
                                                            <div class="col-md-11 inline-label" for="receive">
                                                                <label style="margin-left: 10%;">รับเงินมา</label>
                                                                <input type="number" class="reset_field" name="receive" id="receive" style="width: 100px;margin-left: 36%;text-align: right"> บาท
                                                            </div>
                                                            <div class="col-md-11 inline-label" >
                                                                <label class=" inline-label" for="change" style="margin-left: 10%;color: crimson">ทอนเงิน </label>
                                                                <div id="change" name="change" style="margin-left: 75%;text-align: right">0.00 บาท</div>
                                                            </div>
                                                            <div class="col-md-offset-5 col-md-3">
                                                                <button type="submit" class="btn btn-warning" style="width: 100%;text-align: center"><i class="fa fa-circle-o-notch fa-spin"  style="display:none"></i>
                                                                    ยืนยัน</button>
                                                            </div>
                                                            <%--</form>--%>
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
                                            <button type="submit" class="btn btn-success"><i class="fa fa-circle-o-notch fa-spin" id="loadingbtnedit" style="display:none"></i>
                                                ตกลง</button>
                                            <button type="button" class="btn btn-default" data-dismiss="modal">
                                                ยกเลิก
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
    $(document).ready(function () {
        $('.price').change(function(){
            var total = 0;
            $('.price').each(function(){
                if($(this).val() != '')
                {
                    total += parseInt($(this).val()) + " บาท";
                }
            });
            $('.totalprice').html(total);
        });
        refresh_table()
    });


    function refresh_table() {
        $.ajax({
            type: "POST",
            url: "${contextPath}/cashier/getbills" ,
            dataType: "json",
            success: function (json) {
                //remove
                $("#menu_thumbnail").empty();
                $("#menu_thumbnail_list").empty();
                var data_array = [];
                for (var i = 0; i < json.length; i++) {
                    var obj = json[i];

//                    // using static methods
//                    var start = Date.now();
//                    // the event you'd like to time goes here:
//    //                doSomethingForALongTime();
//                    var end = Date.now();
//                    var elapsed = end - start; // time in milliseconds
//                    var difference = new Date(elapsed);
//                    //If you really want the hours/minutes,
//                    //Date has functions for that too:
//                    var diff_hours = difference.getHours();
//                    var diff_mins = difference.getMinutes();
                    //Gallery
                    console.log(json);
                    var div = '\
                        <div class="col-md-55">\
                        <div class="thumbnail thumbnail_inline">\
                        <div class="image view view-first" style="height:auto;">\
                        <img style="width: 100%;position:relative;" src="${contextPath}/images/table.png" alt="image"/>\
                        <div style="margin-left: auto;margin-right: auto;position: absolute;bottom:-14px;left: 50%;transform: translate(-50%, -50%);font-weight: bold; " class="cardname">' + obj.table.tableName + '</div>\
                        </div>\
                        <div class="caption col-md-12" style="color:#73879C">\
                        <p class="col-md-12" style="white-space:nowrap;overflow:hidden;text-overflow: ellipsis;padding:0px;" >ใช้บริการมาแล้ว : ' + obj.billTime + ' นาที</p>\
                        <p class="col-md-12" style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;padding:0px;">ราคาอาหาร : ' + obj.totalAmount + ' บาท</p>\
                        <p class="col-md-12" style="padding:0px;"> สถานะอาหาร : ครบแล้ว</p>\
                        <div style="text-align:center;" class="col-md-12"><button type="button" class="btn btn-success" data-toggle="modal" data-target="#cashier" \
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
        $(".flat").iCheck('uncheck');
    }

    function set_bill(billNo) {
        $.ajax({
            type: "PUT",
            url: "${contextPath}/cashier/getbill/" + billNo,
            dataType: "json",
            success: function (result) {
                $("#hiddenbillno").html(result.billNo);
                $("#billdate").html(result.billDate);
                $("#billtime").html(result.billTime);
                $("#tablename").html(result.table.tableName);
                $("#show_table_name").html(result.table.tableName);

                for ()

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
        float:left;
    }


</style>
</body>
</html>