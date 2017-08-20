<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../_include/topenv.jsp"/>
    <title>ประเภทวัตถุดิบ</title>
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
                            <h4>ประเภทวัตถุดิบ</h4>
                        </div>
                        <div class="x_content">
                            <form action="#">
                                <p>
                                    <a data-toggle="modal" data-target="#addMaterialCat"
                                       class="btn btn-success btn-sm"><i class="fa fa-plus-circle"></i>&nbsp;
                                        เพิ่มประเภท</a>
                                </p>
                                <table id="datatable-materialcategory"
                                       class="table table-striped table-bordered">
                                    <thead>
                                    <tr>
                                        <th style="width:20%;text-align:center;">ชื่อประเภทวัตถุดิบ</th>
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
                <!-- Modal Content (Add Material Category)-->
                <div class="modal fade" id="addMaterialCat" role="dialog">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">เพิ่มประเภทวัตถุดิบ</h4>
                            </div>
                            <div class="modal-body">
                                <form class="form-horizontal form-label-left input_mask" modelAttribute="materialCategory" id="material_category">
                                    <div class="form-group">
                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                            <label>ชื่อประเภทวัตถุดิบ</label>
                                            <input type="text" class="form-control" name="matCatName" id="mat_cat_name"
                                                   placeholder="ชื่อประเภทวัตถุดิบ" required>
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
                <!-- /Modal Content (Add Material Category)-->

                <!-- Modal Content (Edit Material Category)-->
                <div class="modal fade" id="editMaterialCat" role="dialog">
                    <div class="modal-dialog">
                        <!-- เนือหาของ Modal ทั้งหมด -->
                        <div class="modal-content">
                            <!-- ส่วนหัวของ Modal -->
                            <div class="modal-header">
                                <!-- ปุ่มกดปิด (X) ตรงส่วนหัวของ Modal -->
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">แก้ไขประเภทวัตถุดิบ</h4>
                            </div>
                            <!-- ส่วนเนื้อหาของ Modal -->
                            <div class="modal-body">
                                <form class="form-horizontal form-label-left input_mask" modelAttribute="materialCategory" id="material_category_edit">
                                    <input type="hidden" name="matCatNo" id="hiddenmatcatno">
                                    <div class="form-group">
                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                            <label>ชื่อประเภทวัตถุดิบ</label>
                                            <input type="text" class="form-control" id="edit_mat_cat_name"
                                                   name="matCatName"
                                                   placeholder="ชื่อประเภทวัตถุดิบ" required>
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
                <!-- /Modal Content (Edit Material Category)-->
            </div>
        </div>
    </div>
</div>
<jsp:include page="../_include/bottomenv.jsp"/>
<script>
    $(document).ready(function () {
        $("#datatable-materialcategory").DataTable({
            order: [[0, "asc"]],
            columnDefs: [
                {orderable: false, targets: [-1]}
            ],
            columns: [
                {
                    data: 'matCatName'
                },
                {
                    data: 'option'
                }
            ]
        });

        refresh_table();
    });

    $("#material_category").submit(function(){
        var object = $("#material_category").serialize();
        $.ajax({
            type: "POST",
            data: object,
            url: "${contextPath}/stock/managematerialcategory",
            success: function (result) {
                swal("สำเร็จ", "ประเภท " + $("#mat_cat_name").val() + " ถูกเพิ่มเรียบร้อยแล้ว", "success");
                $("#material_category")[0].reset();
                $("#addMaterialCat").modal('toggle');
                refresh_table();
            },error: function(result){
                swal("ไม่สำเร็จ", "ชื่อประเภทอาจซ้ำหรือเซิร์ฟเวอร์มีปัญหา", "error");
            }
        });
        return false;
    });

    function setMaterialCat(matCatNo) {
        $.ajax({
            type: "PUT",
            url: "${contextPath}/stock/getmaterialcategory/" + matCatNo,
            dataType: "json",
            success: function (result) {
                $("#hiddenmatcatno").val(result.matCatNo);
                $("#edit_mat_cat_name").val(result.matCatName);
            }
        });
    }

    $("#material_category_edit").submit(function(){
        var object = $("#material_category_edit").serialize();
        $.ajax({
            type: "POST",
            data: object,
            url: "${contextPath}/stock/managematerialcategory",
            success: function (result) {
                swal("สำเร็จ", "แก้ไขเรียบร้อยแล้ว", "success");
                $("#material_category_edit")[0].reset();
                $("#editMaterialCat").modal('toggle');
                refresh_table();
            },error: function(result){
                swal("ไม่สำเร็จ", "ชื่อประเภทวัตถุดิบอาจซ้ำหรือเซิร์ฟเวอร์มีปัญหา", "error");
            }
        });
        return false;
    });

    function delMaterialCat(matCatNo,matCatName){
        swal({
                title: "ยืนยันการลบ " + matCatName,
                text: "ข้อมูลเกี่ยวกับ " + matCatName + " จะหายไปทั้งหมดเลย !",
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
                    url: "${contextPath}/stock/deletematerialcategory/" + matCatNo,
                    success: function (result) {
                        swal("สำเร็จ", matCatName + " ถูกลบเรียบร้อยแล้ว", "success");
                        refresh_table();
                    }, error: function (result) {
                        swal("ไม่สำเร็จ", "ลบไม่ได้เนื่องจาก มีวัตถุดิบที่เป็นประเภทนี้อยู่", "error");
                    }
                });
            });
    }

    function refresh_table() {
        $.ajax({
            type: "POST",
            url: "${contextPath}/stock/getmaterialcategories",
            dataType: "json",
            success: function (json) {
                var data_array = [];
                for (var iterator = 0; iterator < json.length; iterator++) {
                    var mat_cat_obj = json[iterator];
                    var data_refresh = {
                        matCatName: '<a onclick = "setMaterialCat(' + mat_cat_obj.matCatNo + ')" data-toggle = "modal" data-target = "#editMaterialCat" style = "font-weight: bold;cursor:pointer;" >' + mat_cat_obj.matCatName + '</a>',
                        option: '<a onclick = "setMaterialCat(' + mat_cat_obj.matCatNo + ')" class = "btn btn-warning btn-sm" data-toggle = "modal" data-target = "#editMaterialCat"> <i class = "fa fa-pencil"> </i> &nbsp; แก้ไข </a>' +
                        '<a onclick = "delMaterialCat(' + mat_cat_obj.matCatNo + ',\'' + mat_cat_obj.matCatName +'\')") class = "btn btn-danger btn-sm"> <i class = "fa fa-trash"></i> &nbsp; ลบ </a>'
                    };
                    data_array.push(data_refresh);
                }

                $("#datatable-materialcategory").DataTable().clear();
                $("#datatable-materialcategory").DataTable().rows.add(data_array).draw(false);
            }
        });
    }
</script>
</body>
</html>