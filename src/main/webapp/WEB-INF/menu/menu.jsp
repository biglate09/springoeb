<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
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
                            <h4>เมนูอาหารแบบเดี่ยว</h4>
                        </div>
                        <div class="x_content">
                            <form action="#">
                                <div class="col-md-9" style="padding:0px;">
                                    <a data-toggle="modal" data-target="#addMenu"
                                       class="btn btn-success btn-sm"><i class="fa fa-plus-circle"></i>&nbsp;
                                        เพิ่มเมนู</a>
                                </div>
                                <div class="col-md-3 form-group has-feedback" style="padding:0px;">
                                    <label>ค้นหาจากประเภทอาหาร</label>
                                    <select class="form-control" id="filter_by_category">
                                        <option value="0">ทั้งหมด</option>
                                        <c:forEach items="${menuCategories}" var="mc">
                                            <option value="${mc.menuCatNo}">${mc.menuCatNameTH}
                                                / ${mc.menuCatNameEN}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div id="menu_thumbnail">

                                </div>
                            </form>
                        </div>
                        <div class="modal fade" id="addMenu" role="dialog">
                            <div class="modal-dialog modal-lg">
                                <!-- เนือหาของ Modal ทั้งหมด -->
                                <div class="modal-content">
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
                                                     id="showpic" style="margin-bottom:20px;" height="auto" width="414"
                                                     src="../images/default_image_upload.png"/>
                                                <div class="col-md-offset-3 col-sm-offset-3 col-md-6 col-sm-6 col-xs-12 has-feedback"
                                                     style="margin-bottom: 12px">
                                                    <input type="file" accept="image/x-png,image/gif,image/jpeg"
                                                           class="form-control" name="menuPicPath"
                                                           id="add_menu_pic"
                                                           onchange="document.getElementById('showpic').src = window.URL.createObjectURL(this.files[0])"
                                                           placeholder="อัพโหลดรูปภาพ" required>
                                                </div>
                                                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                                    <label>ชื่อเมนูอาหารภาษาไทย</label>
                                                    <input type="text" class="form-control" name="menuNameTH"
                                                           id="add_menu_nameTH"
                                                           placeholder="ชื่อเมนูอาหารภาษาไทย" required>
                                                    <span class="fa fa-pencil form-control-feedback right"
                                                          aria-hidden="true"></span>
                                                </div>
                                                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                                    <label>ชื่อเมนูอาหารภาษาอังกฤษ</label>
                                                    <input type="text" class="form-control" name="menuNameEN"
                                                           id="add_menu_nameEN"
                                                           placeholder="ชื่อเมนูอาหารภาษาอังกฤษ" required>
                                                    <span class="fa fa-pencil form-control-feedback right"
                                                          aria-hidden="true"></span>
                                                </div>
                                                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                                    <label>ราคา (บาท)</label>
                                                    <input type="number" class="form-control" name="menuPrice"
                                                           id="add_menu_price"
                                                           placeholder="ราคา" min="0" step="0.25" required>
                                                    <span class="fa fa-money form-control-feedback right"
                                                          aria-hidden="true"></span>
                                                </div>
                                                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                                    <label>ประเภทของเมนู</label>
                                                    <select name="menuCatNo" id="add_menu_stock_cat"
                                                            class="form-control" required>
                                                        <option disabled selected>เลือกประเภทเมนู</option>
                                                        <c:forEach items="${menuCategories}" var="mc">
                                                            <option value="${mc.menuCatNo}">${mc.menuCatNameTH}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <div class="col-md-12 col-sm-12 col-xs-12 form-group has-feedback">
                                                    <label>รายละเอียดของเมนู</label>
                                                    <textarea rows="4" cols="100" class="form-control" name="menuDesc"
                                                              id="add_menu_desc"
                                                              placeholder="รายละเอียด" required></textarea>
                                                </div>


                                            </div>
                                            <div class="modal-footer">
                                                <!-- ปุ่มกดปิด (Close) ตรงส่วนล่างของ Modal -->
                                                <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                                                    <div class="checkbox" style="display:inline-block">
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
                        <div class="modal-dialog modal-lg">
                            <!-- เนือหาของ Modal ทั้งหมด -->
                            <div class="modal-content">
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
                                                 style="margin-bottom:20px;" id="showpic_edit" width="414" height="auto"
                                                 src="../images/default_image_upload.png"/>

                                            <div class="col-md-offset-3 col-sm-offset-3 col-md-6 col-sm-6 col-xs-12 has-feedback"
                                                 style="margin-bottom: 12px">
                                                <input type="file" accept="image/x-png,image/gif,image/jpeg"
                                                       class="form-control" name="menuPicPath"
                                                       id="edit_menu_pic"
                                                       onchange="document.getElementById('showpic_edit').src = window.URL.createObjectURL(this.files[0])"
                                                       placeholder="อัพโหลดรูปภาพ">
                                            </div>
                                            <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                                <label>ชื่อเมนูอาหารภาษาไทย</label>
                                                <input type="text" class="form-control" name="menuNameTH"
                                                       id="edit_menu_nameTH"
                                                       placeholder="ชื่อเมนูอาหารภาษาไทย" required>
                                                <span class="fa fa-pencil form-control-feedback right"
                                                      aria-hidden="true"></span>
                                            </div>
                                            <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                                <label>ชื่อเมนูอาหารภาษาอังกฤษ</label>
                                                <input type="text" class="form-control" name="menuNameEN"
                                                       id="edit_menu_nameEN"
                                                       placeholder="ชื่อเมนูอาหารภาษาอังกฤษ" required>
                                                <span class="fa fa-pencil form-control-feedback right"
                                                      aria-hidden="true"></span>
                                            </div>
                                            <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                                <label>ราคา (บาท)</label>
                                                <input type="number" class="form-control" name="menuPrice"
                                                       id="edit_menu_price"
                                                       placeholder="ราคา" min="0" step="0.25" required>
                                                <span class="fa fa-money form-control-feedback right"
                                                      aria-hidden="true"></span>
                                            </div>
                                            <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                                <label>ประเภทของเมนู</label>
                                                <select name="menuCatNo" id="edit_menu_stock_cat" class="form-control"
                                                        required>
                                                    <option disabled selected>เลือกประเภทเมนู</option>
                                                    <c:forEach items="${menuCategories}" var="mc">
                                                        <option value="${mc.menuCatNo}">${mc.menuCatNameTH}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="col-md-12 col-sm-12 col-xs-12 form-group has-feedback">
                                                <label>รายละเอียดของเมนู</label>
                                                <textarea rows="4" cols="100" class="form-control" name="menuDesc"
                                                          id="edit_menu_desc"
                                                          placeholder="รายละเอียด" required></textarea>

                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <!-- ปุ่มกดปิด (Close) ตรงส่วนล่างของ Modal -->
                                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                                                <div class="checkbox" style="display:inline-block">
                                                    <label>
                                                        <input type="checkbox" name="menuAvailable"
                                                               id="edit_menu_available"
                                                               class="flat">
                                                        พร้อมจำหน่าย
                                                    </label>
                                                </div>
                                                <button type="submit" style="margin-left:5px;" class="btn btn-success">
                                                    ตกลง
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
        $("#datatable-menu").DataTable({
            order: [[0, "asc"]],
            columnDefs: [
                {orderable: false, targets: [-1]}
            ],
            columns: [
                {
                    data: 'menuPicPath'
                },
                {
                    data: 'menuName'
                },
                {
                    data: 'menuDesc'
                },
                {
                    data: 'menuPrice'
                },
                {
                    data: 'group'
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
                $("#showpic").attr('src', '../images/default_image_upload.png');
            }
        });

        $("#edit_menu_pic").change(function () {
            if ($("#edit_menu_pic").val() == '') {
                $("#showpic_edit").attr('src', '../images/default_image_upload.png');
            }
        });

        $("#filter_by_category").change(refresh_table);

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
                if (json.length != 0) {
                    for (var i = 0; i < json.length; i++) {
                        var obj = json[i];
                        var div = '\
                        <div class="col-md-55">\
                        <div class="thumbnail thumbnail_inline">\
                        <div class="image view view-first">\
                        <img style="width: 100%; display: block;"\
                    src="../images/menu/' + obj.menuPicPath + '" alt="image"/>\
                        <div class="mask">\
                        <p style="white-space: nowrap;overflow:hidden;text-overflow: ellipsis;">' + obj.menuDesc + '</p>\
                        <div class="tools tools-bottom">\
                        <a title="แก้ไข" data-toggle="modal" data-target="#editMenu" onclick="set_menu(' + obj.menuNo + ')" style="color:white;cursor:pointer;margin-right:5px;"><i class="fa fa-pencil"></i></a>\
                        <a title="พร้อมจำหน่าย" onclick="change_available(' + obj.menuNo + ')" style="color:white;cursor:pointer;margin-right:5px;"><i class="fa ' + (obj.available == true ? 'fa-eye' : 'fa-eye-slash' ) + '"></i></a>\
                        <a title="ลบ" onclick="del_menu(' + obj.menuNo + ',\'' + obj.menuNameTH + '\')" style="color:white;cursor:pointer;"><i class="fa fa-trash"></i></a>\
                        </div>\
                        </div>\
                        </div>\
                        <div class="caption" style="color:#73879C">\
                        <p style="text-align:center;font-weight:bold;white-space:nowrap;overflow:hidden;text-overflow: ellipsis;cursor:pointer;" data-toggle="modal" data-target="#editMenu" onclick="set_menu(' + obj.menuNo + ')">' + obj.menuNameTH + " / " + obj.menuNameEN + '</p>\
                        <p style="text-align:center;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;">ประเภท : ' + obj.menuCategory.menuCatNameTH + '</p>\
                        <p style="text-align:center">' + obj.menuPrice.toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " บาท" + '</p>\
                        <div style="text-align:center;">\
                        <a title="แก้ไข" data-toggle="modal" data-target="#editMenu" onclick="set_menu(' + obj.menuNo + ')" style="color:#73879C;cursor:pointer;margin-right:5px;"><i class="fa fa-pencil"></i></a>\
                        <a title="พร้อมจำหน่าย" onclick="change_available(' + obj.menuNo + ')" style="color:#73879C;cursor:pointer;margin-right:5px;"><i class="fa ' + (obj.available == true ? 'fa-eye' : 'fa-eye-slash' ) + '"></i></a>\
                        <a title="ลบ" onclick="del_menu(' + obj.menuNo + ',\'' + obj.menuNameTH + '\')" style="color:#73879C;cursor:pointer;"><i class="fa fa-trash"></i></a>\
                        </div>\
                        </div>\
                        </div>\
                        </div>\
                        ';
                        $("#menu_thumbnail").append(div);
                    }
                } else {
                    $("#menu_thumbnail").append('\
                    <div class="well" style="overflow: auto">\
                        <p style="text-align:center;font-weight:bold;"> ไม่พบข้อมูลเมนูอาหารแบบเดี่ยว จากการค้นหาประเภทอาหาร ' + $("#filter_by_category option:selected").text() + ' </p>\
                    </div>\
                    ');
                }
            }
        });
    }

    $("#add_menu").submit(function () {
        $.ajax({
            type: "POST",
            data: new FormData($("#add_menu")[0]),
            enctype: 'multipart/form-data',
            cache: false,
            contentType: false,
            processData: false,
            url: "${contextPath}/menu/managemenu",
            success: function (result) {
                swal("สำเร็จ", "เมนู " + $("#add_menu").val() + " ถูกเพิ่มเรียบร้อยแล้ว", "success");
                $("#add_menu")[0].reset();
                $("#addMenu").modal('toggle');
                $("#showpic").attr('src', '../images/default_image_upload.png');
                $("#add_menu_available").parent().removeClass('checked');
                $("#add_menu_available").attr('checked', false);
                refresh_table();
            }, error: function (result) {
                swal("ไม่สำเร็จ", "ชื่อภาษาไทยหรืออังกฤษอาจซ้ำ กรุณาลองใหม่ในภายหลัง", "error");
            }
        });
        return false;
    });

    $("#edit_menu").submit(function () {
        var object = $("#edit_menu").serialize();
        $.ajax({
            type: "POST",
            data: new FormData($("#edit_menu")[0]),
            enctype: 'multipart/form-data',
            cache: false,
            contentType: false,
            processData: false,
            url: "${contextPath}/menu/managemenu",
            success: function (result) {
                swal("สำเร็จ", "เมนูนี้ถูกแก้ไขเรียบร้อยแล้ว", "success");
                $("#edit_menu")[0].reset();
                $("#editMenu").modal('toggle');
                refresh_table();
            }, error: function (result) {
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
                $("#hiddenmenuno").val(result.menuNo);
                $("#edit_menu_nameTH").val(result.menuNameTH);
                $("#edit_menu_nameEN").val(result.menuNameEN);
                $("#show_menu_name_for_edit").html(result.menuNameTH + " / " + result.menuNameEN);
                $("#edit_menu_desc").val(result.menuDesc);
                $("#edit_menu_price").val(result.menuPrice.toFixed(2));
                $("#edit_menu_available").val(result.menuAvailable);
                $("#edit_menu_stock_cat").val(result.menuCatNo);
                if (result.available) {
                    $("#edit_menu_available").parent().addClass('checked');
                    $("#edit_menu_available").attr('checked', true);
                } else {
                    $("#edit_menu_available").parent().removeClass('checked');
                    $("#edit_menu_available").attr('checked', false);
                }
                $("#showpic_edit").attr('src', '../images/menu/' + result.menuPicPath);
            }
        });
    }

    function del_menu(menuNo, menuNameTH) {
        swal({
                title: "ยืนยันการลบ " + menuNameTH,
                text: "เมื่อยืนยัน คุณจะไม่สามารถนำข้อมูล " + menuNameTH + " กลับมาได้",
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
                        swal("ไม่สำเร็จ", "เซิร์ฟเวอร์อาจมีปัญหา", "error");
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
//                swal("สำเร็จ", "แก้ไขความพร้อมจำหน่ายเรียบร้อยแล้ว", "success");
                refresh_table();
            }, error: function (result) {
                swal("ไม่สำเร็จ", "กรุณาลองใหม่ภายหลัง", "error");
            }
        });
    }
</script>

<style>
    .thumbnail_inline {
        height: 250px !important;
    }
</style>
</body>
</html>