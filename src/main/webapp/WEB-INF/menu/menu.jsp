<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="com.springoeb.branch.model.Branch" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../_include/topenv.jsp"/>
    <title>เมนูอาหารแบบเดี่ยว</title>

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
                                เมนูอาหารแบบเดี่ยว
                            </h4>
                        </div>
                        <div class="x_content">
                            <form action="#">
                                <div class="col-md-4" style="padding:0px;">
                                    <a data-toggle="modal" data-target="#addMenu"
                                       class="btn btn-success btn-sm"><i class="fa fa-plus-circle"></i>&nbsp;
                                        เพิ่มเมนู</a>
                                </div>
                                <div class="col-md-3 form-group has-feedback">
                                    <select class="form-control" id="filter_by_category">
                                        <option disabled>ตัวกรองจากหมวดหมู่ของอาหาร</option>
                                        <option value="0">ทั้งหมด</option>
                                        <c:forEach items="${menuGroups}" var="mc">
                                            <option value="${mc.menuGroupNo}">${mc.menuGroupNameTH}
                                                / ${mc.menuGroupNameEN}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col-md-4 form-group" style="padding:0px;margin-right: 5px;">
                                    <input type="text" class="form-control" id="myInput"
                                           onkeyup="filterCard()" placeholder="ค้นหาด้วยชื่อเมนู...">
                                    <span class="fa fa-search form-control-feedback right"
                                          aria-hidden="true"></span>
                                </div>
                                <%--<div class="col-md-1 btn-group">--%>
                                <div class="btn-group" data-toggle="buttons">
                                    <label id="displayThumbnail" class="btn btn-default display_toggle active"
                                           type="button" title="แสดงแบบรูป">
                                        <span class="fa fa-th-large"></span>
                                    </label>
                                    <label id="displayTable" class="btn btn-default display_toggle" type="button"
                                           title="แสดงแบบตาราง">
                                        <span class="fa fa-align-justify"></span>
                                    </label>
                                </div>
                                <%--</div>--%>

                                <div id="menu_thumbnail"></div>
                                <div id="menu_thumbnail_list" style="display:none;"></div>
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
                                        <h4 class="modal-title">เพิ่มเมนูอาหารใหม่</h4>
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
                                                            <th style="text-align:center;"><span class="required">จำนวนที่ใช้</span>
                                                            </th>
                                                            <th style="text-align:center;">Add-on (ลูกค้าเพิ่มได้)</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody style="text-align:center;">
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
                                                                <td style="width:30%;">
                                                                    <div class="col-md-4">
                                                                        <input type="number"
                                                                               style="text-align:center;width: 100%;"
                                                                               name="addonqty${mi.matItemNo}"
                                                                               value="0" min="0"
                                                                               step="0.01">
                                                                    </div>
                                                                    <div class="col-md-4">
                                                                            ${mi.unit.unitName}
                                                                    </div>
                                                                    <div class="col-md-4">
                                                                        <input type="number" min="0" placeholder="ราคา"
                                                                               name="addonprice${mi.matItemNo}"
                                                                               step="0.01"
                                                                               style="width: 100%;text-align: center;">
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
                                                        <c:if test="${branchUser.branchNo == branchUser.branch.mainBranchNo}">
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
                                                            class="btn btn-success"><i
                                                            class="fa fa-circle-o-notch fa-spin" id="loadingbtn"
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
                    </div>
                    <div class="modal fade" id="editMenu" role="dialog">
                        <div class="modal-dialog">
                            <!-- เนือหาของ Modal ทั้งหมด -->
                            <div class="modal-content modal-body-test" style="overflow-y:hidden;">
                                <!-- ส่วนหัวของ Modal -->
                                <div class="modal-header">
                                    <!-- ปุ่มกดปิด (X) ตรงส่วนหัวของ Modal -->
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">แก้ไขเมนูอาหาร <span id="show_menu_name_for_edit"></span>
                                    </h4>
                                </div>
                                <!-- ส่วนเนื้อหาของ Modal -->
                                <div class="modal-body">
                                    <form class="form-horizontal form-label-left input_mask" modelAttribute="menu"
                                          id="edit_menu" enctype="multipart/form-data">
                                        <input type="hidden" name="menuNo" id="hiddenmenuno">
                                        <div class="form-group">
                                            <img class="col-md-offset-3 col-sm-offset-3 col-md-6 col-sm-6 col-xs-12 img-resize"
                                                 style="margin-bottom:20px;cursor:pointer;" id="showpic_edit"
                                                 width="414" height="auto"
                                                 src="../images/default_upload_image.png"/>

                                            <div class="col-md-offset-3 col-sm-offset-3 col-md-6 col-sm-6 col-xs-12 has-feedback"
                                                 style="margin-bottom: 12px">
                                                <input type="file" accept="image/*"
                                                       class="form-control" name="menuPicPath"
                                                       id="edit_menu_pic"
                                                       onchange="document.getElementById('showpic_edit').src = window.URL.createObjectURL(this.files[0])"
                                                       placeholder="อัพโหลดรูปภาพ">
                                            </div>
                                            <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                                <label class="required">ชื่อเมนูอาหารภาษาไทย</label>
                                                <input type="text" class="form-control" name="menuNameTH"
                                                       id="edit_menu_nameTH"
                                                       placeholder="ชื่อเมนูอาหารภาษาไทย" required>
                                                <span class="fa fa-pencil form-control-feedback right"
                                                      aria-hidden="true"></span>
                                            </div>
                                            <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                                <label class="required">ชื่อเมนูอาหารภาษาอังกฤษ</label>
                                                <input type="text" class="form-control" name="menuNameEN"
                                                       id="edit_menu_nameEN"
                                                       placeholder="ชื่อเมนูอาหารภาษาอังกฤษ" required>
                                                <span class="fa fa-pencil form-control-feedback right"
                                                      aria-hidden="true"></span>
                                            </div>
                                            <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                                <label class="required">ราคา (บาท)</label>
                                                <input type="number" class="form-control" name="menuPrice"
                                                       id="edit_menu_price"
                                                       placeholder="ราคา" min="0" step="0.25" required>
                                                <span class="fa fa-money form-control-feedback right"
                                                      aria-hidden="true"></span>
                                            </div>
                                            <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback ">
                                                <label class="required">หมวดหมู่ของเมนู</label>
                                                <select name="menuGroupNo" id="edit_menu_stock_cat" class="form-control"
                                                        required>
                                                    <option disabled selected value="">เลือกหมวดหมู่เมนู</option>
                                                    <c:forEach items="${menuGroups}" var="mc">
                                                        <option value="${mc.menuGroupNo}">${mc.menuGroupNameTH}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="col-md-12 col-sm-12 col-xs-12 form-group has-feedback">
                                                <label>รายละเอียดของเมนู</label>
                                                <textarea rows="4" cols="100" class="form-control" name="menuDesc"
                                                          id="edit_menu_desc"
                                                          placeholder="รายละเอียด"></textarea>

                                            </div>
                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <label>เลือกวัตถุดิบที่ใช้ในเมนูนี้</label>
                                                <table class="table table-bordered table-striped"
                                                       id="material-datatable-2">
                                                    <thead>
                                                    <tr>
                                                        <th style="text-align:center;">ชื่อวัตถุดิบอาหาร</th>
                                                        <th style="text-align:center;" class="order">ประเภท</th>
                                                        <th style="text-align:center;"><span class="required">จำนวนที่ใช้</span>
                                                        </th>
                                                        <th style="text-align:center;">Add-on (ลูกค้าเพิ่มได้)</th>
                                                        <%--<th style="text-align:center;">ราคา</th>--%>
                                                    </tr>
                                                    </thead>
                                                    <tbody style="text-align:center;">
                                                    <c:forEach items="${materialItems}" var="mi">
                                                        <tr>
                                                            <td style="width:30%;">${mi.matItemName}</td>
                                                            <td style="width:20%;">${mi.materialCategory.matCatName}</td>
                                                            <td style="width:20%;">
                                                                <div class="col-md-6">
                                                                    <input matItemNo="${mi.matItemNo}" type="number"
                                                                           matItemName="${mi.matItemName}"
                                                                           unit="${mi.unit.unitName}"
                                                                           class="materialamount2"
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
                                                            </td>
                                                            <td style="width: 30%;">
                                                                <div class="col-md-4">
                                                                    <input type="number" value="0" min="0"
                                                                           class="addonqty"
                                                                           name="addonqty${mi.matItemNo}"
                                                                           id="addonqty${mi.matItemNo}" step="0.01"
                                                                           style="width: 100%;text-align: center;">
                                                                </div>
                                                                <div class="col-md-4">
                                                                        ${mi.unit.unitName}
                                                                </div>
                                                                <div class="col-md-4">
                                                                    <input type="number" min="0"
                                                                           class="addonprice"
                                                                           name="addonprice${mi.matItemNo}"
                                                                           id="addonprice${mi.matItemNo}"
                                                                           placeholder="ราคา" step="0.01"
                                                                           style="width: 100%;text-align: center;">
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
                                                    <div id="display_material_desc2"
                                                         style="margin-bottom:20px;margin-top:20px;"
                                                         class="submit-clear"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <!-- ปุ่มกดปิด (Close) ตรงส่วนล่างของ Modal -->
                                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                                                <div class="checkbox" style="display:inline-block;margin-right:15px;">
                                                    <label>
                                                        <input type="checkbox" name="menuAvailable"
                                                               id="edit_menu_available"
                                                               class="flat">
                                                        พร้อมจำหน่าย
                                                    </label>
                                                </div>
                                                <button type="submit" style="margin-left:5px;" class="btn btn-success">
                                                    <i class="fa fa-circle-o-notch fa-spin" id="loadingbtnedit"
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
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<jsp:include page="../_include/bottomenv.jsp"/>
<script>
    $(document).ready(function () {
        var addfirsttime = true;
        var editfirsttime = true;

        $("#addMenu").on('shown.bs.modal', function () {
            if (addfirsttime) {
                addfirsttime = false;
                $("#material-datatable-1").DataTable({
                    scrollY: "40vh",
                    paging: false,
                    order: [[1, "desc"]]
                });
            }
        });

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


        $("#datatable-menu").DataTable({
            order: [[0, "asc"]],
            columnDefs: [
                {orderable: false, targets: [-1]}
            ],
            columns: [
                {
                    data: 'menuName'
                },
                <c:if test="${branchUser.branchNo == branchUser.branch.mainBranchNo}">
                {
                    data: {
                        _: 'branch.display',
                        sort: 'branch.order'
                    }
                },
                </c:if>
                {
                    data: 'group'
                },
                {
                    data: {
                        _: 'menuPrice.display',
                        sort: 'menuPrice.order'
                    }
                },

                {
                    data: 'option'
                }
            ]
        });

        $("#showpic").click(function () {
            $("#add_menu_pic").click();
        });

        $("#showpic_edit").click(function () {
            $("#edit_menu_pic").click();
        });

        $("#add_menu_pic").change(function () {
            if ($("#add_menu_pic").val() == '') {
                $("#showpic").attr('src', '../images/default_upload_image.png');
            }
        });

        $("#edit_menu_pic").change(function () {
            if ($("#edit_menu_pic").val() == '') {
                $("#showpic_edit").attr('src', '../images/default_upload_image.png');
            }
        });

        $("#filter_by_category").change(refresh_table);

        $(".materialamount").on('change keyup', function () {
            $("#display_material_desc").empty();
            $(".materialamount").each(function () {
                if ($(this).val() > 0) {
                    $("#display_material_desc").append('<div class="col-md-4 col-md-offset-2" style="text-align:left;white-space:nowrap;overflow:hidden;text-overflow: ellipsis;">' + $(this).attr('matItemName') + '</div><div class="col-md-3 col-md-offset-2" style="text-align:left;">' + $(this).val() + ' ' + $(this).attr('unit') + '</div><br>');
                }
            });
        });

        $(".materialamount2").on('change keyup', function () {
            $("#display_material_desc2").empty();
            $(".materialamount2").each(function () {
                if ($(this).val() > 0) {
                    $("#display_material_desc2").append('<div class="col-md-4 col-md-offset-2" style="text-align:left;white-space:nowrap;overflow:hidden;text-overflow: ellipsis;">' + $(this).attr('matItemName') + '</div><div class="col-md-3 col-md-offset-2" style="text-align:left;">' + $(this).val() + ' ' + $(this).attr('unit') + '</div><br>');
                }
            });
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

        $("#displayTable").click(function () {
            $("#menu_thumbnail_list").css('display', '');
            $("#menu_thumbnail").css('display', 'none');
            $('.pagination').css('display', '');
            $("#filter_by_category").css('visibility', '');
//            $("#filter_by_category").val(0);
            $("#myInput").parent().css('visibility', '');
            $("#myInput").val('');
            refresh_table();
        });

        refresh_table();
    });

    function refresh_table() {
        $.ajax({
            type: "POST",
            url: "${contextPath}/menu/getmenus/" + $("#filter_by_category").val(),
            dataType: "json",
            success: function (json) {
                //remove
                $("#menu_thumbnail").empty();
                $("#menu_thumbnail_list").empty();
                var data_array = [];
                if (json.length != 0) {
                    var mymenu = json[0];
                    for (var i = 0; i < mymenu.length; i++) {
                        var obj = mymenu[i];
                        var menu = obj.menu;
                        //Gallery
                        var div = '\
                        <div class="col-md-55">\
                        <div class="thumbnail thumbnail_inline">\
                        <div class="image view view-first">\
                        <img style="width: 100%; display: block;" src="' + (menu.menuPicPath != null ? ('../images/' + menu.menuPicPath) : ('../images/default_upload_image.png')) + '" alt="image"/>\
                        <div class="mask">\
                        <p style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;">' + (menu.menuDesc == '' || menu.menuDesc == null ? 'ไม่มีรายละเอียด' : menu.menuDesc) + '</p>\
                        <div class="tools tools-bottom">\
                        <a title="เมนูของทุกสาขา" style="color:white;margin-right:5px;"><i class="fa ' + (menu.localFlag == 0 ? 'fa-users' : 'fa-user' ) + '"></i> <span style="font-size:14px">' + (menu.localFlag == 0 ? ' เป็นเมนูของทุกสาขา' : ' เป็นเมนูเฉพาะสาขานี้') + '</span></a>\
                        </div>\
                        </div>\
                        </div>\
                        <div class="caption col-md-12" style="color:#73879C">\
                        <p class="cardname col-md-12" style="text-align:center;font-weight:bold;white-space:nowrap;overflow:hidden;text-overflow: ellipsis;cursor:pointer;" data-toggle="modal" data-target="#editMenu" onclick="set_menu(' + menu.menuNo + ')">' + menu.menuNameTH + " / " + menu.menuNameEN + '</p>\
                        <p class="col-md-12" style="text-align:center;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;">หมวดหมู่ : ' + menu.menuGroup.menuGroupNameTH + '</p>\
                        <p class="col-md-12" style="text-align:center">' + menu.menuPrice.toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " บาท" + '</p>\
                        <div style="text-align:left;" class="col-md-7">\
                        ' + (menu.localFlag == 0 && ${branchUser.branchNo != branchUser.branch.mainBranchNo} ? '' : '<a title="แก้ไข" style="color:#73879C;cursor:pointer;margin-right:5px;" data-toggle="modal" data-target="#editMenu" onclick="set_menu(' + menu.menuNo + ')"><i class="fa fa-pencil"></i></a>') + '\
                        ' + (menu.localFlag != 0 && ${branchUser.branchNo == branchUser.branch.mainBranchNo} ? ('<a title="ทำให้เป็นเมนูของทุกสาขา" onclick="turn_official(' + menu.menuNo + ')" style="color:#73879C;cursor:pointer;margin-right:5px;"><i class="fa fa-users"></i></a>') : '') + '\
                        <a title="เมนูนี้' + (obj.available == true ? '' : 'ไม่' ) + 'พร้อมจำหน่าย คลิกเพื่อเปลี่ยน" onclick="change_available(' + menu.menuNo + ')" style="color:#73879C;cursor:pointer;margin-right:5px;"><i class="fa ' + (obj.available == true ? 'fa-check-square-o' : 'fa-square-o' ) + '"></i></a>\
                        ' + (menu.localFlag == 0 && ${branchUser.branchNo != branchUser.branch.mainBranchNo} ? '' : '<a title="ลบ" onclick="del_menu(' + menu.menuNo + ',\'' + menu.menuNameTH + '\')" style="color:#73879C;cursor:pointer;"><i class="fa fa-trash"></i></a>') + '\
                        </div>\
                        <div style="color:white;background-color:' + (menu.localFlag == 0 ? "#73879C" : "red") + ';border-radius:4px;text-align:center;" class="col-md-5">' + (menu.localFlag == 0 ? "ทุกสาขา" : "สาขา" + (menu.localFlag ==${branchUser.branchNo} ? "นี้" : " " + menu.localFlag)) + '</div>\
                        </div>\
                        </div>\
                        ';
                        $("#menu_thumbnail").append(div);
                        var price_order = (menu.menuPrice.toFixed(2) * 100000) + "";
                        for (var j = price_order.length; j < 20; j++) {
                            price_order = "0" + price_order;
                        }

                        //Table
                        var list = '\
                        <div class="col-md-12">\
                        <div class="thumbnail thumbnail_list">\
                        <div class="image view view-first col-md-4" style="height:100%">\
                        <img style="height: 100%; display: block;margin:auto;" src="' + (menu.menuPicPath != null ? ('../images/' + menu.menuPicPath) : ('../images/default_upload_image.png')) + '" alt="image"/>\
                        <div class="mask" style="height:100%">\
                        <p style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;">' + (menu.menuDesc == '' || menu.menuDesc == null ? 'ไม่มีรายละเอียด' : menu.menuDesc) + '</p>\
                        <div class="tools tools-bottom" style="margin: 100px 0 0;">\
                        <a title="เมนูของทุกสาขา" style="color:white;margin-right:5px;"><i class="fa ' + (menu.localFlag == 0 ? 'fa-users' : 'fa-user' ) + '"></i> <span style="font-size:14px">' + (menu.localFlag == 0 ? ' เป็นเมนูของทุกสาขา' : ' เป็นเมนูเฉพาะสาขานี้') + '</span></a>\
                        </div>\
                        </div>\
                        </div>\
                        <div class="caption col-md-8" style="color:#73879C;height:100%;">\
                        <p class="cardname col-md-12" style="font-weight:bold;white-space:nowrap;overflow:hidden;text-overflow: ellipsis;cursor:pointer;" data-toggle="modal" data-target="#editMenu" onclick="set_menu(' + menu.menuNo + ')">' + menu.menuNameTH + " / " + menu.menuNameEN + '</p>\
                        <p class="col-md-12" style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;">หมวดหมู่ : ' + menu.menuGroup.menuGroupNameTH + '</p>\
                        <p class="col-md-12" >' + "ราคา : " + menu.menuPrice.toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " บาท" + '</p>\
                        <p class="col-md-12 description" >' + "รายละเอียด : " + (menu.menuDesc == null ? '-' : menu.menuDesc) + '</p>\
                        <div style="text-align:right;bottom:0px;position: absolute;right:5px;" class="col-md-4">\
                        ' + (menu.localFlag == 0 && ${branchUser.branchNo != branchUser.branch.mainBranchNo} ? '' : '<a title="แก้ไข" style="color:#73879C;cursor:pointer;margin-right:5px;" data-toggle="modal" data-target="#editMenu" onclick="set_menu(' + menu.menuNo + ')"><i class="fa fa-pencil"></i></a>') + '\
                        ' + (menu.localFlag != 0 && ${branchUser.branchNo == branchUser.branch.mainBranchNo} ? ('<a title="ทำให้เป็นเมนูของทุกสาขา" onclick="turn_official(' + menu.menuNo + ')" style="color:#73879C;cursor:pointer;margin-right:5px;"><i class="fa fa-users"></i></a>') : '') + '\
                        <a title="เมนูนี้' + (obj.available == true ? '' : 'ไม่' ) + 'พร้อมจำหน่าย คลิกเพื่อเปลี่ยน" onclick="change_available(' + menu.menuNo + ')" style="color:#73879C;cursor:pointer;margin-right:5px;"><i class="fa ' + (obj.available == true ? 'fa-check-square-o' : 'fa-square-o' ) + '"></i></a>\
                        ' + (menu.localFlag == 0 && ${branchUser.branchNo != branchUser.branch.mainBranchNo} ? '' : '<a title="ลบ" onclick="del_menu(' + menu.menuNo + ',\'' + menu.menuNameTH + '\')" style="color:#73879C;cursor:pointer;"><i class="fa fa-trash"></i></a>') + '\
                        </div>\
                        <div style="color:white;background-color:' + (menu.localFlag == 0 ? "#73879C" : "red") + ';border-radius:4px;text-align:center;top:0px;position: absolute;right:5px;" class="col-md-4">' + (menu.localFlag == 0 ? "ทุกสาขา" : "สาขา" + (menu.localFlag ==${branchUser.branchNo} ? "นี้" : " " + menu.localFlag)) + '</div>\
                        </div>\
                        </div>\
                        ';
                        $("#menu_thumbnail_list").append(list);
                        var price_order = (menu.menuPrice.toFixed(2) * 100000) + "";
                        for (var j = price_order.length; j < 20; j++) {
                            price_order = "0" + price_order;
                        }

                    }
                    if (json.length == 2) {
                        var othermenu = json[1];
                        for (var i = 0; i < othermenu.length; i++) {
                            var menu = othermenu[i];
                            var div = '\
                            <div class="col-md-55">\
                            <div class="thumbnail thumbnail_inline">\
                            <div class="image view view-first">\
                            <img style="width: 100%; display: block;" src="' + (menu.menuPicPath != null ? ('../images/' + menu.menuPicPath) : ('../images/default_upload_image.png')) + '" alt="image"/>\
                            <div class="mask">\
                            <p style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;">' + (menu.menuDesc == '' || menu.menuDesc == null ? 'ไม่มีรายละเอียด' : menu.menuDesc) + '</p>\
                            <div class="tools tools-bottom">\
                            <a title="เมนูของทุกสาขา" style="color:white;margin-right:5px;"><i class="fa ' + (menu.localFlag == 0 ? 'fa-users' : 'fa-user' ) + '"></i> <span style="font-size:14px">' + (menu.localFlag == 0 ? ' เป็นเมนูของทุกสาขา' : ' เป็นเมนูเฉพาะสาขา ' + menu.localFlag ) + '</span></a>\
                            </div>\
                            </div>\
                            </div>\
                            <div class="caption col-md-12" style="color:#73879C">\
                            <p class="col-md-12" style="text-align:center;font-weight:bold;white-space:nowrap;overflow:hidden;text-overflow: ellipsis;">' + menu.menuNameTH + " / " + menu.menuNameEN + '</p>\
                            <p class="col-md-12" style="text-align:center;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;">หมวดหมู่ : ' + menu.menuGroup.menuGroupNameTH + '</p>\
                            <p class="col-md-12" style="text-align:center">' + menu.menuPrice.toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " บาท" + '</p>\
                            <div style="text-align:left;" class="col-md-7">\
                            <a title="ทำให้เป็นเมนูของทุกสาขา" onclick="turn_official(' + menu.menuNo + ')" style="color:#73879C;cursor:pointer;margin-right:5px;"><i class="fa fa-users"></i></a>\
                            </div>\
                            <div style="color:white;background-color:yellowgreen;border-radius:4px;text-align:center;" class="col-md-5">' + (menu.localFlag == 0 ? "ทุกสาขา" : "สาขา " + menu.localFlag) + '</div>\
                            </div>\
                            </div>\
                            ';
                            $("#menu_thumbnail").append(div);
                            var price_order = (menu.menuPrice.toFixed(2) * 100000) + "";
                            for (var j = price_order.length; j < 20; j++) {
                                price_order = "0" + price_order;
                            }

                            var list = '\
                            <div class="col-md-12">\
                            <div class="thumbnail thumbnail_inline_list">\
                            <div class="image view view-first col-md-4" style="height:100%"">\
                            <img style="height: 100%; display: block;margin:auto;" src="' + (menu.menuPicPath != null ? ('../images/' + menu.menuPicPath) : ('../images/default_upload_image.png')) + '" alt="image"/>\
                            <div class="mask" style="height:100%">\
                            <p style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;">' + (menu.menuDesc == '' || menu.menuDesc == null ? 'ไม่มีรายละเอียด' : menu.menuDesc) + '</p>\
                            <div class="tools tools-bottom" style="margin: 110px 0 0;" >\
                            <a title="เมนูของทุกสาขา" style="color:white;margin-right:5px;"><i class="fa ' + (menu.localFlag == 0 ? 'fa-users' : 'fa-user' ) + '"></i> <span style="font-size:14px">' + (menu.localFlag == 0 ? ' เป็นเมนูของทุกสาขา' : ' เป็นเมนูเฉพาะสาขา ' + menu.localFlag ) + '</span></a>\
                            </div>\
                            </div>\
                            </div>\
                            <div class="caption col-md-8" style="color:#73879C;height:100%;">\
                            <p class="col-md-12" style="font-weight:bold;white-space:nowrap;overflow:hidden;text-overflow: ellipsis;">' + menu.menuNameTH + " / " + menu.menuNameEN + '</p>\
                            <p class="col-md-12" style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;">หมวดหมู่ : ' + menu.menuGroup.menuGroupNameTH + '</p>\
                            <p class="col-md-12" >' + "ราคา : " + menu.menuPrice.toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " บาท" + '</p>\
                            <p class="col-md-12 description" >' + "รายละเอียด : " + menu.menuDesc + '</p>\
                            <div style="text-align:right;position:absolute;right:5px;bottom:0px;" class="col-md-4">\
                            <a title="ทำให้เป็นเมนูของทุกสาขา" onclick="turn_official(' + menu.menuNo + ')" style="color:#73879C;cursor:pointer;margin-right:5px;"><i class="fa fa-users"></i></a>\
                            </div>\
                            <div style="color:white;background-color:yellowgreen;border-radius:4px;text-align:center;top:0px;position:absolute;right:5px" class="col-md-4">' + (menu.localFlag == 0 ? "ทุกสาขา" : "สาขา " + menu.localFlag) + '</div>\
                            </div>\
                            </div>\
                            ';
                            $("#menu_thumbnail_list").append(list);
                            var price_order = (menu.menuPrice.toFixed(2) * 100000) + "";
                            for (var j = price_order.length; j < 20; j++) {
                                price_order = "0" + price_order;
                            }

                        }
                    }
                    $("#error_show").html('');
                    $("#datatable-menu").DataTable().clear();
                    $("#datatable-menu").DataTable().rows.add(data_array).draw(false);
                }

                filterCard();
            }
        });
    }

    $("#add_menu").submit(function () {
        $('#loadingbtn').show();
        $.ajax({
            type: "POST",
            data: new FormData($("#add_menu")[0]),
            enctype: 'multipart/form-data',
            cache: false,
            contentType: false,
            processData: false,
            url: "${contextPath}/menu/managemenu",
            success: function (result) {
                $('#loadingbtn').hide();
                swal("สำเร็จ", "เมนู " + $("#add_menu").val() + " ถูกเพิ่มเรียบร้อยแล้ว", "success");
                reset_field();
                $("#addMenu").modal('toggle');
                refresh_table();
            }, error: function (result) {
                $('#loadingbtn').hide();
                swal("ไม่สำเร็จ", "ชื่อภาษาไทยหรืออังกฤษอาจซ้ำ กรุณาลองใหม่ในภายหลัง", "error");
            }
        });
        return false;
    });


    $('.modal').on('hidden.bs.modal', function () {
        reset_field();
    });

    function reset_field() {
        $("#add_menu")[0].reset();
        $("#showpic").attr('src', '../images/default_upload_image.png');
        $("#add_menu_available").parent().removeClass('checked');
        $("#add_menu_available").attr('checked', false);
        $("#add_menu_official").parent().removeClass('checked');
        $("#add_menu_official").attr('checked', false);
        $("#display_material_desc").empty();
    }

    $("#edit_menu").submit(function () {
        var object = $("#edit_menu").serialize();
        $('#loadingbtnedit').show();
        $.ajax({
            type: "POST",
            data: new FormData($("#edit_menu")[0]),
            enctype: 'multipart/form-data',
            cache: false,
            contentType: false,
            processData: false,
            url: "${contextPath}/menu/managemenu",
            success: function (result) {
                $('#loadingbtnedit').hide();
                swal("สำเร็จ", "เมนูนี้ถูกแก้ไขเรียบร้อยแล้ว", "success");
                $("#edit_menu")[0].reset();
                $("#editMenu").modal('toggle');
                refresh_table();
            }, error: function (result) {
                $('#loadingbtnedit').hide();
                swal("ไม่สำเร็จ", "ชื่อภาษาไทยหรืออังกฤษอาจซ้ำ กรุณาลองใหม่ในภายหลัง", "error");
            }
        });
        return false;
    });

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

                $(".addonqty").val(0);
                $(".addonprice").val('');
                addOns = menu.addOns;
                console.log(addOns);
                for (var i = 0; i < addOns.length; i++) {
                    $("#addonqty" + addOns[i].matNo).val(addOns[i].qty);
                    $('#addonprice' + addOns[i].matNo).val(addOns[i].price);
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

                $("#showpic_edit").attr('src', menu.menuPicPath == null ? '../images/default_upload_image.png' : ('../images/' + menu.menuPicPath));
            }
        });
    }

    function del_menu(menuNo, menuNameTH) {
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
                    url: "${contextPath}/menu/delmenu/" + menuNo,
                    success: function (json) {
                        swal("สำเร็จ", menuNameTH + " ถูกลบเรียบร้อยแล้ว", "success");
                        refresh_table();
                    },
                    error: function (json) {
                        swal("ไม่สำเร็จ", "เมนูนี้ถูกใช้ในเมนูอาหารแบบชุด \nกรุณาลบออกจากเมนูอาหารแบบชุดก่อน", "error");
                    }
                });
            });
    }

    function change_available(menuno) {
        $.ajax({
            type: "POST",
            data: {menuno: menuno},
            url: "${contextPath}/menu/changeavailable",
            success: function (result) {
                swal("สำเร็จ", "เปลี่ยน \"" + result.menu.menuNameTH + "\" เป็น " + (result.available == false ? 'ไม่' : '') + "พร้อมจำหน่าย เรียบร้อยแล้ว", "success");
                refresh_table();
            }, error: function (result) {
                swal("ไม่สำเร็จ", "กรุณาลองใหม่ภายหลัง", "error");
            }
        });
    }

    function turn_official(menuno) {
        swal({
                title: "เปลี่ยนให้เป็นเมนูของทุกสาขา",
                text: "คุณจะไม่สามารถเปลี่ยนกลับได้",
                type: "warning",
                showCancelButton: true,
                cancelButtonText: "ยกเลิก",
                confirmButtonText: "ใช่, ต้องการเปลี่ยน",
                confirmButtonColor: "#DD6B55",
                closeOnConfirm: false
            },
            function () {
                $.ajax({
                    type: "POST",
                    data: {menuno: menuno},
                    url: "${contextPath}/menu/promoteofficial",
                    success: function (result) {
                        swal("สำเร็จ", "เปลี่ยน \"" + result.menuNameTH + "\" เป็น เมนูของทุกสาขา เรียบร้อยแล้ว", "success");
                        refresh_table();
                    }, error: function () {
                        swal("ไม่สำเร็จ", "กรุณาลองใหม่ภายหลัง", "error");
                    }
                });
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

    .thumbnail_inline_list {
        height: 200px !important;
    }

    .description {
        line-height: 1.5em;
        display: -webkit-box;
        -webkit-line-clamp: 3;
        -webkit-box-orient: vertical;
        overflow: hidden;
    }

</style>
</body>
</html>