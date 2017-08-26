<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="com.springoeb.system.model.Branch" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../_include/topenv.jsp"/>
    <title>เมนูอาหารแบบชุด</title>
    <style>
        .foodDesc {
            width: 100%;
            height: 60%;
            overflow-y: scroll;
            margin-top: 10px;
            margin-bottom: 10px;
            background-color: #fff;
        }
    </style>
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
                            <h4>เมนูอาหารแบบชุด</h4>
                        </div>
                        <div class="x_content">
                            <div class="col-md-8" style="padding:0px;">
                                <p>
                                    <a data-toggle="modal" data-target="#addMenuSet"
                                       class="btn btn-success btn-sm"><i class="fa fa-plus-circle"></i>&nbsp;
                                        เพิ่มชุดเมนู</a>
                                </p>
                            </div>
                            <div class="col-md-4 form-group" style="padding:0px;">
                                <input type="text" class="form-control" id="myInput"
                                       onkeyup="filterCard()" placeholder="ค้นหา...">
                                <span class="fa fa-search form-control-feedback right"
                                      aria-hidden="true"></span>
                            </div>

                            <div id="menuset_thumbnail">
                            </div>

                            <div id="error_show">
                            </div>
                            <%--modal for add--%>

                            <div class="modal fade" id="addMenuSet" role="dialog">
                                <div class="modal-dialog">
                                    <!-- เนือหาของ Modal ทั้งหมด -->
                                    <div class="modal-content modal-body-test" style="overflow-y:hidden;">
                                        <!-- ส่วนหัวของ Modal -->
                                        <div class="modal-header">
                                            <!-- ปุ่มกดปิด (X) ตรงส่วนหัวของ Modal -->
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">เพิ่มชุดเมนูอาหารใหม่</h4>
                                        </div>
                                        <!-- ส่วนเนื้อหาของ Modal -->
                                        <div class="modal-body">
                                            <form class="form-horizontal form-label-left input_mask"
                                                  id="add_menuset" enctype="multipart/form-data">
                                                <div class="form-group">
                                                    <img class="col-md-offset-3 col-sm-offset-3 col-md-6 col-sm-6 col-xs-12 img-resize"
                                                         id="showpic_menuset" style="margin-bottom:20px;cursor:pointer;"
                                                         height="auto"
                                                         width="414"
                                                         src="../images/default_upload_image.png"/>
                                                    <div class="col-md-offset-3 col-sm-offset-3 col-md-6 col-sm-6 col-xs-12 has-feedback"
                                                         style="margin-bottom: 12px">
                                                        <input type="file" class="form-control" name="menuPicPath"
                                                               id="add_menuset_pic"
                                                               onchange="document.getElementById('showpic_menuset').src = window.URL.createObjectURL(this.files[0])"
                                                               placeholder="อัพโหลดรูปภาพ">
                                                    </div>

                                                    <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                                        <label>ชื่อชุดเมนูอาหารภาษาไทย</label>
                                                        <input type="text" class="form-control" name="menuNameTH"
                                                               id="add_menuset_nameTH"
                                                               placeholder="ชื่อชุดเมนูอาหารภาษาไทย" required>
                                                        <span class="fa fa-pencil form-control-feedback right"
                                                              aria-hidden="true"></span>
                                                    </div>
                                                    <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                                        <label>ชื่อชุดเมนูอาหารภาษาอังกฤษ</label>
                                                        <input type="text" class="form-control" name="menuNameEN"
                                                               id="add_menuset_nameEN"
                                                               placeholder="ชื่อชุดเมนูอาหารภาษาอังกฤษ" required>
                                                        <span class="fa fa-pencil form-control-feedback right"
                                                              aria-hidden="true"></span>
                                                    </div>
                                                    <div class="col-md-12 col-sm-12 col-xs-12 form-group has-feedback">
                                                        <label>รายละเอียดของชุดเมนูอาหาร</label>
                                                        <textarea rows="4" cols="50" class="form-control"
                                                                  name="menuDesc"
                                                                  id="add_menuset_desc"
                                                                  placeholder="รายละเอียด"></textarea>
                                                    </div>
                                                    <div class="col-md-12">
                                                        <label>เลือกเมนูอาหารที่อยู่ในชุดอาหารนี้</label>
                                                        <table class="datatable-menu table table-striped table-bordered">
                                                            <thead>
                                                            <tr>
                                                                <th style="text-align:center;">ชื่อเมนูอาหาร</th>
                                                                <th style="text-align:center;">หมวดหมู่</th>
                                                                <th style="text-align:center;">ราคา</th>
                                                                <th style="text-align:center;">จำนวน</th>
                                                            </tr>
                                                            </thead>
                                                            <tbody style="text-align:center;">
                                                            <c:forEach items="${menus}" var="menu">
                                                                <c:set var="m" value="${menu.menu}"/>
                                                                <tr>
                                                                    <td>${m.menuNameTH} / ${m.menuNameEN}</td>
                                                                    <td>${m.menuGroup.menuGroupNameTH}</td>
                                                                    <td data-order="${m.menuPrice}">
                                                                        <fmt:formatNumber value="${m.menuPrice}"
                                                                                          pattern="#,###,##0.00"></fmt:formatNumber>
                                                                        บาท
                                                                    </td>
                                                                    <td><input price="${m.menuPrice}"
                                                                               menuNo="${m.menuNo}" type="number"
                                                                               menuName="${m.menuNameTH} / ${m.menuNameEN}"
                                                                               class="menusetamount"
                                                                               name="menuamount${m.menuNo}"
                                                                               style="text-align:center;"
                                                                               value="0" min="0" max="1000" step="1"
                                                                               required>
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <div class="col-md-12" style="text-align:center;margin-top:20px;">
                                                        <div class="well" style="overflow: auto">
                                                            <span style="font-weight:bold;">รายการเมนูเดี่ยวของชุดนี้</span>
                                                            <div id="display_sum_menu"
                                                                 style="margin-bottom:20px;margin-top:20px;"></div>
                                                            <span style="font-weight:bold;">ราคารวมเมนูเดี่ยวทั้งหมด : <span
                                                                    id="sum_menu_price">0.00</span> บาท</span>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label>ราคาชุดเมนูอาหารนี้ (บาท)</label>
                                                        <input type="number" min="0" step="0.25" class="form-control"
                                                               name="menuPrice"
                                                               placeholder="ราคาชุดเมนูอาหารนี้ (บาท)" required>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <!-- ปุ่มกดปิด (Close) ตรงส่วนล่างของ Modal -->
                                                    <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                                                        <div class="checkbox"
                                                             style="display:inline-block;margin-right:15px;">
                                                            <label>
                                                                <input type="checkbox" name="localFlag"
                                                                       id="add_menu_official"
                                                                       class="flat">
                                                                เป็นเมนูของทุกสาขา
                                                            </label>
                                                            <label>
                                                                <input type="checkbox" name="available"
                                                                       id="add_menuset_available"
                                                                       class="flat">
                                                                พร้อมจำหน่าย
                                                            </label>
                                                        </div>
                                                        <button type="submit" style="margin-left:5px;"
                                                                class="btn btn-success">ตกลง
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
                            <%--modal for add--%>

                            <%--modal for editing--%>
                            <div class="modal fade" id="editMenuSet" role="dialog">
                                <div class="modal-dialog">
                                    <!-- เนือหาของ Modal ทั้งหมด -->
                                    <div class="modal-content modal-body-test" style="overflow-y:hidden;">
                                        <!-- ส่วนหัวของ Modal -->
                                        <div class="modal-header">
                                            <!-- ปุ่มกดปิด (X) ตรงส่วนหัวของ Modal -->
                                            <button type="button" class="close" data-dismiss="modal">&times</button>
                                            <h4 class="modal-title">เแก้ไขชุดเมนูอาหาร <span
                                                    id="edit_menuset_name"></span></h4>
                                        </div>
                                        <!-- ส่วนเนื้อหาของ Modal -->
                                        <div class="modal-body">
                                            <form class="form-horizontal form-label-left input_mask"
                                                  id="edit_menuset" enctype="multipart/form-data">
                                                <input type="hidden" name="menuNo" id="hidden_menuset_no">
                                                <div class="form-group">
                                                    <img class="col-md-offset-3 col-sm-offset-3 col-md-6 col-sm-6 col-xs-12 img-resize"
                                                         id="showpic_menuset_edit"
                                                         style="margin-bottom:20px;cursor:pointer;"
                                                         height="auto"
                                                         width="414"
                                                         src="../images/default_upload_image.png"/>
                                                    <div class="col-md-offset-3 col-sm-offset-3 col-md-6 col-sm-6 col-xs-12 has-feedback"
                                                         style="margin-bottom: 12px">
                                                        <input type="file" class="form-control" name="menuPicPath"
                                                               id="edit_menuset_pic"
                                                               onchange="document.getElementById('showpic_menuset_edit').src = window.URL.createObjectURL(this.files[0])"
                                                               placeholder="อัพโหลดรูปภาพ">
                                                    </div>

                                                    <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                                        <label>ชื่อชุดเมนูอาหารภาษาไทย</label>
                                                        <input type="text" class="form-control" name="menuNameTH"
                                                               id="edit_menuset_nameTH"
                                                               placeholder="ชื่อชุดเมนูอาหารภาษาไทย" required>
                                                        <span class="fa fa-pencil form-control-feedback right"
                                                              aria-hidden="true"></span>
                                                    </div>
                                                    <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                                        <label>ชื่อชุดเมนูอาหารภาษาอังกฤษ</label>
                                                        <input type="text" class="form-control" name="menuNameEN"
                                                               id="edit_menuset_nameEN"
                                                               placeholder="ชื่อชุดเมนูอาหารภาษาอังกฤษ" required>
                                                        <span class="fa fa-pencil form-control-feedback right"
                                                              aria-hidden="true"></span>
                                                    </div>
                                                    <div class="col-md-12 col-sm-12 col-xs-12 form-group has-feedback">
                                                        <label>รายละเอียดของชุดเมนูอาหาร</label>
                                                        <textarea rows="4" cols="50" class="form-control"
                                                                  name="menuDesc"
                                                                  id="edit_menuset_desc"
                                                                  placeholder="รายละเอียด"></textarea>
                                                    </div>
                                                    <div class="col-md-12">
                                                        <label>เลือกเมนูอาหารที่อยู่ในชุดอาหารนี้</label>
                                                        <table class="datatable-menu table table-striped table-bordered">
                                                            <thead>
                                                            <tr>
                                                                <th style="text-align:center;">ชื่อเมนูอาหาร</th>
                                                                <th style="text-align:center;"></th>
                                                                <th style="text-align:center;">ราคา</th>
                                                                <th style="text-align:center;">จำนวน</th>
                                                            </tr>
                                                            </thead>
                                                            <tbody style="text-align:center;">
                                                            <c:forEach items="${menus}" var="menu">
                                                                <c:set var="m" value="${menu.menu}"/>
                                                                <tr>
                                                                    <td>${m.menuNameTH} / ${m.menuNameEN}</td>
                                                                    <td>${m.menuGroup.menuGroupNameTH}</td>
                                                                    <td data-order="${m.menuPrice}">
                                                                        <fmt:formatNumber value="${m.menuPrice}"
                                                                                          pattern="#,###,##0.00"></fmt:formatNumber>
                                                                        บาท
                                                                    </td>
                                                                    <td><input price="${m.menuPrice}"
                                                                               menuNo="${m.menuNo}" type="number"
                                                                               menuName="${m.menuNameTH} / ${m.menuNameEN}"
                                                                               class="menusetamount_edit"
                                                                               name="menuamount${m.menuNo}"
                                                                               style="text-align:center;"
                                                                               value="0" min="0" max="1000" step="1"
                                                                               required>
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <div class="col-md-12" style="text-align:center;margin-top:20px;">
                                                        <div class="well" style="overflow: auto">
                                                            <span style="font-weight:bold;">รายการเมนูเดี่ยวของชุดนี้</span>
                                                            <div id="display_sum_menu2"
                                                                 style="margin-bottom:20px;margin-top:20px;"></div>
                                                            <span style="font-weight:bold;">ราคารวมเมนูเดี่ยวทั้งหมด : <span
                                                                    id="sum_menu_price2">0.00</span> บาท</span>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label>ราคาชุดเมนูอาหารนี้ (บาท)</label>
                                                        <input type="number" min="0" step="0.25" class="form-control"
                                                               name="menuPrice" id="edit_menuset_price"
                                                               placeholder="ราคาชุดเมนูอาหารนี้ (บาท)" required>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <!-- ปุ่มกดปิด (Close) ตรงส่วนล่างของ Modal -->
                                                    <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                                                        <div class="checkbox"
                                                             style="display:inline-block;margin-right:15px;">
                                                            <label>
                                                                <input type="checkbox" name="available"
                                                                       id="edit_menuset_available"
                                                                       class="flat">
                                                                พร้อมจำหน่าย
                                                            </label>
                                                        </div>
                                                        <button type="submit" style="margin-left:5px;"
                                                                class="btn btn-success">ตกลง
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
                            <%--modal for editing--%>
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
        $("#showpic_menuset").click(function () {
            $("#add_menuset_pic").click();
        });

        $("#showpic_menuset_edit").click(function () {
            $("#edit_menuset_pic").click();
        });

        $("#add_menuset_pic").change(function () {
            if ($("#add_menuset_pic").val() == '') {
                $("#showpic_menuset").attr('src', '../images/default_upload_image.png');
            }
        });

        $("#edit_menuset_pic").change(function () {
            if ($("#edit_menuset_pic").val() == '') {
                $("#showpic_menuset_edit").attr('src', '../images/default_upload_image.png');
            }
        });

        $(".datatable-menu").DataTable({
            columnDefs: [
                {orderable: false, targets: [-1]}
            ]
        });

        refresh_table();
    });

    $(".menusetamount").on('change keyup', function () {
        var sum_menu_price = 0;
        $("#display_sum_menu").empty();
        $(".menusetamount").each(function () {
            if ($(this).val() > 0) {
                $("#display_sum_menu").append('<div class="col-md-6 col-md-offset-2" style="text-align:left;white-space:nowrap;overflow:hidden;text-overflow: ellipsis;">' + $(this).attr('menuname') + '</div><div class="col-md-2">' + $(this).val() + ' เมนู</div><br>');
                sum_menu_price += $(this).attr('price') * $(this).val();
            }
        });

        $("#sum_menu_price").html(sum_menu_price.toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ","));
    });

    $(".menusetamount_edit").on('change keyup', function () {
        var sum_menu_price = 0;
        $("#display_sum_menu2").empty();
        $(".menusetamount_edit").each(function () {
            if ($(this).val() > 0) {
                $("#display_sum_menu2").append('<div class="col-md-6 col-md-offset-2" style="text-align:left;white-space:nowrap;overflow:hidden;text-overflow: ellipsis;">' + $(this).attr('menuname') + '</div><div class="col-md-2">' + $(this).val() + ' เมนู</div><br>');
                sum_menu_price += $(this).attr('price') * $(this).val();
            }
        });

        $("#sum_menu_price2").html(sum_menu_price.toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ","));
    });

    function refresh_table() {
        $.ajax({
            type: "POST",
            url: "${contextPath}/menu/getmenusets",
            dataType: "json",
            success: function (json) {
                $("#menuset_thumbnail").empty();
                if (json.length != 0) {
                    var data_array = [];
                    var price = 0;
                    for (var i = 0; i < json[0].length; i++) {
                        var obj = json[0][i];
                        var menu = obj.menu;
                        var div = '<div class="col-md-6 col-sm-6 col-xs-12">\
                            <div class="thumbnail">\
                            <div class="col-md-6 image view view-first" style="height:100%;">\
                            <img style="width: 100%; display: block;" src="' + (menu.menuPicPath == null ? ('../images/default_upload_image.png') : ('../images/menuset/' + menu.menuPicPath) ) + '" alt="image"/>\
                            <div class="mask">\
                            <p style="white-space:nowrap;overflow:hidden;text-overflow: ellipsis;">' + (menu.menuDesc == null ? 'ไม่มีรายละเอียด' : menu.menuDesc) + '</p>\
                            <div class="tools tools-bottom" style="margin-top:100px;">\
                            <a title="' + (menu.localFlag == 0 ? 'เมนูของทุกสาขา' : 'เมนูเฉพาะสาขา' + menu.localFlag) + '" style="color:white;margin-right:5px;"><i class="fa ' + (menu.localFlag == 0 ? 'fa-users' : 'fa-user' ) + '"></i> <span style="font-size:14px">' + (menu.localFlag == 0 ? ' เป็นเมนูของทุกสาขา' : ' เป็นเมนูเฉพาะสาขา ' + menu.localFlag ) + '</span></a>\
                            </div>\
                            </div>\
                            </div>\
                            <div class="col-md-6 caption" style="height:100%;color:#73879C">\
                            <div class="col-md-9 cardname" data-toggle="modal" data-target="#editMenuSet" onclick="set_menuset(' + menu.menuNo + ')" style="font-weight:bold;white-space:nowrap;overflow:hidden;text-overflow: ellipsis;cursor:pointer;">' + menu.menuNameTH + ' / ' + menu.menuNameEN + '</div>\
                            <div class="col-md-3" style="color:white;background-color:' + (menu.localFlag == 0 ? "#73879C" : "red") + ';border-radius:4px;text-align:center;">' + (menu.localFlag == 0 ? "ทุกสาขา" : "สาขา" + (menu.localFlag ==${Branch.MAIN_BRANCH} ? "นี้" : " " + menu.localFlag)) + '</div>\
                            <div class="col-md-12 foodDesc">\
                            <div>\
                            <p style="text-align:center;font-weight:bold;">รายการเมนู</p>';
                        for (var j = 0; j < menu.menuInSets.length; j++) {
                            var menuSetMenu = menu.menuInSets[j];
                            div += '<div class="col-md-9" style="white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="' + menuSetMenu.menu.menuNameTH + '">' + menuSetMenu.menu.menuNameTH + ' </div>' + menuSetMenu.amount + " เมนู<br>";
                        }
                        div += '</div>\
                            </div>\
                            <div class="col-md-7"> <span style="font-weight:bold;">ราคา</span> ' + menu.menuPrice.toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ",") + ' บาท</div>\
                            <div class="col-md-5" style="text-align:right;">\
                            <div class="panel_menuset">\
                            ' + (menu.localFlag == 0 && ${branchUser.branchNo != Branch.MAIN_BRANCH} ? '' : '<a title="แก้ไข" style="color:#73879C;cursor:pointer;margin-right:5px;"><i class="fa fa-pencil"></i></a>') + '\
                            ' + (menu.localFlag != 0 ? ('<a title="ทำให้เป็นเมนูของทุกสาขา" onclick="turn_official(' + menu.menuNo + ')" style="color:#73879C;cursor:pointer;margin-right:5px;"><i class="fa fa-users"></i></a>') : '') + '\
                            <a title="เมนูนี้' + (obj.available == true ? '' : 'ไม่' ) + 'พร้อมจำหน่าย คลิกเพื่อเปลี่ยน" onclick="change_available(' + menu.menuNo + ')" style="color:#73879C;cursor:pointer;margin-right:5px;"><i class="fa ' + (obj.available == true ? 'fa-check-square-o' : 'fa-square-o' ) + '"></i></a>\
                            ' + (menu.localFlag == 0 && ${branchUser.branchNo != Branch.MAIN_BRANCH} ? '' : '<a title="ลบ" onclick="del_menu(' + menu.menuNo + ',\'' + menu.menuNameTH + '\')" style="color:#73879C;cursor:pointer;"><i class="fa fa-trash"></i></a>') + '\
                            </div>\
                            </div>\
                            </div>\
                            </div>\
                            </div>';

                        $("#menuset_thumbnail").append(div);
                    }

                    if (json.length == 2) {
                        var othermenu = json[1];
                        for (var i = 0; i < othermenu.length; i++) {
                            var menu = othermenu[i];
                            var div = '<div class="col-md-6 col-sm-6 col-xs-12">\
                            <div class="thumbnail">\
                            <div class="col-md-6 image view view-first" style="height:100%;">\
                            <img style="width: 100%; display: block;" src="' + (menu.menuPicPath == null ? ('../images/default_upload_image.png') : ('../images/menuset/' + menu.menuPicPath) ) + '" alt="image"/>\
                            <div class="mask">\
                            <p style="white-space:nowrap;overflow:hidden;text-overflow: ellipsis;">' + (menu.menuDesc == null ? 'ไม่มีรายละเอียด' : menu.menuDesc) + '</p>\
                            <div class="tools tools-bottom" style="margin-top:100px;">\
                            <a title="' + (menu.localFlag == 0 ? 'เมนูของทุกสาขา' : 'เมนูเฉพาะสาขา' + menu.localFlag) + '" style="color:white;margin-right:5px;"><i class="fa ' + (menu.localFlag == 0 ? 'fa-users' : 'fa-user' ) + '"></i> <span style="font-size:14px">' + (menu.localFlag == 0 ? ' เป็นเมนูของทุกสาขา' : ' เป็นเมนูเฉพาะสาขา ' + menu.localFlag ) + '</span></a>\
                            </div>\
                            </div>\
                            </div>\
                            <div class="col-md-6 caption" style="height:100%;color:#73879C">\
                            <div class="col-md-9 cardname" data-toggle="modal" data-target="#editMenuSet" onclick="set_menuset(' + menu.menuNo + ')" style="font-weight:bold;white-space:nowrap;overflow:hidden;text-overflow: ellipsis;cursor:pointer;">' + menu.menuNameTH + ' / ' + menu.menuNameEN + '</div>\
                            <div class="col-md-3" style="color:white;background-color:yellowgreen;border-radius:4px;text-align:center;">' + (menu.localFlag == 0 ? "ทุกสาขา" : "สาขา " + menu.localFlag) + '</div>\
                            <div class="col-md-12 foodDesc">\
                            <div>\
                            <p style="text-align:center;font-weight:bold;">รายการเมนู</p>';
                            for (var j = 0; j < menu.menuInSets.length; j++) {
                                var menuSetMenu = menu.menuInSets[j];
                                div += '<div class="col-md-9" style="white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="' + menuSetMenu.menu.menuNameTH + '">' + menuSetMenu.menu.menuNameTH + ' </div>' + menuSetMenu.amount + " เมนู<br>";
                            }
                            div += '</div>\
                            </div>\
                            <div class="col-md-7"> <span style="font-weight:bold;">ราคา</span> ' + menu.menuPrice.toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ",") + ' บาท</div>\
                            <div class="col-md-5" style="text-align:right;">\
                            <div class="panel_menuset">\
                            <a title="ทำให้เป็นเมนูของทุกสาขา" onclick="turn_official(' + menu.menuNo + ')" style="color:#73879C;cursor:pointer;margin-right:5px;"><i class="fa fa-users"></i></a>\
                            </div>\
                            </div>\
                            </div>\
                            </div>\
                            </div>';

                            $("#menuset_thumbnail").append(div);
                        }
                    }
                } else {
                    $("#menuset_thumbnail").html('\
                    <div class="well" style="overflow: auto">\
                        <p style="text-align:center;font-weight:bold;"> ไม่พบข้อมูลเมนูอาหารแบบชุด </p>\
                    </div>\
                    ');
                }
            }
        });
    }

    $("#add_menuset").submit(function () {
        var hasmenu = false;
        $(".menusetamount").each(function () {
            if ($(this).val() > 0) {
                hasmenu = true;
                return false;
            }
        });
        if (hasmenu) {
            var formdata = new FormData($("#add_menuset")[0]);
            $.ajax({
                type: "POST",
                data: formdata,
                enctype: 'multipart/form-data',
                cache: false,
                contentType: false,
                processData: false,
                url: "${contextPath}/menu/managemenuset",
                success: function (result) {
                    swal("สำเร็จ", "ชุดเมนู " + $("#add_menuset_nameTH").val() + " ถูกเพิ่มเรียบร้อยแล้ว", "success");
                    reset_field();
                    $("#addMenuSet").modal('toggle');
                    refresh_table();
                }, error: function (result) {
                    swal("ไม่สำเร็จ", "ชื่อภาษาไทยหรืออังกฤษอาจซ้ำ กรุณาลองใหม่ในภายหลัง", "error");
                }
            });
        } else {
            swal("ไม่สำเร็จ", "กรุณาเลือกเมนูอาหารในชุดนี้ก่อน", "error");
        }

        return false;
    });

    $('.modal').on('hidden.bs.modal', function () {
        reset_field();
    });

    function reset_field() {
        $("#add_menuset")[0].reset();
        $("#showpic_menuset").attr('src', '../images/default_upload_image.png');
        $("#sum_menu_price").html('0.00');
        $("#add_menuset_available").parent().removeClass('checked');
        $("#add_menuset_available").attr('checked', false);
        $("#add_menu_official").parent().removeClass('checked');
        $("#add_menu_official").attr('checked', false);
    }

    function set_menuset(menuNo) {
        $.ajax({
            type: "PUT",
            url: "${contextPath}/menu/getmenu/" + menuNo,
            dataType: "json",
            success: function (result) {
                menu = result.menu;
                $("#hidden_menuset_no").val(menu.menuNo);
                $("#edit_menuset_nameTH").val(menu.menuNameTH);
                $("#edit_menuset_nameEN").val(menu.menuNameEN);
                $("#edit_menuset_name").html(menu.menuNameTH + " / " + menu.menuNameEN);
                $("#edit_menuset_desc").val(menu.menuDesc);
                $("#edit_menuset_price").val(menu.menuPrice.toFixed(2));
                $("#edit_menuset_available").val(result.available);
                if (result.available) {
                    $("#edit_menuset_available").parent().addClass('checked');
                    $("#edit_menuset_available").attr('checked', true);
                } else {
                    $("#edit_menuset_available").parent().removeClass('checked');
                    $("#edit_menuset_available").attr('checked', false);
                }

                $("#showpic_menuset_edit").attr('src', menu.menuPicPath == null ? '../images/default_upload_image.png' : ('../images/menuset/' + menu.menuPicPath));

                $(".menusetamount_edit").val(0);
                var menu_in_menuset = menu.menuInSets;
                for (var i = 0; i < menu_in_menuset.length; i++) {
                    $(".menusetamount_edit[menuno='" + menu_in_menuset[i].menuSubNo + "']").val(menu_in_menuset[i].amount);
                }

                var sum_menu_price = 0;
                $("#display_sum_menu2").empty();
                $(".menusetamount_edit").each(function () {
                    if ($(this).val() > 0) {
                        $("#display_sum_menu2").append('<div class="col-md-6 col-md-offset-2" style="text-align:left;white-space:nowrap;overflow:hidden;text-overflow: ellipsis;">' + $(this).attr('menuname') + '</div><div class="col-md-2">' + $(this).val() + ' เมนู</div><br>');
                        sum_menu_price += $(this).attr('price') * $(this).val();
                    }
                });

                $("#sum_menu_price2").html(sum_menu_price.toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ","));

                $("#sum_menu_price2").html(sum_menu_price.toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ","));
            }
        });
    }

    $("#edit_menuset").submit(function () {
        var hasmenu = false;
        $(".menusetamount_edit").each(function () {
            if ($(this).val() > 0) {
                hasmenu = true;
                return false;
            }
        });
        if (hasmenu) {
            var formdata = new FormData($("#edit_menuset")[0]);
            $.ajax({
                type: "POST",
                data: formdata,
                enctype: 'multipart/form-data',
                cache: false,
                contentType: false,
                processData: false,
                url: "${contextPath}/menu/managemenuset",
                success: function (result) {
                    swal("สำเร็จ", "ชุดเมนู " + $("#edit_menuset_nameTH").val() + " ถูกเพิ่มเรียบร้อยแล้ว", "success");
                    $("#edit_menuset")[0].reset();
                    $("#editMenuSet").modal('toggle');
                    $("#showpic_menuset_edit").attr('src', '../images/default_upload_image.png');
                    $("#sum_menu_price2").html('0.00');
                    $("#edit_menuset_available").parent().removeClass('checked');
                    $("#edit_menuset_available").attr('checked', false);
                    refresh_table();
                }, error: function (result) {
                    swal("ไม่สำเร็จ", "ชื่อภาษาไทยหรืออังกฤษอาจซ้ำ กรุณาลองใหม่ในภายหลัง", "error");
                }
            });
        } else {
            swal("ไม่สำเร็จ", "กรุณาเลือกเมนูอาหารในชุดนี้ก่อน", "error");
        }

        return false;
    });

    function del_menuset(menuNo, menuNameTH) {
        swal({
                title: "ยืนยันการลบ " + menuNameTH,
                text: "เมื่อยืนยัน จะไม่สามารถนำข้อมูล " + menuNameTH + " กลับมาได้",
                type: "warning",
                showCancelButton: true,
                cancelButtonText: "ยกเลิก",
                confirmButtonText: "ใช่, ต้องการลบ",
                confirmButtonColor: "#DD6B55",
                closeOnConfirm: false
            },
            function () {
                $.ajax({
                    type: "DELETE",
                    url: "${contextPath}/menu/delmenuset/" + menuNo,
                    success: function (json) {
                        swal("สำเร็จ", menuNameTH + " ถูกลบเรียบร้อยแล้ว", "success");
                        refresh_table();
                    },
                    error: function (json) {
                        swal("ไม่สำเร็จ", "เซิร์ฟเวอร์อาจมีปัญหา", "error");
                    }
                });
            });
    }

    function change_available(menuNo) {
        $.ajax({
            type: "POST",
            data: {menuno: menuNo},
            url: "${contextPath}/menu/changeavailable",
            success: function (result) {
                refresh_table();
            }, error: function (result) {
                swal("ไม่สำเร็จ", "กรุณาลองใหม่ภายหลัง", "error");
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
                        <p style="text-align:center;font-weight:bold;"> ไม่พบข้อมูลเมนูอาหารแบบชุดด้วยคำค้นหา "' + input + '" </p>\
                    </div>\
                    ');
        } else {
            $("#error_show").html('');
        }
    }

    function turn_official(menuno) {
        swal({
                title: "ต้องการเปลี่ยนเมนูนี้ให้เป็นเมนูของทุกสาขา",
                text: "",
                type: "warning",
                showCancelButton: true,
                cancelButtonText: "ยกเลิก",
                confirmButtonText: "ใช่, ต้องการเปลี่ยน",
                confirmButtonColor: "#DD6B55",
                closeOnConfirm: true
            },
            function () {
                $.ajax({
                    type: "POST",
                    data: {menuno: menuno},
                    url: "${contextPath}/menu/promoteofficial",
                    success: function (result) {
                        refresh_table();
                    }, error: function (result) {
                        swal("ไม่สำเร็จ", "กรุณาลองใหม่ภายหลัง", "error");
                    }
                });
            });
    }
</script>
</body>
</html>