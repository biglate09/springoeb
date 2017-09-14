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
                                    <a data-toggle="modal" data-target="#addStockCat"
                                       class="btn btn-success btn-sm"><i class="fa fa-plus-circle"></i>&nbsp;
                                        เพิ่มประเภท</a>
                                </p>
                                <table id="datatable-stockcat"
                                       class="table table-striped table-bordered bulk_action1">
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
                        <div class="modal fade" id="addStockCat" role="dialog">
                            <div class="modal-dialog">
                                <!-- เนือหาของ Modal ทั้งหมด -->
                                <div class="modal-content">
                                    <!-- ส่วนหัวของ Modal -->
                                    <div class="modal-header">
                                        <!-- ปุ่มกดปิด (X) ตรงส่วนหัวของ Modal -->
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">เพิ่มประเภทวัตถุดิบใหม่</h4>
                                    </div>
                                    <!-- ส่วนเนื้อหาของ Modal -->
                                    <div class="modal-body">
                                        <form class="form-horizontal form-label-left input_mask" modelAttribute="stockcategory" id="add_stock_category">
                                            <div class="form-group">
                                                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                                    <label class="required">ชื่อประเภทวัถุดิบภาษาไทย</label>
                                                    <input type="text" class="form-control" name="stockCatNameTH" id="add_stock_cat_nameTH"
                                                           placeholder="ชื่อประเภทวัตถุดิบภาษาไทย" required>
                                                    <span class="fa fa-pencil form-control-feedback right"
                                                          aria-hidden="true"></span>
                                                </div>
                                                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                                    <label class="required">ชื่อประเภทวัตถุดิบภาษาอังกฤษ</label>
                                                    <input type="text" class="form-control" name="stockCatNameEN" id="add_stock_cat_nameEN"
                                                           placeholder="ชื่อประเภทวัตถุดิบภาษาอังกฤษ" required>
                                                    <span class="fa fa-pencil form-control-feedback right"
                                                          aria-hidden="true"></span>
                                                </div>
                                                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                                    <label class="required">หมวดหมู่ของประเภทวัตถุดิบ</label>
                                                    <select name="stockCatNo" id="add_stock_cat_stock_cat" class="form-control" required>
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
                        <div class="modal fade" id="editStockCat" role="dialog">
                            <div class="modal-dialog">
                                <!-- เนือหาของ Modal ทั้งหมด -->
                                <div class="modal-content">
                                    <!-- ส่วนหัวของ Modal -->
                                    <div class="modal-header">
                                        <!-- ปุ่มกดปิด (X) ตรงส่วนหัวของ Modal -->
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">แก้ไขประเภทวัตถุดิบ <span id="show_stock_cat_name_for_edit"></span></h4>
                                    </div>
                                    <!-- ส่วนเนื้อหาของ Modal -->
                                    <div class="modal-body">
                                        <form class="form-horizontal form-label-left input_mask" modelAttribute="stockcategory" id="edit_stock_category">
                                            <input type="hidden" name="stockCatNo" id="hiddenstockcatno">
                                            <div class="form-group">
                                                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                                    <label class="required">ชื่อประเภทวัตถุดิบภาษาไทย</label>
                                                    <input type="text" class="form-control" name="stockCatNameTH" id="edit_stock_cat_nameTH"
                                                           placeholder="ชื่อประเภทวัตถุดิบภาษาไทย" required>
                                                    <span class="fa fa-pencil form-control-feedback right"
                                                          aria-hidden="true"></span>
                                                </div>
                                                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                                    <label class="required">ชื่อประเภทวัตถุดิบภาษาอังกฤษ</label>
                                                    <input type="text" class="form-control" name="stockCatNameEN" id="edit_stock_cat_nameEN"
                                                           placeholder="ชื่อประเภทวัตถุดิบภาษาอังกฤษ" required>
                                                    <span class="fa fa-pencil form-control-feedback right"
                                                          aria-hidden="true"></span>
                                                </div>
                                                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                                    <label class="required">หมวดหมู่ของประเภทวัตถุดิบ</label>
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
        $("#datatable-stockcat").DataTable({
            order: [[0,"asc"]],
            columnDefs: [
                {orderable: false, targets: [-1]}
            ],
            columns: [
                {
                    data: 'stockCatName'
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
            url: "${contextPath}/stock/getstockcategories",
            dataType: "json",
            success: function (json) {
                var data_array = [];
                for (var i=0; i<json.length; i++){
                    var obj = json[i];
                    var data = {
                        stockCatName: '<b style="cursor:pointer" onclick = "set_stock_category(' + obj.stockCatNo + ')" data-toggle = "modal" data-target = "#editStockCat">' + obj.stockCatNameTH +" / "+ obj.stockCatNameEN + '</b>',
                        group: obj.stockCategory.stockCatName,
                        option: '<a onclick = "set_stock_category(' + obj.stockCatNo + ')" class = "btn btn-warning btn-sm" data-toggle = "modal" data-target = "#editStockCat"> <i class = "fa fa-pencil"> </i> &nbsp; แก้ไข </a>' +
                        '<a onclick = "del_stock_category(' + obj.stockCatNo+ ',\'' + obj.stockCatNameTH +'\')" class = "btn btn-danger btn-sm"> <i class = "fa fa-trash"></i> &nbsp; ลบ </a>'
                    }
                    data_array.push(data);
                }
                $("#datatable-stockcat").DataTable().clear();
                $("#datatable-stockcat").DataTable().rows.add(data_array).draw(false);
            }
        });
    }

    $("#add_stock_category").submit(function(){
        var object = $("#add_stock_category").serialize();
        $.ajax({
            type: "POST",
            data: object,
            url: "${contextPath}/stock/managestockcategory",
            success: function (result) {
                swal("สำเร็จ", "ชื่อประเภท " + $("#add_stock_category").val() + " ถูกเพิ่มเรียบร้อยแล้ว", "success");
                reset_field();
                $("#addStockCat").modal('toggle');
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
        $("#add_stock_category")[0].reset();
    }

    $("#edit_stock_category").submit(function(){
        var object = $("#edit_stock_category").serialize();
        $.ajax({
            type: "POST",
            data: object,
            url: "${contextPath}/stock/managestockcategory",
            success: function (result) {
                swal("สำเร็จ", "ชื่อประเภท " + $("#add_stock_category").val() + " ถูกแก้ไขเรียบร้อยแล้ว", "success");
                $("#edit_stock_category")[0].reset();
                $("#editStockCat").modal('toggle');
                refresh_table();
            },error: function(result){
                swal("ไม่สำเร็จ", "ชื่ออาจซ้ำ กรุณาลองใหม่ในภายหลัง", "error");
            }
        });
        return false;
    });

    function set_stock_category(stockCatNo) {
        $.ajax({
            type: "PUT",
            url: "${contextPath}/stock/getstockcategory/" + stockCatNo,
            dataType: "json",
            success: function (result) {
                $("#hiddenstockcatno").val(result.stockCatNo);
                $("#edit_stock_cat_nameTH").val(result.stockCatNameTH);
                $("#edit_stock_cat_nameEN").val(result.stockCatNameEN);
                $("#edit_stock_cat_no").val(result.stockCatNo);
                $("#show_stock_cat_name_for_edit").html(result.stockCatNameTH + " / " + result.stockCatNameEN);
            }
        });
    }

    function del_stock_category(stockCatNo,stockCatNameTH) {
        swal ({
                title: "ยืนยันการลบ " + stockCatNameTH,
                text: "เมื่อยืนยัน จะไม่สามารถนำข้อมูล "+stockCatNameTH+" กลับมาได้",
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
                    url: "${contextPath}/stock/delstockcategory/"+stockCatNo,
                    success: function (json) {
                        swal ("สำเร็จ", stockCatNameTH+" ถูกลบเรียบร้อยแล้ว", "success");
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