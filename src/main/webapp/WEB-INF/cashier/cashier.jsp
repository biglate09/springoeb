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
                                           onkeyup="filterCard()" placeholder="ค้นหาด้วยชื่อเมนู...">
                                    <span class="fa fa-search form-control-feedback right"
                                          aria-hidden="true"></span>
                                </div>
                                <div id="menu_thumbnail">
                                    <div class="col-md-55">
                                        <div class="thumbnail thumbnail_inline">
                                            <div class="image view view-first">
                                                <img style="width: 100%;position:relative;" src="${contextPath}/images/table.png" alt="image"/>
                                                <div style="margin-left: auto;margin-right: auto;position: absolute;left: 50%;transform: translate(-50%, -50%);font-weight: bold; ">โต๊ะ 1</div>
                                                <%--<div class="mask">--%>
                                                    <%--<div class="tools tools-bottom">--%>
                                                        <%--<a title="เมนูของทุกสาขา" style="color:white;margin-right:5px;"><i class="fa (menu.localFlag == 0 ? 'fa-users' : 'fa-user' )"></i> <span style="font-size:14px">(menu.localFlag == 0 ? ' เป็นเมนูของทุกสาขา' : ' เป็นเมนูเฉพาะสาขานี้')</span></a>--%>
                                                    <%--</div>--%>
                                                <%--</div>--%>
                                            </div>
                                            <div class="caption col-md-12" style="color:#73879C">
                                                <p class="cardname col-md-12" style="white-space:nowrap;overflow:hidden;text-overflow: ellipsis;" onclick="set_menu(' + menu.menuNo + ')">ใช้บริการมาแล้ว : 15 นาที</p>
                                                <p class="col-md-12" style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;">ราคาอาหาร : 135 บาท</p>
                                                <p class="col-md-12" > สถานะอาหาร : ครบแล้ว</p>
                                                <div style="text-align:center;" class="col-md-12"><button type="button" class="btn btn-success" data-toggle="modal" data-target="#editMenu" data-toggle="modal" data-target="#editMenu" style="width: 80%;">จ่ายเงิน</button></div>
                                            </div>
                                        </div>
                                </div></div>
                                <div id="error_show"></div>
                                </form>
                        </div>
                        <div class="modal fade" id="addMenu" role="dialog">
                            <div class="modal-dialog">
                                <!-- เนือหาของ Modal ทั้งหมด -->
                                <div class="modal-content modal-body-test" style="overflow-y:hidden;">
                                    <!-- ส่วนหัวของ Modal -->
                                    <div class="modal-header">
                                        <!-- ปุ่มกดปิด (X) ตรงส่วนหัวของ Modal -->
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">รายการจ่ายเงิน</h4>
                                    </div>
                                    <!-- ส่วนเนื้อหาของ Modal -->
                                    <div class="modal-body">
                                        <form class="form-horizontal form-label-left input_mask" modelAttribute="menu"
                                              id="add_menu" enctype="multipart/form-data">
                                            <div class="form-group">
                                                <img class="col-md-offset-3 col-sm-offset-3 col-md-6 col-sm-6 col-xs-12 img-resize"
                                                     id="showpic" style="margin-bottom:20px;cursor:pointer;"
                                                     height="auto" width="414"
                                                     src="../images/default_upload_image.png"/>
                                                <div class="col-md-offset-3 col-sm-offset-3 col-md-6 col-sm-6 col-xs-12 has-feedback"
                                                     style="margin-bottom: 12px">
                                                    <input type="file" accept="image/*"
                                                           class="form-control" name="menuPicPath"
                                                           id="add_menu_pic"
                                                           onchange="document.getElementById('showpic').src = window.URL.createObjectURL(this.files[0])"
                                                           placeholder="อัพโหลดรูปภาพ">
                                                </div>
                                                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback ">
                                                    <label class="required">ชื่อเมนูอาหารภาษาไทย</label>
                                                    <input type="text" class="form-control" name="menuNameTH"
                                                           id="add_menu_nameTH"
                                                           placeholder="ชื่อเมนูอาหารภาษาไทย" required>
                                                    <span class="fa fa-pencil form-control-feedback right"
                                                          aria-hidden="true"></span>
                                                </div>
                                                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                                    <label class="required">ชื่อเมนูอาหารภาษาอังกฤษ</label>
                                                    <input type="text" class="form-control" name="menuNameEN"
                                                           id="add_menu_nameEN"
                                                           placeholder="ชื่อเมนูอาหารภาษาอังกฤษ" required>
                                                    <span class="fa fa-pencil form-control-feedback right"
                                                          aria-hidden="true"></span>
                                                </div>
                                                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                                    <label class="required">ราคา (บาท)</label>
                                                    <input type="number" class="form-control" name="menuPrice"
                                                           id="add_menu_price"
                                                           placeholder="ราคา" min="0" step="0.25" required>
                                                    <span class="fa fa-money form-control-feedback right"
                                                          aria-hidden="true"></span>
                                                </div>
                                                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback ">
                                                    <label class="required">หมวดหมู่ของเมนู</label>
                                                    <select name="menuGroupNo" id="add_menu_stock_cat"
                                                            class="form-control" required>
                                                        <option disabled selected value="">เลือกหมวดหมู่เมนู</option>
                                                        <c:forEach items="${menuGroups}" var="mc">
                                                            <option value="${mc.menuGroupNo}">${mc.menuGroupNameTH}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <div class="col-md-12 col-sm-12 col-xs-12 form-group has-feedback">
                                                    <label>รายละเอียดของเมนู</label>
                                                    <textarea rows="4" cols="100" class="form-control" name="menuDesc"
                                                              id="add_menu_desc"
                                                              placeholder="รายละเอียด"></textarea>
                                                </div>
                                                <div class="col-md-12 col-sm-12 col-xs-12">
                                                    <label>เลือกวัตถุดิบที่ใช้ในเมนูนี้</label>
                                                    <table class="table table-bordered table-striped"
                                                           id="material-datatable-1">
                                                        <thead>
                                                        <tr>
                                                            <th style="text-align:center;">ชื่อวัตถุดิบอาหาร
                                                            </th>
                                                            <th style="text-align:center;" class="order">
                                                                ประเภท
                                                            </th>
                                                            <th style="text-align:center;"><span class="required">จำนวนที่ใช้</span></th>
                                                            <th style="text-align:center;">add-on</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody style="text-align:center;" >
                                                        <c:forEach items="${materialItems}" var="mi">
                                                            <tr>
                                                                <td style="width:30%;">${mi.matItemName}</td>
                                                                <td style="width:20%;">${mi.materialCategory.matCatName}</td>
                                                                <td style="width:20%;">
                                                                    <div class="col-md-6">
                                                                        <input matItemNo="${mi.matItemNo}" type="number"
                                                                               matItemName="${mi.matItemName}"
                                                                               unit="${mi.unit.unitName}"
                                                                               class="materialamount"
                                                                               name="materialamount${mi.matItemNo}"
                                                                               style="text-align:center;"
                                                                               value="0" min="0" max="1000"
                                                                               step="0.001"
                                                                               required>
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                            ${mi.unit.unitName}
                                                                    </div>
                                                                </td>
                                                                <td style="width:20%;">
                                                                    <div class="col-md-6">
                                                                        <input type="number"
                                                                               style="text-align:center;width: 100%;"
                                                                               value="0" min="0"
                                                                               step="0.01">
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                            ${mi.unit.unitName}
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div class="col-md-12" style="text-align:center;margin-top:20px;">
                                                    <div class="well" style="overflow: auto">
                                                        <span style="font-weight:bold;">ส่วนผสมของเมนูอาหารมีดังนี้</span>
                                                        <div id="display_material_desc"
                                                             style="margin-bottom:20px;margin-top:20px;"
                                                             class="submit-clear"></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <!-- ปุ่มกดปิด (Close) ตรงส่วนล่างของ Modal -->
                                                <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                                                    <div class="checkbox"
                                                         style="display:inline-block;margin-right:15px;">
                                                        <c:if test="${branchUser.branchNo == Branch.MAIN_BRANCH}">
                                                            <label>
                                                                <input type="checkbox" name="localFlag"
                                                                       id="add_menu_official"
                                                                       class="flat">
                                                                เป็นเมนูของทุกสาขา
                                                            </label>
                                                        </c:if>

                                                        <label>
                                                            <input type="checkbox" name="menuAvailable"
                                                                   id="add_menu_available"
                                                                   class="flat">
                                                            พร้อมจำหน่าย
                                                        </label>
                                                    </div>
                                                    <button type="submit" style="margin-left:5px;"
                                                            class="btn btn-success">ตกลง
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
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <div class="x_panel">
                                                <div class="x_title">
                                                    <h2>โต๊ะ <small>#0002</small></h2>
                                                    <div class="clearfix"></div>
                                                </div>
                                                <div class="x_content">
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
                                                <div class="x_title">
                                                    <div class="clearfix"></div>
                                                    <div class="col-md-12 col-sm-12 col-xs-12">ราคารวม</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <div class="x_panel">
                                                <div class="x_title">
                                                    <h2>โปรโมชั่น</h2>
                                                    <div class="clearfix"></div>
                                                </div>
                                                <div class="x_content">
                                                    <table style="width: 100%">
                                                        <tbody>
                                                        <tr>
                                                            <td style="width: 100%"><input type="checkbox" class="flat"> โปรโมชั่น 1</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 100%"><input type="checkbox" class="flat"> โปรโมชั่น 2</td>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div class="x_title">
                                                    <div class="clearfix"></div><br>
                                                    <div class="col-md-12 col-sm-12 col-xs-12">ราคารวม</div>
                                                    <div class="col-md-12 col-sm-12 col-xs-12">รับเงิน <input type="number" class=""></div>
                                                    <div class="col-md-12 col-sm-12 col-xs-12">ราคารวม</div>
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
            url: "${contextPath}/cashier/" + $("#filter_by_category").val(),
            dataType: "json",
            success: function (json) {
                //remove
                $("#menu_thumbnail").empty();
                $("#menu_thumbnail_list").empty();
                var data_array = [];
                var menu = obj.menu;
                //Gallery
                var div = '\
                    <div class="col-md-55">\
                    <div class="thumbnail thumbnail_inline">\
                    <div class="image view view-first">\
                    <div style="position:relative;">\
                    <img style="width: 100%; display: block;" src="${contextPath}/images/table.png" alt="image"/>\
                    <div style="position:absolute;top:0px;left:0px;z-index:200;">ชื่อโต๊ะ</div>\
                    </div>\
                    <div class="mask">\
                    <div class="tools tools-bottom">\
                    <a title="เมนูของทุกสาขา" style="color:white;margin-right:5px;"><i class="fa ' + (menu.localFlag == 0 ? 'fa-users' : 'fa-user' ) + '"></i> <span style="font-size:14px">' + (menu.localFlag == 0 ? ' เป็นเมนูของทุกสาขา' : ' เป็นเมนูเฉพาะสาขานี้') + '</span></a>\
                    </div>\
                    </div>\
                    </div>\
                    <div class="caption col-md-12" style="color:#73879C">\
                    <p class="cardname col-md-12" style="text-align:center;font-weight:bold;white-space:nowrap;overflow:hidden;text-overflow: ellipsis;cursor:pointer;" data-toggle="modal" data-target="#editMenu" onclick="set_menu(' + menu.menuNo + ')">ใช้บริการมาแล้ว : ... นาที</p>\
                    <p class="col-md-12" style="text-align:center;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;">ราคาอาหาร : ' + menu.menuGroup.menuGroupNameTH + ' บาท</p>\
                    <p class="col-md-12" style="text-align:center"> สถานะอาหาร : </p>\
                    <div style="text-align:center;" class="col-md-12"><button type="button" class="btn btn-success" data-toggle="modal" data-target="#editMenu" onclick="set_menu(' + menu.menuNo + ')">จ่ายเงิน</button></div>\
                    </div>\
                    </div>\
                    ';
                        $("#menu_thumbnail").append(div);
                        var price_order = (menu.menuPrice.toFixed(2) * 100000) + "";
                        for (var j = price_order.length; j < 20; j++) {
                            price_order = "0" + price_order;
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

    function set_menu(menuNo) {
        $.ajax({
            type: "PUT",
            url: "${contextPath}/menu/getmenu/" + menuNo,
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
                        <p style="text-align:center;font-weight:bold;"> ไม่พบข้อมูลเมนูอาหารแบบเดี่ยว จากการค้นหาหมวดหมู่อาหาร ' + $("#filter_by_category option:selected").text() + ($("#myInput").val() != '' ? (' ด้วยคำค้นหา \"' + $("#myInput").val() + '\"') : '') + ' </p>\
                    </div>\
                    ');
        } else {
            $("#error_show").html('');
        }
    }


</script>

<style>
    .thumbnail_inline {
        height: 250px !important;
    }
    /*.description{*/
        /*line-height: 1.5em;*/
        /*display: -webkit-box;*/
        /*-webkit-line-clamp: 3;*/
        /*-webkit-box-orient: vertical;*/
        /*overflow: hidden;*/
    /*}*/

</style>
</body>
</html>