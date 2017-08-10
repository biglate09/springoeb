<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../_include/topenv.jsp"/>
    <title>ประเภทเมนูอาหาร</title>
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
                            <h4>ประเภทเมนูอาหาร</h4>
                        </div>
                        <div class="x_content">
                            <form action="#">
                                <p>
                                    <a data-toggle="modal" data-target="#addMenuCat"
                                       class="btn btn-success btn-sm"><i class="fa fa-plus-circle"></i>&nbsp;
                                        เพิ่มประเภท</a>
                                </p>
                                <table id="datatable-menucat"
                                       class="table table-striped table-bordered bulk_action1">
                                    <thead>
                                    <tr>
                                        <th style="width:20%;text-align:center;">ชื่อประเภทอาหาร</th>
                                        <th style="width:20%;text-align:center;">หมวดหมู่</th>
                                        <th style="width:20%;text-align:center;">ตัวเลือก</th>
                                    </tr>
                                    </thead>
                                    <tbody style="text-align:center;">
                                    </tbody>
                                </table>
                            </form>
                        </div>
                        <div class="modal fade" id="addMenuCat" role="dialog">
                            <div class="modal-dialog">
                                <!-- เนือหาของ Modal ทั้งหมด -->
                                <div class="modal-content">
                                    <!-- ส่วนหัวของ Modal -->
                                    <div class="modal-header">
                                        <!-- ปุ่มกดปิด (X) ตรงส่วนหัวของ Modal -->
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">เพิ่มประเภทเมนูอาหารใหม่</h4>
                                    </div>
                                    <!-- ส่วนเนื้อหาของ Modal -->
                                    <div class="modal-body">
                                        <form class="form-horizontal form-label-left input_mask" modelAttribute="menucategory" id="add_menu_category">
                                            <div class="form-group">
                                                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                                    <input type="text" class="form-control" name="menuCatNameTH" id="add_menu_cat_nameTH"
                                                           placeholder="ชื่อประเภทอาหารภาษาไทย" required>
                                                    <span class="fa fa-pencil form-control-feedback right"
                                                          aria-hidden="true"></span>
                                                </div>
                                                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                                    <input type="text" class="form-control" name="menuCatNameEN" id="add_menu_cat_nameEN"
                                                           placeholder="ชื่อประเภทอาหารภาษาอังกฤษ" required>
                                                    <span class="fa fa-pencil form-control-feedback right"
                                                          aria-hidden="true"></span>
                                                </div>
                                                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                                    <select name="stockCatNo" class="form-control" required>
                                                        <option value="">---เลือกหมวดหมู่---</option>
                                                        <c:forEach items="${stockCategories}" var="sc">
                                                            <option value="${sc.stockCatNo}">${sc.stockCatName}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <!-- ปุ่มกดปิด (Close) ตรงส่วนล่างของ Modal -->
                                                <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
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
                        <div class="modal fade" id="editMenuCat" role="dialog">
                            <div class="modal-dialog">
                                <!-- เนือหาของ Modal ทั้งหมด -->
                                <div class="modal-content">
                                    <!-- ส่วนหัวของ Modal -->
                                    <div class="modal-header">
                                        <!-- ปุ่มกดปิด (X) ตรงส่วนหัวของ Modal -->
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">แก้ไขประเภทเมนูอาหาร</h4>
                                    </div>
                                    <!-- ส่วนเนื้อหาของ Modal -->
                                    <div class="modal-body">
                                        <form class="form-horizontal form-label-left input_mask" modelAttribute="menucategory" id="edit_menu_category">
                                            <input type="hidden" name="menuCatNo" id="hiddenmenucatno">
                                            <div class="form-group">
                                                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                                    <input type="text" class="form-control" name="menuCatNameTH" id="edit_menu_cat_nameTH"
                                                           placeholder="ชื่อประเภทอาหารภาษาไทย" required>
                                                    <span class="fa fa-pencil form-control-feedback right"
                                                          aria-hidden="true"></span>
                                                </div>
                                                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                                    <input type="text" class="form-control" name="menuCatNameEN" id="edit_menu_cat_nameEN"
                                                           placeholder="ชื่อประเภทอาหารภาษาอังกฤษ" required>
                                                    <span class="fa fa-pencil form-control-feedback right"
                                                          aria-hidden="true"></span>
                                                </div>
                                                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                                    <select name="stockCatNo" id="edit_stock_cat_no" class="form-control" required>
                                                        <option value="" disabled>เลือกหมวดหมู่</option>
                                                        <c:forEach items="${stockCategories}" var="sc">
                                                            <option value="${sc.stockCatNo}">${sc.stockCatName}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <!-- ปุ่มกดปิด (Close) ตรงส่วนล่างของ Modal -->
                                                <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
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
</div>

