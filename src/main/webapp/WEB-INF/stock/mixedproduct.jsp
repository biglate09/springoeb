<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../_include/topenv.jsp"/>
    <title>วัตถุดิบอาหารแบบผสม</title>
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
                            <h4>วัตถุดิบอาหารแบบผสม</h4>
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
                                        <th style="width:20%;text-align:center;">ชื่อวัตถุดิบอาหารแบบผสม</th>
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
                            <div class="modal-dialog">
                                <!-- เนือหาของ Modal ทั้งหมด -->
                                <div class="modal-content modal-body-test" style="overflow-y:hidden;">
                                    <!-- ส่วนหัวของ Modal -->
                                    <div class="modal-header">
                                        <!-- ปุ่มกดปิด (X) ตรงส่วนหัวของ Modal -->
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">เพิ่มวัตถุดิบอาหารแบบผสมใหม่</h4>
                                    </div>
                                    <!-- ส่วนเนื้อหาของ Modal -->
                                    <div class="modal-body">
                                        <form class="form-horizontal form-label-left input_mask"
                                              modelAttribute="matitem" id="add_mat_item">
                                            <input type="hidden" name="matFlag" value="M">
                                            <div class="form-group">
                                                <div class="col-md-4 col-sm-4 col-xs-12 form-group has-feedback">
                                                    <label>ชื่อวัตถุดิบอาหารแบบผสม</label>
                                                    <input type="text" class="form-control" name="matItemName"
                                                           id="add_mat_item_name"
                                                           placeholder="ชื่อวัตถุดิบอาหารแบบผสม" required>
                                                    <span class="fa fa-pencil form-control-feedback right"
                                                          aria-hidden="true"></span>
                                                </div>
                                                <div class="col-md-4 col-sm-4 col-xs-12 form-group has-feedback">
                                                    <label>ประเภทวัตถุดิบ</label>
                                                    <select name="matCatNo" id="add_mat_cat" class="form-control"
                                                            required>
                                                        <option value="" disabled selected>เลือกวัตถุดิบ</option>
                                                        <c:forEach items="${matCategories}" var="mc">
                                                            <option value="${mc.matCatNo}">${mc.matCatName}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <div class="col-md-4 col-sm-4 col-xs-12 form-group has-feedback">
                                                    <label>หน่วยวัตถุดิบ</label>
                                                    <select name="unitNo" id="add_unit_no" class="form-control"
                                                            required>
                                                        <option value="" disabled selected>เลือกหน่วย</option>
                                                        <c:forEach items="${units}" var="u">
                                                            <option value="${u.unitNo}">${u.unitName}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <div class="col-md-12 col-sm-12 col-xs-12">
                                                    <label>เลือกวัตถุดิบอาหารที่ผสมกันเป็นวัตถุดิบแบบผสมนี้</label>
                                                    <table id="add_mixed_product_datatable"
                                                           class="table table-bordered table-striped">
                                                        <thead>
                                                        <tr>
                                                            <th style="text-align:center;">ชื่อวัตถุดิบอาหาร</th>
                                                            <th style="text-align:center;">ประเภท</th>
                                                            <th style="text-align:center;">จำนวนที่ใช้</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody style="text-align:center;">
                                                        <c:forEach items="${materialItems}" var="mi">
                                                            <tr>
                                                                <td style="width:40%;">${mi.matItemName}</td>
                                                                <td style="width:30%;">${mi.materialCategory.matCatName}</td>
                                                                <td style="width:30%;">
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
                                                            </tr>
                                                        </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div class="col-md-12" style="text-align:center;margin-top:20px;">
                                                    <div class="well" style="overflow: auto">
                                                        <span style="font-weight:bold;">ส่วนผสมของวัตถุดิบอาหารแบบผสมมีดังนี้</span>
                                                        <div id="display_material_desc"
                                                             style="margin-bottom:20px;margin-top:20px;"
                                                             class="submit-clear"></div>
                                                        <div style="font-weight:bold">
                                                            รวมเป็น <span style="font-weight:normal"
                                                                          class="submit-clear"
                                                                          id="mixed_prod_name"></span> ทั้งหมด :
                                                            <input style="width:10%;" type="number" step="0.001"
                                                                   min="0.001" name="quantity" value="1" required>
                                                            <span class="submit-clear" id="mixed_prod_unit"></span>
                                                        </div>
                                                    </div>
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
                            <div class="modal-dialog">
                                <!-- เนือหาของ Modal ทั้งหมด -->
                                <div class="modal-content modal-body-test" style="overflow-y:hidden;">
                                    <!-- ส่วนหัวของ Modal -->
                                    <div class="modal-header">
                                        <!-- ปุ่มกดปิด (X) ตรงส่วนหัวของ Modal -->
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">แก้ไขวัตถุดิบอาหารแบบผสม <span
                                                id="show_mat_item_name_for_edit"></span></h4>
                                    </div>
                                    <!-- ส่วนเนื้อหาของ Modal -->
                                    <div class="modal-body">
                                        <form class="form-horizontal form-label-left input_mask"
                                              modelAttribute="matitem" id="edit_mat_item">
                                            <input type="hidden" name="matFlag" value="M">
                                            <input type="hidden" name="matItemNo" id="hiddenmatitemno">
                                            <div class="form-group">
                                                <div class="col-md-4 col-sm-4 col-xs-12 form-group has-feedback">
                                                    <label>ชื่อวัตถุดิบอาหารแบบผสม</label>
                                                    <input type="text" class="form-control" name="matItemName"
                                                           id="edit_mat_item_name"
                                                           placeholder="ชื่อวัตถุดิบอาหารแบบผสม" required>
                                                    <span class="fa fa-pencil form-control-feedback right"
                                                          aria-hidden="true"></span>
                                                </div>
                                                <div class="col-md-4 col-sm-4 col-xs-12 form-group has-feedback">
                                                    <label>ประเภทวัตถุดิบ</label>
                                                    <select name="matCatNo" id="edit_mat_cat_no" class="form-control"
                                                            required>
                                                        <option value="" disabled>เลือกวัตถุดิบ</option>
                                                        <c:forEach items="${matCategories}" var="mc">
                                                            <option value="${mc.matCatNo}">${mc.matCatName}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <div class="col-md-4 col-sm-4 col-xs-12 form-group has-feedback">
                                                    <label>หน่วยวัตถุดิบ</label>
                                                    <select name="unitNo" id="edit_unit_no" class="form-control"
                                                            required>
                                                        <option value="" disabled selected>เลือกหน่วย</option>
                                                        <c:forEach items="${units}" var="u">
                                                            <option value="${u.unitNo}">${u.unitName}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <div class="col-md-12 col-sm-12 col-xs-12">
                                                    <label>เลือกวัตถุดิบอาหารที่ผสมกันเป็นวัตถุดิบแบบผสมนี้</label>
                                                    <table id="edit_mixed_product_datatable"
                                                           class="table table-bordered table-striped">
                                                        <thead>
                                                        <tr>
                                                            <th style="text-align:center;">ชื่อวัตถุดิบอาหาร</th>
                                                            <th style="text-align:center;">ประเภท</th>
                                                            <th style="text-align:center;">จำนวนที่ใช้</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody style="text-align:center;">
                                                        <c:forEach items="${materialItems}" var="mi">
                                                            <tr>
                                                                <td style="width:40%;">${mi.matItemName}</td>
                                                                <td style="width:30%;">${mi.materialCategory.matCatName}</td>
                                                                <td style="width:30%;">
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
                                                            </tr>
                                                        </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div class="col-md-12" style="text-align:center;margin-top:20px;">
                                                    <div class="well" style="overflow: auto">
                                                        <span style="font-weight:bold;">ส่วนผสมของวัตถุดิบอาหารแบบผสมมีดังนี้</span>
                                                        <div id="display_material_desc2"
                                                             style="margin-bottom:20px;margin-top:20px;"
                                                             class="submit-clear"></div>
                                                        <div style="font-weight:bold">
                                                            รวมเป็น <span style="font-weight:normal"
                                                                          class="submit-clear"
                                                                          id="mixed_prod_name2"></span> ทั้งหมด :
                                                            <input style="width:10%;" type="number" step="0.001"
                                                                   min="0.001" name="quantity" value="1"
                                                                   id="mixed_quantity" required> <span
                                                                class="submit-clear" id="mixed_prod_unit2"></span>
                                                        </div>
                                                    </div>
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
                order: [[0, "asc"]],
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
        $(".modal").on('shown.bs.modal', function () {
            $('#myInput').focus();
            $("#add_mixed_product_datatable").DataTable({
                destroy: true,
                paging: false,
                scrollY: "40vh",
                order: [[1, "asc"]],
                columnDefs: [
                    {orderable: false, targets: [-1]}
                ]
            });

            $("#edit_mixed_product_datatable").DataTable({
                destroy: true,
                paging: false,
                scrollY: "40vh",
                order: [[1, "asc"]],
                columnDefs: [
                    {orderable: false, targets: [-1]}
                ]
            });
        });
        refresh_table();
    });

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

    $("#add_mat_item_name").on('change keyup', function () {
        $("#mixed_prod_name").html($(this).val());
    });

    $("#add_unit_no").on('change', function () {
        $("#mixed_prod_unit").html($("#add_unit_no option:selected").text());
    });

    $("#edit_mat_item_name").on('change keyup', function () {
        $("#mixed_prod_name2").html($(this).val());
    });

    $("#edit_unit_no").on('change', function () {
        $("#mixed_prod_unit2").html($("#edit_unit_no option:selected").text());
    });

    function refresh_table() {
        $.ajax({
            type: "POST",
            url: "${contextPath}/stock/getmixedproducts",
            dataType: "json",
            success: function (json) {
                var data_array = [];
                for (var i = 0; i < json.length; i++) {
                    var obj = json[i];
                    var data = {
                        matItemName: '<a style="cursor:pointer;font-weight:bold;" onclick = "set_mat_item(' + obj.matItemNo + ')" data-toggle = "modal" data-target = "#editMatItem">' + obj.matItemName + '</a>',
                        item: obj.materialCategory.matCatName,
                        unit: obj.unit.unitName,
                        option: '<a onclick = "set_mat_item(' + obj.matItemNo + ')" class = "btn btn-warning btn-sm" data-toggle = "modal" data-target = "#editMatItem"> <i class = "fa fa-pencil"> </i> &nbsp; แก้ไข </a>' +
                        '<a onclick = "del_mat_item(' + obj.matItemNo + ',\'' + obj.matItemName + '\')" class = "btn btn-danger btn-sm"> <i class = "fa fa-trash"></i> &nbsp; ลบ </a>'
                    }
                    data_array.push(data);
                }
                $("#datatable-matitem").DataTable().clear();
                $("#datatable-matitem").DataTable().rows.add(data_array).draw(false);
            }
        });
    }

    $("#add_mat_item").submit(function () {
        var hassubmaterial = false;
        $(".materialamount").each(function () {
            if ($(this).val() > 0) {
                hassubmaterial = true;
                return false;
            }
        });

        if (hassubmaterial) {
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
                }, error: function (result) {
                    swal("ไม่สำเร็จ", "ชื่ออาจซ้ำ กรุณาลองใหม่ในภายหลัง", "error");
                }
            });
        }else{
            swal("ไม่สำเร็จ", "กรุณาเลือกส่วนผสมของวัตถุดิบก่อน", "error");
        }
        return false;
    });

    $('.modal').on('hidden.bs.modal', function(){
        reset_field();
    });

    function reset_field(){
        $(".submit-clear").empty();
        $("#add_mat_item")[0].reset();
    }

    $("#edit_mat_item").submit(function () {
        var hassubmaterial = false;
        $(".materialamount2").each(function () {
            if ($(this).val() > 0) {
                hassubmaterial = true;
                return false;
            }
        });

        if (hassubmaterial) {
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
                }, error: function (result) {
                    swal("ไม่สำเร็จ", "ชื่ออาจซ้ำ กรุณาลองใหม่ในภายหลัง", "error");
                }
            });
        } else {
            swal("ไม่สำเร็จ", "กรุณาเลือกส่วนผสมของวัตถุดิบก่อน", "error");
        }
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
                $("#mixed_prod_name2").html($("#edit_mat_item_name").val());
                $("#mixed_prod_unit2").html($("#edit_unit_no option:selected").text());
                $("#mixed_quantity").val(result.quantity);

                $(".materialamount2").val(0);

                var item_list = result.materialItemList;
                for (var i = 0; i < item_list.length; i++) {
                    $(".materialamount2[matitemno='" + item_list[i].itemNo + "']").val(item_list[i].quantity);
                }

                $("#display_material_desc2").empty();
                $(".materialamount2").attr('disabled',false);
                $(".materialamount2").each(function () {
                    if ($(this).val() > 0) {
                        $("#display_material_desc2").append('<div class="col-md-4 col-md-offset-2" style="text-align:left;white-space:nowrap;overflow:hidden;text-overflow: ellipsis;">' + $(this).attr('matItemName') + '</div><div class="col-md-3 col-md-offset-2" style="text-align:left;">' + $(this).val() + ' ' + $(this).attr('unit') + '</div><br>');
                    }

                    if($(this).attr('matitemno') == result.matItemNo){
                        $(this).attr('disabled',true);
                    }
                });
            }
        });
    }

    function del_mat_item(matItemNo, matItemName) {
        swal({
                title: "ยืนยันการลบ " + matItemName,
                text: "เมื่อยืนยัน จะไม่สามารถนำข้อมูล " + matItemName + " กลับมาได้",
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
                    url: "${contextPath}/stock/delmaterialitem/" + matItemNo,
                    success: function (json) {
                        swal("สำเร็จ", matItemName + " ถูกลบเรียบร้อยแล้ว", "success");
                        refresh_table();
                    },
                    error: function (json) {
                        swal("ไม่สำเร็จ", "ยังมีเมนูที่ใช้อาหารวัตถุดิบนี้อยู่ กรุณาลบออกให้หมดก่อน หรือเซิร์ฟเวอร์อาจมีปัญหา", "error");
                    }
                });
            });
    }
</script>
</body>
</html>