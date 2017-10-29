<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../_include/topenv.jsp"/>
    <title>หน่วยของวัตถุดิบ</title>

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
                            <h4>หน่วยของวัตถุดิบ</h4>
                        </div>
                        <div class="x_content">
                            <form action="#">
                                <p>
                                    <a data-toggle="modal" data-target="#addMaterialUnit"
                                       class="btn btn-success btn-sm"><i class="fa fa-plus-circle"></i>&nbsp;
                                        เพิ่มหน่วย</a>
                                </p>
                                <table id="datatable-materialunit"
                                       class="table table-striped table-bordered">
                                    <thead>
                                    <tr>
                                        <th style="width:20%;text-align:center;">ชื่อหน่วยของวัตถุดิบ</th>
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
                <!-- Modal Content (Add Material Unit)-->
                <div class="modal fade" id="addMaterialUnit" role="dialog">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">เพิ่มหน่วยของวัตถุดิบใหม่</h4>
                            </div>
                            <div class="modal-body">
                                <form class="form-horizontal form-label-left input_mask" modelAttribute="materialUnit" id="material_unit">
                                    <div class="form-group">
                                        <div class="col-md-12 col-sm-12 col-xs-12 form-group has-feedback">
                                            <label class="required">ชื่อหน่วยของวัตถุดิบ</label>
                                            <input type="text" class="form-control" name="unitName" id="mat_unit_name"
                                                   placeholder="ชื่อหน่วยของวัตถุดิบ" required>
                                            <span class="fa fa-pencil form-control-feedback right"
                                                  aria-hidden="true"></span>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <!-- ปุ่มกดปิด (Close) ตรงส่วนล่างของ Modal -->
                                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                                            <button type="submit" class="btn btn-success" id="loadingbtn">ตกลง</button>
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
                <!-- /Modal Content (Add Material Unit)-->

                <!-- Modal Content (Edit Material Unit)-->
                <div class="modal fade" id="editMaterialUnit" role="dialog">
                    <div class="modal-dialog">
                        <!-- เนือหาของ Modal ทั้งหมด -->
                        <div class="modal-content">
                            <!-- ส่วนหัวของ Modal -->
                            <div class="modal-header">
                                <!-- ปุ่มกดปิด (X) ตรงส่วนหัวของ Modal -->
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">แก้ไขหน่วยของวัตถุดิบ <span id="matunitedit"></span></h4>
                            </div>
                            <!-- ส่วนเนื้อหาของ Modal -->
                            <div class="modal-body">
                                <form class="form-horizontal form-label-left input_mask" modelAttribute="materialUnit" id="material_unit_edit">
                                    <input type="hidden" name="unitNo" id="hiddenunitno">
                                    <div class="form-group">
                                        <div class="col-md-12 col-sm-12 col-xs-12 form-group has-feedback">
                                            <label class="required">ชื่อหน่วยของวัตถุดิบ</label>
                                            <input type="text" class="form-control" id="edit_mat_unit_name"
                                                   name="unitName"
                                                   placeholder="ชื่อหน่วยของวัตถุดิบ" required>
                                            <span class="fa fa-pencil form-control-feedback right"
                                                  aria-hidden="true"></span>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <!-- ปุ่มกดปิด (Close) ตรงส่วนล่างของ Modal -->
                                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                                            <button type="submit" class="btn btn-success" id="loadingbtnedit">ตกลง</button>
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
                <!-- /Modal Content (Edit Material Unit)-->
            </div>
        </div>
    </div>
