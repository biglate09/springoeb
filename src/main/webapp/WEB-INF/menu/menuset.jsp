<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../_include/topenv.jsp"/>
    <title>เมนูอาหารแบบชุด</title>
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
                            <form action="#">
                                <p>
                                    <a data-toggle="modal" data-target="#addMenuSet"
                                       class="btn btn-success btn-sm"><i class="fa fa-plus-circle"></i>&nbsp;
                                        เพิ่มชุดเมนู</a>
                                </p>

                                <div class="col-md-55">
                                    <div class="thumbnail_inline">
                                        <div class="image view view-first">
                                            <img style="width: 100%; display: block;" src="../images/default_image_upload.png" alt="image" />
                                            <div class="mask">
                                                <div class="" style="color:#fff;text-align:center;font-size:17px;">
                                                    <a data-toggle="modal" data-target="#editMenuSet" style="color:white;"><i class="fa fa-pencil"></i></a>
                                                    <a href="#" style="color:white;"><i class="fa fa-times"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="caption">
                                            <p style="">Name</p>
                                            <p style="">Price</p>
                                            <p style="">Description</p>
                                        </div>
                                    </div>
                                </div>
                            </form>
                                <div class="modal fade" id="addMenuSet" role="dialog">
                                    <div class="modal-dialog modal-lg">
                                        <!-- เนือหาของ Modal ทั้งหมด -->
                                        <div class="modal-content">
                                            <!-- ส่วนหัวของ Modal -->
                                            <div class="modal-header">
                                                <!-- ปุ่มกดปิด (X) ตรงส่วนหัวของ Modal -->
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                <h4 class="modal-title">เพิ่มชุดเมนูอาหารใหม่</h4>
                                            </div>
                                            <!-- ส่วนเนื้อหาของ Modal -->
                                            <div class="modal-body">
                                                <form class="form-horizontal form-label-left input_mask" modelAttribute="menuset"
                                                      id="add_menuset" enctype="multipart/form-data">
                                                    <div class="form-group">
                                                        <img class="col-md-offset-3 col-sm-offset-3 col-md-6 col-sm-6 col-xs-12 img-resize" id="showpic_menuset"  height="auto" width="414" src="../images/default_image_upload.png" />

                                                        <div class="col-md-offset-3 col-sm-offset-3 col-md-6 col-sm-6 col-xs-12 has-feedback" style="margin-bottom: 12px">
                                                            <input type="file" class="form-control" name="menuSetPicPath"
                                                                   id="add_menuset__pic" onchange="document.getElementById('showpic_menuset').src = window.URL.createObjectURL(this.files[0])"
                                                                   placeholder="อัพโหลดรูปภาพ" >
                                                        </div>

                                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                                            <label>ชื่อเมนูอาหารภาษาไทย</label>
                                                            <input type="text" class="form-control" name="menuSetNameTH"
                                                                   id="add_menuset_nameTH"
                                                                   placeholder="ชื่อเมนูอาหารภาษาไทย" required>
                                                            <span class="fa fa-pencil form-control-feedback right"
                                                                  aria-hidden="true"></span>
                                                        </div>
                                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                                            <label>ชื่อเมนูอาหารภาษาอังกฤษ</label>
                                                            <input type="text" class="form-control" name="menuSetNameEN"
                                                                   id="add_menuset_nameEN"
                                                                   placeholder="ชื่อเมนูอาหารภาษาอังกฤษ" required>
                                                            <span class="fa fa-pencil form-control-feedback right"
                                                                  aria-hidden="true"></span>
                                                        </div>
                                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                                            <label>ราคา (บาท)</label>
                                                            <input type="number" class="form-control" name="menuSetPrice"
                                                                   id="add_menuset_price"
                                                                   placeholder="ราคา" min="0" step="0.25" required>
                                                            <span class="fa fa-money form-control-feedback right"
                                                                  aria-hidden="true"></span>
                                                        </div>
                                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                                            <label>ประเภทของเมนู</label>
                                                            <select name="menusetCatNo" id="add_menuset_stock_cat"
                                                                    class="form-control" required>
                                                                <option disabled selected>เลือกประเภทเมนู</option>
                                                                <c:forEach items="${menuCategories}" var="mc">
                                                                    <option value="${mc.menuCatNo}">${mc.menuCatNameTH}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                        <div class="col-md-12 col-sm-12 col-xs-12 form-group has-feedback">
                                                            <label>รายละเอียดของเมนู</label>
                                                            <textarea rows="4" cols="50" class="form-control" name="menuSetDesc"
                                                                      id="add_menuset_desc"
                                                                      placeholder="รายละเอียด" required></textarea>
                                                        </div>

                                                        <div id="addFromMenu" class="col-md-6 col-sm-6 col-xs-12 has-feedback">
                                                            <label>เพิ่มเมนูของเมนูอาหารแบบชุด</label>
                                                            <div class="block">
                                                                <input type="text" class="form-control" id="add_menu_in_menuset" autocomplete="on"><span class="remove">ลบ</span>
                                                            </div>
                                                            <div class="block">
                                                                <button id="insertMenu" type="button" class="btn btn-default">เพิ่ม</button>
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div class="modal-footer">
                                                        <!-- ปุ่มกดปิด (Close) ตรงส่วนล่างของ Modal -->
                                                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                                                            <input type="checkbox" name="menuSetAvailable" id="add_menuset_available" class="flat">&nbsp;พร้อมจำหน่าย&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                            <button type="submit" class="btn btn-success">ตกลง</button>
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
                    <div class="modal fade" id="editMenuSet" role="dialog">
                        <div class="modal-dialog modal-lg">
                            <!-- เนือหาของ Modal ทั้งหมด -->
                            <div class="modal-content">
                                <!-- ส่วนหัวของ Modal -->
                                <div class="modal-header">
                                    <!-- ปุ่มกดปิด (X) ตรงส่วนหัวของ Modal -->
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">แก้ไขชุดเมนูอาหาร</h4>
                                </div>
                                <!-- ส่วนเนื้อหาของ Modal -->
                                <div class="modal-body">
                                    <form class="form-horizontal form-label-left input_mask" modelAttribute="menuset"
                                          id="edit_menuset" enctype="multipart/form-data">
                                        <input type="hidden" name="menuSetNo" id="hiddenmenusetno">
                                        <div class="form-group">
                                            <img class="col-md-offset-3 col-sm-offset-3 col-md-6 col-sm-6 col-xs-12 img-resize" id="showpic_menuset_edit"  width="414" height="auto" src="../images/default_image_upload.png"/>

                                            <div class="col-md-offset-3 col-sm-offset-3 col-md-6 col-sm-6 col-xs-12 has-feedback" style="margin-bottom: 12px">
                                                <input type="file" class="form-control" name="menuSetPicPath"
                                                       id="edit_menuset_pic" onchange="document.getElementById('showpic_menuset_edit').src = window.URL.createObjectURL(this.files[0])"
                                                       placeholder="อัพโหลดรูปภาพ" required>
                                            </div>
                                            <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                                <label>ชื่อเมนูอาหารภาษาไทย</label>
                                                <input type="text" class="form-control" name="menuSetNameTH"
                                                       id="edit_menuset_nameTH"
                                                       placeholder="ชื่อเมนูอาหารภาษาไทย" required>
                                                <span class="fa fa-pencil form-control-feedback right"
                                                      aria-hidden="true"></span>
                                            </div>
                                            <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                                <label>ชื่อเมนูอาหารภาษาอังกฤษ</label>
                                                <input type="text" class="form-control" name="menuSetNameEN"
                                                       id="edit_menuset_nameEN"
                                                       placeholder="ชื่อเมนูอาหารภาษาอังกฤษ" required>
                                                <span class="fa fa-pencil form-control-feedback right"
                                                      aria-hidden="true"></span>
                                            </div>
                                            <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                                <label>ราคา (บาท)</label>
                                                <input type="number" class="form-control" name="menuSetPrice"
                                                       id="edit_menuset_price"
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
                                                <textarea rows="4" cols="50" class="form-control" name="menuSetDesc"
                                                          id="edit_menuset_desc"
                                                          placeholder="รายละเอียด" required></textarea>
                                            </div>

                                            <div id="editFromMenu" class="col-md-6 col-sm-6 col-xs-12 has-feedback">
                                                <label>เพิ่มเมนูของเมนูอาหารแบบชุด</label>
                                                <div class="block">
                                                    <input type="text" class="form-control" id="edit_menu_in_menuset" autocomplete="on"><span class="remove">ลบ</span>
                                                </div>
                                                <div class="block">
                                                    <button id="insertEditMenu" type="button" class="btn btn-default">เพิ่ม</button>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="modal-footer">
                                            <!-- ปุ่มกดปิด (Close) ตรงส่วนล่างของ Modal -->
                                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                                                <input type="checkbox" name="menuAvailable" id="edit_menu_available" class="flat">&nbsp;พร้อมจำหน่าย&nbsp;&nbsp;&nbsp;
                                                <button type="submit" class="btn btn-success">ตกลง</button>
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
<jsp:include page="../_include/bottomenv.jsp"/>
<script>