<jsp:include page="../_include/bottomenv.jsp"/>
<script>
    $(document).ready(function () {
        $("#datatable-menucat").DataTable({
            order: [[0,"asc"]],
            columnDefs: [
                {orderable: false, targets: [-1]}
            ],
            columns: [
                {
                    data: 'menuCatName'
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
            url: "${contextPath}/menu/getmenucategories",
            dataType: "json",
            success: function (json) {
                var data_array = [];
                for (var i=0; i<json.length; i++){
                    var obj = json[i];
                    var data = {
                        menuCatName: obj.menuCatNameTH +" / "+ obj.menuCatNameEN,
                        group: obj.stockCategory.stockCatName,
                        option: '<a onclick = "set_menu_category(' + obj.menuCatNo + ')" class = "btn btn-warning btn-sm" data-toggle = "modal" data-target = "#editMenuCat"> <i class = "fa fa-pencil"> </i> &nbsp; แก้ไข </a>' +
                        '<a onclick = "del_menu_category(' + obj.menuCatNo+ ',\'' + obj.menuCatNameTH +'\')" class = "btn btn-danger btn-sm"> <i class = "fa fa-trash"></i> &nbsp; ลบ </a>'
                    }
                    data_array.push(data);
                }
                $("#datatable-menucat").DataTable().clear();
                $("#datatable-menucat").DataTable().rows.add(data_array).draw(false);
            }
        });
    }

    $("#add_menu_category").submit(function(){
        var object = $("#add_menu_category").serialize();
        $.ajax({
            type: "POST",
            data: object,
            url: "${contextPath}/menu/managemenucategory",
            success: function (result) {
                swal("สำเร็จ", "ชื่อประเภท " + $("#add_menu_category").val() + " ถูกเพิ่มเรียบร้อยแล้ว", "success");
                $("#add_menu_category")[0].reset();
                $("#addMenuCat").modal('toggle');
                refresh_table();
            },error: function(result){
                swal("ไม่สำเร็จ", "ชื่ออาจซ้ำ กรุณาลองใหม่ในภายหลัง", "error");
            }
        });
        return false;
    });

    $("#edit_menu_category").submit(function(){
        var object = $("#edit_menu_category").serialize();
        $.ajax({
            type: "POST",
            data: object,
            url: "${contextPath}/menu/managemenucategory",
            success: function (result) {
                swal("สำเร็จ", "ชื่อประเภท " + $("#add_menu_category").val() + " ถูกแก้ไขเรียบร้อยแล้ว", "success");
                $("#edit_menu_category")[0].reset();
                $("#editMenuCat").modal('toggle');
                refresh_table();
            },error: function(result){
                swal("ไม่สำเร็จ", "ชื่ออาจซ้ำ กรุณาลองใหม่ในภายหลัง", "error");
            }
        });
        return false;
    });

    function set_menu_category(menuCatNo) {
        $.ajax({
            type: "PUT",
            url: "${contextPath}/menu/getmenucategory/" + menuCatNo,
            dataType: "json",
            success: function (result) {
                $("#hiddenmenucatno").val(result.menuCatNo);
                $("#edit_menu_cat_nameTH").val(result.menuCatNameTH);
                $("#edit_menu_cat_nameEN").val(result.menuCatNameEN);
                $("#edit_stock_cat_no").val(result.stockCatNo);
            }
        });
    }

    function del_menu_category(menuCatNo,menuCatNameTH) {
        swal ({
                title: "ยืนยันการลบ " + menuCatNameTH,
                text: "เมื่อยืนยัน คุณจะไม่สามารถนำข้อมูล "+menuCatNameTH+" กลับมาได้",
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
                    url: "${contextPath}/menu/delmenucategory/"+menuCatNo,
                    success: function (json) {
                        swal ("สำเร็จ", menuCatNameTH+" ถูกลบเรียบร้อยแล้ว", "success");
                        refresh_table();
                    },
                    error: function (json) {
                        swal ("ไม่สำเร็จ", "ยังมีเมนูที่เป็นอาหารประเภทนี้อยู่ กรุณาลบออกให้หมดก่อน หรือเซิร์ฟเวอร์อาจมีปัญหา", "error");
                    }
                });
            });
    }
</script>
</body>
</html>