</div>
<jsp:include page="../_include/bottomenv.jsp"/>
<script>
    $(document).ready(function () {
        $("#datatable-materialunit").DataTable({
            order: [[0, "asc"]],
            columnDefs: [
                {orderable: false, targets: [-1]}
            ],
            columns: [
                {
                    data: 'unitName'
                },
                {
                    data: 'option'
                }
            ]
        });

        refresh_table();
    });

    $("#material_unit").submit(function(){
        var object = $("#material_unit").serialize();
        $('#loadingbtn').show();
        $.ajax({
            type: "POST",
            data: object,
            url: "${contextPath}/stock/managematerialunit",
            success: function (result) {
                $('#loadingbtn').hide();
                swal("สำเร็จ", "ประเภท " + $("#mat_unit_name").val() + " ถูกเพิ่มเรียบร้อยแล้ว", "success");
                reset_field();
                $("#addMaterialUnit").modal('toggle');
                refresh_table();
            },error: function(result){
                $('#loadingbtn').hide();
                swal("ไม่สำเร็จ", "ชื่อประเภทอาจซ้ำหรือเซิร์ฟเวอร์มีปัญหา", "error");
            }
        });
        return false;
    });

    $('.modal').on('hidden.bs.modal', function(){
        reset_field();
    });

    function reset_field(){
        $("#material_unit")[0].reset();
    }

    function setMaterialUnit(unitNo) {
        $.ajax({
            type: "PUT",
            url: "${contextPath}/stock/getmaterialunit/" + unitNo,
            dataType: "json",
            success: function (result) {
                $("#hiddenunitno").val(result.unitNo);
                $("#edit_mat_unit_name").val(result.unitName);
                $("#matunitedit").html(result.unitName);
            }
        });
    }

    $("#material_unit_edit").submit(function(){
        var object = $("#material_unit_edit").serialize();
        $('#loadingbtnedit').show();
        $.ajax({
            type: "POST",
            data: object,
            url: "${contextPath}/stock/managematerialunit",
            success: function (result) {
                $('#loadingbtnedit').hide();
                swal("สำเร็จ", "แก้ไขเรียบร้อยแล้ว", "success");
                $("#material_unit_edit")[0].reset();
                $("#editMaterialUnit").modal('toggle');
                refresh_table();
            },error: function(result){
                $('#loadingbtnedit').hide();
                swal("ไม่สำเร็จ", "ชื่อหน่วยวัตถุดิบอาจซ้ำหรือเซิร์ฟเวอร์มีปัญหา", "error");
            }
        });
        return false;
    });

    function delMaterialUnit(unitNo,unitName){
        swal({
                title: "ยืนยันการลบ " + unitName,
                text: "เมื่อยืนยัน จะไม่สามารถนำข้อมูล " + unitName + " กลับมาได้",
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
                    url: "${contextPath}/stock/deletematerialunit/" + unitNo,
                    success: function (result) {
                        swal("สำเร็จ", unitName + " ถูกลบเรียบร้อยแล้ว", "success");
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
            url: "${contextPath}/stock/getmaterialunits",
            dataType: "json",
            success: function (json) {
                var data_array = [];
                for (var iterator = 0; iterator < json.length; iterator++) {
                    var mat_unit_obj = json[iterator];
                    var data_refresh = {
                        unitName: '<a onclick = "setMaterialUnit(' + mat_unit_obj.unitNo + ')" data-toggle = "modal" data-target = "#editMaterialUnit" style = "font-weight: bold;cursor:pointer;" >' + mat_unit_obj.unitName + '</a>',
                        option: '<a onclick = "setMaterialUnit(' + mat_unit_obj.unitNo + ')" class = "btn btn-warning btn-sm" data-toggle = "modal" data-target = "#editMaterialUnit"> <i class = "fa fa-pencil"> </i> &nbsp; แก้ไข </a>' +
                        '<a onclick = "delMaterialUnit(' + mat_unit_obj.unitNo + ',\'' + mat_unit_obj.unitName +'\')") class = "btn btn-danger btn-sm"> <i class = "fa fa-trash"></i> &nbsp; ลบ </a>'
                    };
                    data_array.push(data_refresh);
                }

                $("#datatable-materialunit").DataTable().clear();
                $("#datatable-materialunit").DataTable().rows.add(data_array).draw(false);
            }
        });
    }
</script>
</body>
</html>