//    $('#insertMenu').click(function() {
//        $('.block:last').before('<div class="block"><input type="text" class="form-control" id="add_menu_in_menuset"><span class="remove">ลบ</span></div>');
//    });
//
//    $('#addFromMenu').on('click','.remove',function() {
//        $(this).parent().remove();
//    });

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

        refresh_table();
    });

    function refresh_table() {
        $.ajax({
            type: "POST",
            url: "${contextPath}/menu/getmenus",
            dataType: "json",
            success: function (json) {
                var data_array = [];
                var price = 0;
                for (var i = 0; i < json.length; i++) {
                    var obj = json[i];
                    var data = {
                        menuSetPicPath: obj.menuSetPicPath,
                        menuSetName: obj.menuSetNameTH + " / " + obj.menuSetNameEN,
                        menuDesc: obj.menuSetDesc,
                        menuPrice: obj.menuSetPrice.toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " บาท",
                        group: obj.menuCategory.menuCatNameTH + " / " + obj.menuCategory.menuCatNameEN,
                        option: '<a onclick = "set_menuset(' + obj.menuSetNo + ')" class = "btn btn-warning btn-sm" data-toggle = "modal" data-target = "#editMenuSet"> <i class = "fa fa-pencil"> </i> &nbsp; แก้ไข </a>' +
                        '<a onclick = "del_menuset(' + obj.menuSetNo + ',\'' + obj.menuSetNameTH + '\')" class = "btn btn-danger btn-sm"> <i class = "fa fa-trash"></i> &nbsp; ลบ </a>'
                    }
                    data_array.push(data);
                }
                $("#price").html(price.toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                $("#datatable-menu").DataTable().clear();
                $("#datatable-menu").DataTable().rows.add(data_array).draw(false);
            }
        });
    }

    $("#add_menuset").submit(function () {
        $.ajax({
            type: "POST",
            data: new FormData($("#add_menuset")[0]),
            enctype: 'multipart/form-data',
            cache: false,
            contentType: false,
            processData: false,
            url: "${contextPath}/menu/managemenu",
            success: function (result) {
                swal("สำเร็จ", "เมนู " + $("#add_menuset").val() + " ถูกเพิ่มเรียบร้อยแล้ว", "success");
                $("#add_menuset")[0].reset();
                $("#addMenuSet").modal('toggle');
                refresh_table();
            }, error: function (result) {
                swal("ไม่สำเร็จ", "ชื่อภาษาไทยหรืออังกฤษอาจซ้ำ กรุณาลองใหม่ในภายหลัง", "error");
            }
        });

        $('#insertMenu').click(function() {
            $('.block:last').before('<div class="block"><input type="text" class="form-control" id="add_menu_in_menuset"><span class="remove">ลบ</span></div>');
        });

        $('#addFromMenu').on('click','.remove',function() {
            $(this).parent().remove();
        });

        return false;
    });


    $("#edit_menuset").submit(function () {
        var object = $("#edit_menuset").serialize();
        $.ajax({
            type: "POST",
            data: object,
            contentType: false,
            processData: false,
            url: "${contextPath}/menu/managemenu",
            success: function (result) {
                swal("สำเร็จ", "เมนู " + $("#add_menuset").val() + " ถูกแก้ไขเรียบร้อยแล้ว", "success");
                $("#edit_menuset")[0].reset();
                $("#editMenuSet").modal('toggle');
                refresh_table();
            }, error: function (result) {
                swal("ไม่สำเร็จ", "ชื่อภาษาไทยหรืออังกฤษอาจซ้ำ กรุณาลองใหม่ในภายหลัง", "error");
            }
        });
//
//        $('#insertEditMenu').click(function() {
//            $('.block:last').before('<div class="block"><input type="text" class="form-control" id="edit_menu_in_menuset"><span class="remove">ลบ</span></div>');
//        });
//
//        $('#editFromMenu').on('click','.remove',function() {
//            $(this).parent().remove();
//        });

        return false;
    });

    function set_menuset(menuSetNo) {
        $.ajax({
            type: "PUT",
            url: "${contextPath}/menu/getmenu/" + menuNo,
            dataType: "json",
            success: function (result) {
                $("#hiddenmenuno").val(result.menuSetNo);
                $("#edit_menuset_nameTH").val(result.menuSetNameTH);
                $("#edit_menuset_nameEN").val(result.menuSetNameEN);
                $("#edit_menuset_desc").val(result.menuSetDesc);
                $("#edit_menuset_price").val(result.menuSetPrice.toFixed(2));
                $("#edit_menuset_available").val(result.menuSetAvailable);
                $("#edit_menu_stock_cat").val(result.menuCatNo);
                $("#edit_menu_available").attr('checked',result.available);
//                $("#edit_menu_pic").val(result.menuPicPath);
            }
        });

    }

    function del_menuset(menuSetNo, menuSetNameTH) {
        swal({
                title: "ยืนยันการลบ " + menuSetNameTH,
                text: "เมื่อยืนยัน คุณจะไม่สามารถนำข้อมูล " + menuSetNameTH + " กลับมาได้",
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
                    url: "${contextPath}/menu/delmenu/" + menuSetNo,
                    success: function (json) {
                        swal("สำเร็จ", menuSetNameTH + " ถูกลบเรียบร้อยแล้ว", "success");
                        refresh_table();
                    },
                    error: function (json) {
                        swal("ไม่สำเร็จ", "เซิร์ฟเวอร์อาจมีปัญหา", "error");
                    }
                });
            });
    }

</script>
</body>
</html>