<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../_include/topenv.jsp"/>
    <title>ประเภทอาหาร</title>
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
                            <h4>ประเภทอาหาร</h4>
                        </div>
                        <div class="x_content">
                            <form action="#">
                                <p>
                                    <a data-toggle="modal" data-target="#addMenuCat"
                                       class="btn btn-success btn-sm"><i class="fa fa-plus-circle"></i>&nbsp;
                                        เพิ่มประเภท</a>
                                </p>
                                <table id="datatable-menucategory"
                                       class="table table-striped table-bordered">
                                    <thead>
                                    <tr>
                                        <th style="width:20%;text-align:center;">ชื่อประเภทอาหาร</th>
                                        <th style="width:20%;text-align:center;">ตัวเลือก</th>
                                    </tr>
                                    </thead>
                                    <tbody style="text-align:center;">

                                    </tbody>
                                </table>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- /page content -->
                <!-- Modal Content (Add Menu Category)-->
                <div class="modal fade" id="addMenuCat" role="dialog">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">เพิ่มประเภทอาหาร</h4>
                            </div>
                            <div class="modal-body">
                                <form class="form-horizontal form-label-left input_mask" modelAttribute="menuCategory" id="menu_category">
                                    <div class="form-group">
                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                            <label>ชื่อประเภทอาหาร</label>
                                            <input type="text" class="form-control" name="menuCatName" id="menu_cat_name"
                                                   placeholder="ชื่อประเภทอาหาร" required>
                                            <span class="fa fa-pencil form-control-feedback right"
                                                  aria-hidden="true"></span>
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
                <!-- /Modal Content (Add Menu Category)-->

                <!-- Modal Content (Edit Menu Category)-->
                <div class="modal fade" id="editMenuCat" role="dialog">
                    <div class="modal-dialog">
                        <!-- เนือหาของ Modal ทั้งหมด -->
                        <div class="modal-content">
                            <!-- ส่วนหัวของ Modal -->
                            <div class="modal-header">
                                <!-- ปุ่มกดปิด (X) ตรงส่วนหัวของ Modal -->
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">แก้ไขประเภทอาหาร</h4>
                            </div>
                            <!-- ส่วนเนื้อหาของ Modal -->
                            <div class="modal-body">
                                <form class="form-horizontal form-label-left input_mask" modelAttribute="menuCategory" id="menu_category_edit">
                                    <input type="hidden" name="menuCatNo" id="hiddenmenucatno">
                                    <div class="form-group">
                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                            <label>ชื่อประเภทอาหาร</label>
                                            <input type="text" class="form-control" id="edit_menu_cat_name"
                                                   name="menuCatName"
                                                   placeholder="ชื่อประเภทอาหาร" required>
                                            <span class="fa fa-pencil form-control-feedback right"
                                                  aria-hidden="true"></span>
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
                <!-- /Modal Content (Edit Menu Category)-->
            </div>
        </div>
    </div>
</div>
<jsp:include page="../_include/bottomenv.jsp"/>
<script>
    $(document).ready(function () {
        $("#datatable-menucategory").DataTable({
            order: [[0, "asc"]],
            columnDefs: [
                {orderable: false, targets: [-1]}
            ],
            columns: [
                {
                    data: 'menuCatName'
                },
                {
                    data: 'option'
                }
            ]
        });

        refresh_table();
    });

    $("#menu_category").submit(function(){
        var object = $("#menu_category").serialize();
        $.ajax({
            type: "POST",
            data: object,
            url: "${contextPath}/menu/managemenucategory",
            success: function (result) {
                swal("สำเร็จ", "ประเภท " + $("#menu_cat_name").val() + " ถูกเพิ่มเรียบร้อยแล้ว", "success");
                reset_field();
                $("#addMenuCat").modal('toggle');
                refresh_table();
            },error: function(result){
                swal("ไม่สำเร็จ", "ชื่อประเภทอาจซ้ำหรือเซิร์ฟเวอร์มีปัญหา", "error");
            }
        });
        return false;
    });

    $('.modal').on('hidden.bs.modal', function(){
        reset_field();
    });

    function reset_field(){
        $("#menu_category")[0].reset();
    }


    function setMenuCat(menuCatNo) {
        $.ajax({
            type: "PUT",
            url: "${contextPath}/menu/getmenucategory/" + menuCatNo,
            dataType: "json",
            success: function (result) {
                $("#hiddenmenucatno").val(result.menuCatNo);
                $("#edit_menu_cat_name").val(result.menuCatName);
            }
        });
    }

    $("#menu_category_edit").submit(function(){
        var object = $("#menu_category_edit").serialize();
        $.ajax({
            type: "POST",
            data: object,
            url: "${contextPath}/menu/managemenucategory",
            success: function (result) {
                swal("สำเร็จ", "แก้ไขเรียบร้อยแล้ว", "success");
                $("#menu_category_edit")[0].reset();
                $("#editMenuCat").modal('toggle');
                refresh_table();
            },error: function(result){
                swal("ไม่สำเร็จ", "ชื่อประเภทอาหารอาจซ้ำหรือเซิร์ฟเวอร์มีปัญหา", "error");
            }
        });
        return false;
    });

    function delMenuCat(menuCatNo,menuCatName){
        swal({
                title: "ยืนยันการลบ " + menuCatName,
                text: "เมื่อยืนยัน จะไม่สามารถนำข้อมูล " + menuCatName + " กลับมาได้",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "ใช่, ต้องการลบ",
                cancelButtonText: "ยกเลิก",
                closeOnConfirm: false
            },
            function () {
                $.ajax({
                    type: "DELETE",
                    url: "${contextPath}/menu/deletemenucategory/" + menuCatNo,
                    success: function (result) {
                        swal("สำเร็จ", menuCatName + " ถูกลบเรียบร้อยแล้ว", "success");
                        refresh_table();
                    }, error: function (result) {
                        swal("ไม่สำเร็จ", "ลบไม่ได้เนื่องจาก มีหมวดหมู่อาหารที่อยู่ในประเภทนี้อยู่", "error");
                    }
                });
            });
    }

    function refresh_table() {
        $.ajax({
            type: "POST",
            url: "${contextPath}/menu/getmenucategories",
            dataType: "json",
            success: function (json) {
                var data_array = [];
                for (var iterator = 0; iterator < json.length; iterator++) {
                    var menu_cat_obj = json[iterator];
                    var data_refresh = {
                        menuCatName: '<a onclick = "setMenuCat(' + menu_cat_obj.menuCatNo + ')" data-toggle = "modal" data-target = "#editMenuCat" style = "font-weight: bold;cursor:pointer;" >' + menu_cat_obj.menuCatName + '</a>',
                        option: '<a onclick = "setMenuCat(' + menu_cat_obj.menuCatNo + ')" class = "btn btn-warning btn-sm" data-toggle = "modal" data-target = "#editMenuCat"> <i class = "fa fa-pencil"> </i> &nbsp; แก้ไข </a>' +
                        '<a onclick = "delMenuCat(' + menu_cat_obj.menuCatNo + ',\'' + menu_cat_obj.menuCatName +'\')") class = "btn btn-danger btn-sm"> <i class = "fa fa-trash"></i> &nbsp; ลบ </a>'
                    };
                    data_array.push(data_refresh);
                }
                $("#datatable-menucategory").DataTable().clear();
                $("#datatable-menucategory").DataTable().rows.add(data_array).draw(false);
            }
        });
    }
</script>
</body>
</html>