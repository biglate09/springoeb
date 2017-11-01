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
                                    <%--<div class="col-md-55">--%>
                                        <%--<div class="thumbnail thumbnail_inline">--%>
                                            <%--<div class="image view view-first">--%>
                                                <%--<img style="width: 100%;position:relative;" src="${contextPath}/images/table.png" alt="image"/>--%>
                                                <%--<div style="margin-left: auto;margin-right: auto;position: absolute;left: 50%;transform: translate(-50%, -50%);font-weight: bold; " class="cardname">โต๊ะ 1</div>--%>
                                            <%--</div>--%>
                                            <%--<div class="caption col-md-12" style="color:#73879C">--%>
                                                <%--<p class="col-md-12" style="white-space:nowrap;overflow:hidden;text-overflow: ellipsis;" onclick="set_menu(' + menu.menuNo + ')">ใช้บริการมาแล้ว : 15 นาที</p>--%>
                                                <%--<p class="col-md-12" style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;">ราคาอาหาร : 135 บาท</p>--%>
                                                <%--<p class="col-md-12" > สถานะอาหาร : ครบแล้ว</p>--%>
                                                <%--<div style="text-align:center;" class="col-md-12"><button type="button" class="btn btn-success" data-toggle="modal" data-target="#editMenu" data-toggle="modal" data-target="#editMenu" style="width: 80%;">จ่ายเงิน</button></div>--%>
                                            <%--</div>--%>
                                        <%--</div>--%>
                                    <%--</div>--%>
                                </div>
                                <div id="error_show"></div>
                                </form>
                        </div>
                    </div>
                    <div class="modal fade" id="editMenu" role="dialog">
                        <div class="modal-dialog">
                            <!-- เนือหาของ Modal ทั้งหมด -->
                            <div class="modal-content modal-body-test" style="overflow-y:hidden;">
                                <!-- ส่วนหัวของ Modal -->
                                <div class="modal-header">
                                    <!-- ปุ่มกดปิด (X) ตรงส่วนหัวของ Modal -->
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">จ่ายเงิน <span id="show_menu_name_for_edit"></span>
                                    </h4>
                                </div>
                                <!-- ส่วนเนื้อหาของ Modal -->
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-md-6 col-xs-12">
                                            <div class="x_panel">
                                                <div class="x_title">
                                                    <h2>โต๊ะ <small>#002</small></h2>
                                                    <div class="clearfix"></div>
                                                </div>
                                                <div class="x_content">
                                                    <form class="form-horizontal form-label-left">
                                                        <div class="form-group">
                                                            <table style="width: 100%">
                                                                <tbody>
                                                                <tr>
                                                                    <td style="width: 33%">จำนวน</td>
                                                                    <td style="width: 33%">รายการอาหาร</td>
                                                                    <td style="width: 33%">ราคา</td>
                                                                </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                        <div class="ln_solid"></div>
                                                        <div class="form-group">
                                                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                                                                <div class="col-md-12 col-sm-12 col-xs-12">ราคารวม</div>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-6 col-xs-12">
                                            <div class="x_panel">
                                                <div class="x_title">
                                                    <h2>โปรโมชั่น</h2>
                                                    <div class="clearfix"></div>
                                                </div>
                                                <div class="x_content">
                                                    <form class="form-horizontal form-label-left">
                                                        <div class="form-group">
                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">กรุณาเลือกโปรโมชั่น</label>
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
                                                            </div>
                                                        </div>
                                                        <div class="ln_solid"></div>
                                                        <div class="form-group">
                                                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                                                                <div class="col-md-12 col-sm-12 col-xs-12">ราคารวม</div>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>

                                        </div>
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
        var editfirsttime = true;

        $("#editMenu").on('shown.bs.modal', function () {
            if (editfirsttime) {
                editfirsttime = false;
                $("#material-datatable-2").DataTable({
                    scrollY: "40vh",
                    paging: false,
                    order: [[1, "desc"]]
                });
            }
        });

        $(".display_toggle").click(function () {
            $(".display_toggle").removeClass("active");
            $(this).addClass("active");
        });

        $("#displayThumbnail").click(function () {
            $("#menu_thumbnail_list").css('display', 'none');
            $("#menu_thumbnail").css('display', '');
            $('.pagination').css('display', 'none');
            $("#filter_by_category").css('visibility', '');
            $("#myInput").parent().css('visibility', '');
            refresh_table();
        });

        refresh_table();
    });

    function refresh_table() {
        $.ajax({
            type: "POST",
            url: "${contextPath}/cashier/getcashiers" ,
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
                        <div style="text-align:center;" class="col-md-12"><button type="button" class="btn btn-success" data-toggle="modal" data-target="#editMenu" data-toggle="modal" \
                        data-target="#editMenu" style="width: 80%;" onclick="set_bill(' + obj.billNo + ')">จ่ายเงิน</button></div>\
                        </div>\
                        </div>\
                        </div>\
                        ';
                        $("#menu_thumbnail").append(div);
                }
                    $("#error_show").html('');
//                    $("#datatable-menu").DataTable().clear();
//                    $("#datatable-menu").DataTable().rows.add(data_array).draw(false);

                filterCard();
            }
        });
    }

    $('.modal').on('hidden.bs.modal', function () {
        reset_field();
    });

    function reset_field() {
        $("#add_menu")[0].reset();
        $("#showpic").attr('src', '../images/table.png');
        $("#add_menu_available").parent().removeClass('checked');
        $("#add_menu_available").attr('checked', false);
        $("#add_menu_official").parent().removeClass('checked');
        $("#add_menu_official").attr('checked', false);
        $("#display_material_desc").empty();
    }

    function set_bill(billNo) {
        $.ajax({
            type: "PUT",
            url: "${contextPath}/cashier/getcashier/" + billNo,
            dataType: "json",
            success: function (result) {
                menu = result.menu;
                $("#hiddenmenuno").val(menu.menuNo);
                $("#edit_menu_nameTH").val(menu.menuNameTH);
                $("#edit_menu_nameEN").val(menu.menuNameEN);
                $("#show_menu_name_for_edit").html(menu.menuNameTH + " / " + menu.menuNameEN);
                $("#edit_menu_desc").val(menu.menuDesc);
                $("#edit_menu_price").val(menu.menuPrice.toFixed(2));
                $("#edit_menu_available").val(menu.menuAvailable);
                $("#edit_menu_stock_cat").val(menu.menuGroupNo);
                if (result.available) {
                    $("#edit_menu_available").parent().addClass('checked');
                    $("#edit_menu_available").attr('checked', true);
                } else {
                    $("#edit_menu_available").parent().removeClass('checked');
                    $("#edit_menu_available").attr('checked', false);
                }

                /////////////////////
                $(".materialamount2").val(0);
                menuMaterials = menu.menuMaterials;
                for (var i = 0; i < menuMaterials.length; i++) {
                    $(".materialamount2[matitemno='" + menuMaterials[i].matItemNo + "']").val(menuMaterials[i].quantity);
                }

                $("#display_material_desc2").empty();
                $(".materialamount2").attr('disabled', false);
                $(".materialamount2").each(function () {
                    if ($(this).val() > 0) {
                        $("#display_material_desc2").append('<div class="col-md-4 col-md-offset-2" style="text-align:left;white-space:nowrap;overflow:hidden;text-overflow: ellipsis;">' + $(this).attr('matItemName') + '</div><div class="col-md-3 col-md-offset-2" style="text-align:left;">' + $(this).val() + ' ' + $(this).attr('unit') + '</div><br>');
                    }

                    if ($(this).attr('matitemno') == menuMaterials.matItemNo) {
                        $(this).attr('disabled', true);
                    }
                });
                /////////////////////

                $("#showpic_edit").attr('src', menu.menuPicPath == null ? '../images/default_upload_image.png' : ('../images/menu/' + menu.menuPicPath));
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


</style>
</body>
</html>