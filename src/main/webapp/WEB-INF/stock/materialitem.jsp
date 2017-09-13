<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../_include/topenv.jsp"/>
    <title>วัตถุดิบ</title>
    <style>
        .required:after {
            content:" *";
            color:red;
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
                            <h4>วัตถุดิบ</h4>
                        </div>
                        <div class="x_content">
                            <form action="#">
                                <p>
                                    <a data-toggle="modal" data-target="#addMatItem"
                                       class="btn btn-success btn-sm"><i class="fa fa-plus-circle"></i>&nbsp;
                                        เพิ่มวัตถุดิบ</a>
                                </p>
                                <table id="datatable-matitem"
                                       class="table table-striped table-bordered bulk_action1">
                                    <thead>
                                    <tr>
                                        <th style="width:20%;text-align:center;">ชื่อของวัตถุดิบ</th>
                                        <th style="width:20%;text-align:center;">ประเภท</th>
                                        <th style="width:20%;text-align:center;">หน่วยที่ใช้</th>
                                        <th style="width:20%;text-align:center;">ตัวเลือก</th>
                                    </tr>
                                    </thead>
                                    <tbody style="text-align:center;">
                                    </tbody>
                                </table>
                            </form>
                        </div>
                        <div class="modal fade" id="addMatItem" role="dialog">
                            <div class="modal-dialog modal-lg">
                                <!-- เนือหาของ Modal ทั้งหมด -->
                                <div class="modal-content">
                                    <!-- ส่วนหัวของ Modal -->
                                    <div class="modal-header">
                                        <!-- ปุ่มกดปิด (X) ตรงส่วนหัวของ Modal -->
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">เพิ่มวัตถุดิบใหม่</h4>
                                    </div>
                                    <!-- ส่วนเนื้อหาของ Modal -->
                                    <div class="modal-body">
                                        <form class="form-horizontal form-label-left input_mask" modelAttribute="matitem" id="add_mat_item">
                                            <input type="hidden" name="matFlag" value="I">
                                            <div class="form-group">
                                                <div class="col-md-4 col-sm-4 col-xs-12 form-group has-feedback">
                                                    <label class="required">ชื่อวัตถุดิบ</label>
                                                    <input type="text" class="form-control" name="matItemName" id="add_mat_item_name"
                                                           placeholder="ชื่อวัตถุดิบ" required>
                                                    <span class="fa fa-pencil form-control-feedback right"
                                                          aria-hidden="true"></span>
                                                </div>
                                                <div class="col-md-4 col-sm-4 col-xs-12 form-group has-feedback">
                                                    <label class="required">ประเภทวัตถุดิบ</label>
                                                    <select name="matCatNo" id="add_mat_cat" class="form-control" required>
                                                        <option value="" disabled selected>เลือกประเภทวัตถุดิบ</option>
                                                        <c:forEach items="${matCategories}" var="mc">
                                                            <option value="${mc.matCatNo}">${mc.matCatName}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <div class="col-md-4 col-sm-4 col-xs-12 form-group has-feedback">
                                                    <label class="required">หน่วยวัตถุดิบ</label>
                                                    <select name="unitNo" id="add_unit_no" class="form-control" required>
                                                        <option value="" disabled selected>เลือกหน่วย</option>
                                                        <c:forEach items="${units}" var="u">
                                                            <option value="${u.unitNo}">${u.unitName}</option>
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
                        <div class="modal fade" id="editMatItem" role="dialog">
                            <div class="modal-dialog modal-lg">
                                <!-- เนือหาของ Modal ทั้งหมด -->
                                <div class="modal-content">
                                    <!-- ส่วนหัวของ Modal -->
                                    <div class="modal-header">
                                        <!-- ปุ่มกดปิด (X) ตรงส่วนหัวของ Modal -->
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">แก้ไขวัตถุดิบ <span id="show_mat_item_name_for_edit"></span></h4>
                                    </div>
                                    <!-- ส่วนเนื้อหาของ Modal -->
                                    <div class="modal-body">
                                        <form class="form-horizontal form-label-left input_mask" modelAttribute="matitem" id="edit_mat_item">
                                            <input type="hidden" name="matFlag" value="I">
                                            <input type="hidden" name="matItemNo" id="hiddenmatitemno">
                                            <div class="form-group">
                                                <div class="col-md-4 col-sm-4 col-xs-12 form-group has-feedback">
                                                    <label class="required">ชื่อวัตถุดิบ</label>
                                                    <input type="text" class="form-control" name="matItemName" id="edit_mat_item_name"
                                                           placeholder="ชื่อวัตถุดิบ" required>
                                                    <span class="fa fa-pencil form-control-feedback right"
                                                          aria-hidden="true"></span>
                                                </div>
                                                <div class="col-md-4 col-sm-4 col-xs-12 form-group has-feedback">
                                                    <label class="required">ประเภทวัตถุดิบ</label>
                                                    <select name="matCatNo" id="edit_mat_cat_no" class="form-control" required>
                                                        <option value="" disabled>เลือกประเภทวัตถุดิบ</option>
                                                        <c:forEach items="${matCategories}" var="mc">
                                                            <option value="${mc.matCatNo}">${mc.matCatName}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <div class="col-md-4 col-sm-4 col-xs-12 form-group has-feedback">
                                                    <label class="required">หน่วยวัตถุดิบ</label>
                                                    <select name="unitNo" id="edit_unit_no" class="form-control" required>
                                                        <option value="" disabled selected>เลือกหน่วย</option>
                                                        <c:forEach items="${units}" var="u">
                                                            <option value="${u.unitNo}">${u.unitName}</option>
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
        $("#datatable-matitem").DataTable({
            order: [[0,"asc"]],
            columnDefs: [
                {orderable: false, targets: [-1]}
            ],
            columns: [
                {
                    data: 'matItemName'
                },
                {
                    data: 'item'
                },
                {
                    data: 'unit'
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
            url: "${contextPath}/stock/getmaterialitems",
            dataType: "json",
            success: function (json) {
                var data_array = [];
                for (var i=0; i<json.length; i++){
                    var obj = json[i];
                    var data = {
                        matItemName: '<a style="cursor:pointer;font-weight:bold;" onclick = "set_mat_item(' + obj.matItemNo + ')" data-toggle = "modal" data-target = "#editMatItem">' + obj.matItemName + '</a>',
                        item: obj.materialCategory.matCatName,
                        unit: obj.unit.unitName,
                        option: '<a onclick = "set_mat_item(' + obj.matItemNo + ')" class = "btn btn-warning btn-sm" data-toggle = "modal" data-target = "#editMatItem"> <i class = "fa fa-pencil"> </i> &nbsp; แก้ไข </a>' +
                        '<a onclick = "del_mat_item(' + obj.matItemNo+ ',\'' + obj.matItemName +'\')" class = "btn btn-danger btn-sm"> <i class = "fa fa-trash"></i> &nbsp; ลบ </a>'
                    }
                    data_array.push(data);
                }
                $("#datatable-matitem").DataTable().clear();
                $("#datatable-matitem").DataTable().rows.add(data_array).draw(false);
            }
        });
    }

    $("#add_mat_item").submit(function(){
        var object = $("#add_mat_item").serialize();
        $.ajax({
            type: "POST",
            data: object,
            url: "${contextPath}/stock/managematerialitem",
            success: function (result) {
                swal("สำเร็จ", "ชื่อวัตถุดิบ " + $("#add_mat_item").val() + " ถูกเพิ่มเรียบร้อยแล้ว", "success");
                reset_field();
                $("#addMatItem").modal('toggle');
                refresh_table();
            },error: function(result){
                swal("ไม่สำเร็จ", "ชื่ออาจซ้ำ กรุณาลองใหม่ในภายหลัง", "error");
            }
        });
        return false;
    });

    $('.modal').on('hidden.bs.modal', function(){
        reset_field();
    });

    function reset_field(){
        $("#add_mat_item")[0].reset();
    }

    $("#edit_mat_item").submit(function(){
        var object = $("#edit_mat_item").serialize();
        $.ajax({
            type: "POST",
            data: object,
            url: "${contextPath}/stock/managematerialitem",
            success: function (result) {
                swal("สำเร็จ", "ชื่อวัตถุดิบ " + $("#add_mat_item").val() + " ถูกแก้ไขเรียบร้อยแล้ว", "success");
                $("#edit_mat_item")[0].reset();
                $("#editMatItem").modal('toggle');
                refresh_table();
            },error: function(result){
                swal("ไม่สำเร็จ", "ชื่ออาจซ้ำ กรุณาลองใหม่ในภายหลัง", "error");
            }
        });
        return false;
    });

    function set_mat_item(matItemNo) {
        $.ajax({
            type: "PUT",
            url: "${contextPath}/stock/getmaterialitem/" + matItemNo,
            dataType: "json",
            success: function (result) {
                $("#hiddenmatitemno").val(result.matItemNo);
                $("#edit_mat_item_name").val(result.matItemName);
                $("#edit_mat_cat_no").val(result.matCatNo);
                $("#edit_unit_no").val(result.unitNo);
                $("#show_mat_item_name_for_edit").html(result.matItemName);
            }
        });
    }

    function del_mat_item(matItemNo,matItemName) {
        swal ({
                title: "ยืนยันการลบ " + matItemName,
                text: "เมื่อยืนยัน จะไม่สามารถนำข้อมูล "+matItemName+" กลับมาได้",
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
                    url: "${contextPath}/stock/delmaterialitem/"+matItemNo,
                    success: function (json) {
                        swal ("สำเร็จ", matItemName+" ถูกลบเรียบร้อยแล้ว", "success");
                        refresh_table();
                    },
                    error: function (json) {
                        swal ("ไม่สำเร็จ", "ยังมีเมนูที่เป็นอาหารวัตถุดิบนี้อยู่ กรุณาลบออกให้หมดก่อน หรือเซิร์ฟเวอร์อาจมีปัญหา", "error");
                    }
                });
            });
    }
</script>
</body>
</html>