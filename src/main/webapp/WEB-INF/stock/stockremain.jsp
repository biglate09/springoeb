<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <jsp:include page="../_include/topenv.jsp"/>
    <title>วัตถุดิบคงเหลือ</title>
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
                            <h4>วัตถุดิบคงเหลือ</h4>
                        </div>
                        <div class="x_content">
                            <%--<button onclick="getMaterials()">ปุ่มทดสอบ getmaterials</button>--%>
                            <%--<button onclick="manageMaterialHistory()">ปุ่มทดสอบ managematerialhistory</button>--%>
                            <%--<button onclick="getHistories(9)">ปุ่มทดสอบ getmaterialhistory</button>--%>
                            <form action="#">
                                <table id="datatable-stockremain"
                                       class="table table-striped table-bordered bulk_action1">
                                    <thead>
                                    <tr>
                                        <th style="width:20%;text-align:center;">ชื่อวัตถุดิบ</th>
                                        <th style="width:20%;text-align:center;">ประเภทวัตถุดิบ</th>
                                        <th style="width:20%;text-align:center;">คงเหลือ</th>
                                        <th style="width:20%;text-align:center;">ตัวเลือก</th>
                                    </tr>
                                    </thead>
                                    <tbody style="text-align:center;">
                                    </tbody>
                                </table>
                            </form>
                        </div>


                        <%-- Stock remain information--%>
                        <div class="modal fade" id="matHistoriesInfo" role="dialog">
                            <div class="modal-dialog">
                                <!-- เนือหาของ Modal ทั้งหมด -->
                                <div class="modal-content modal-body-test" style="overflow-y:hidden;">
                                    <!-- ส่วนหัวของ Modal -->
                                    <div class="modal-header">
                                        <!-- ปุ่มกดปิด (X) ตรงส่วนหัวของ Modal -->
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">รายละเอียดของ</h4>
                                    </div>
                                    <!-- ส่วนเนื้อหาของ Modal -->
                                    <div class="modal-body">
                                        <form class="form-horizontal form-label-left input_mask"
                                              modelAttribute="matitem">
                                            <input type="hidden" name="matFlag" value="M">
                                            <div class="form-group">
                                                <div class="col-md-12 col-sm-12 col-xs-12">
                                                    <table id="stock_remains_datatable"
                                                           class="table table-bordered table-striped">
                                                        <thead>
                                                        <tr>
                                                            <th style="text-align:center;">การอัพเดทล่าสุด</th>
                                                            <th style="text-align:center;">จำนวน</th>
                                                            <th style="text-align:center;">Supplier</th>
                                                            <th style="text-align:center;">ผู้นำเข้า</th>
                                                            <th style="text-align:center;">คงเหลือ</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody style="text-align:center;">
                                                        <c:forEach items="${stockRemains}" var="sr">
                                                            <tr>
                                                                <td style="width:40%;">${sr.matName}</td>
                                                                <td style="width:30%;">${sr.matQuantity}</td>
                                                                <td style="width:40%;">${sr.supplier}</td>
                                                                <td style="width:30%;">${sr.importer}</td>
                                                                <td style="width:40%;"></td>
                                                            </tr>
                                                        </c:forEach>
                                                        </tbody>
                                                    </table>
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

                         <%--Update stock remain--%>
                        <div class="modal fade" id="updateStockRemain" role="dialog">
                            <div class="modal-dialog">
                                <!-- เนือหาของ Modal ทั้งหมด -->
                                <div class="modal-content modal-body-test" style="overflow-y:hidden;">
                                    <!-- ส่วนหัวของ Modal -->
                                    <div class="modal-header">
                                        <!-- ปุ่มกดปิด (X) ตรงส่วนหัวของ Modal -->
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">อัพเดตวัตถุดิบ <span
                                                id="show_mat_item_name_for_update"></span></h4>
                                    </div>
                                    <!-- ส่วนเนื้อหาของ Modal -->
                                    <div class="modal-body">
                                        <form class="form-horizontal form-label-left input_mask"
                                              modelAttribute="matitem" id="update">
                                            <input type="hidden" name="mat_item_no" id="hiddenitemno">
                                            <div class="form-group">
                                                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                                    <label>ผู้นำเข้าวัตถุดิบ</label>
                                                    <input type="text" class="form-control" id="update_importer"
                                                           name="importer"
                                                           placeholder="ชื่อผู้นำเข้าวัตถุดิบ" required>
                                                    <span class="fa fa-pencil form-control-feedback right"
                                                          aria-hidden="true"></span>
                                                </div>
                                                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                                    <label>Supplier</label>
                                                    <input type="text" class="form-control" id="update_supplier"
                                                           name="supplier"
                                                           placeholder="ชื่อ Supplier" required>
                                                    <span class="fa fa-pencil form-control-feedback right"
                                                          aria-hidden="true"></span>
                                                </div>
                                                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                                    <label style="display: inline-block;float: left;clear: left;text-align: right;width: 60%">เพิ่มวัตถุดิบ</label>
                                                    <input type="number" class="form-control" id="update_inc_pack"
                                                           name="inc_pack" style="width: 20%;display: inline-block;float: left;margin-left: 3%;margin-right: 2%"
                                                           value="1" min="0" required> หน่วย
                                                </div>
                                                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                                    <label style="width:17%;display: inline-block;float: left;clear: left;text-align: right;">หน่วยละ</label>
                                                        <input type="number" class="form-control" id="update_inc_quantity"
                                                           name="inc_quantity" style="width: 20%;display: inline-block;float: left;margin-left: 3%;margin-right: 2%"
                                                           value="1" min="0" required>
                                                        <span style="font-weight:normal"
                                                              class="submit-clear"
                                                              id="stock_remain_unit"></span>
                                                </div>
                                                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                                    <label style="display: inline-block;float: left;clear: left;text-align: right;width: 60%">ลดวัตถุดิบ</label>
                                                        <input type="number" class="form-control" id="update_dec_pack"
                                                           name="inc_pack" style="width: 20%;display: inline-block;float: left;margin-left: 3%;margin-right: 2%"
                                                           value="1" min="0" required> หน่วย
                                                </div>
                                                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                                    <label style="width:17%;display: inline-block;float: left;clear: left;text-align: right;">หน่วยละ</label>
                                                    <input type="number" class="form-control" id="update_dec_quantity"
                                                           name="inc_quantity" style="width: 20%;display: inline-block;float: left;margin-left: 3%;margin-right: 2%"
                                                           value="1" min="0" required>

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

        $("#datatable-stockremain").DataTable({
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
                    data: 'remain'
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
                for (var i = 0; i < json.length; i++) {
                    var obj = json[i];
                    var data = {
                        matItemName: '<a style="cursor:pointer;font-weight:bold;" onclick = "set_mat_item(' + obj.matItemNo + ')" data-toggle = "modal" data-target = "#editMatItem">' + obj.matItemName + '</a>',
                        item: obj.materialCategory.matCatName,
                        remain:  + ' ' + obj.unit.unitName,
                        option: '<a onclick = "manageMaterialHistory(' + obj.matItemNo + ')" class = "btn btn-warning btn-sm" data-toggle = "modal" data-target = "#updateStockRemain"> <i class = "fa fa-pencil"> </i> &nbsp; อัพเดต </a>' +
                                '<a onclick = "manageMaterialHistory(' + obj.matItemNo + ')" class = "btn btn-primary btn-sm" data-toggle = "modal" data-target = "#matHistoriesInfo"> <i class = "fa fa-info-circle"></i> &nbsp; รายละเอียด </a>'
                    }
                    data_array.push(data);
                }
                $("#datatable-stockremain").DataTable().clear();
                $("#datatable-stockremain").DataTable().rows.add(data_array).draw(false);
//                $('#indicator').show();
//                $('#someModal').get(anUrl, someData, function() { $('#indicator').hide(); });
            }
        });
    }


    $("#add_unit").on('change', function () {
        $("#stock_remain_unit").html($("#add_unit option:selected").text());
    });

    function manageMaterialHistory() {
        $.ajax({
            type: "POST",
            data: {importer : "บิ๊กเอง",
                supplier: "เจ๊จิ๋ม",
                inc_pack: "1",
                inc_quantity: "300",
                dec_pack: "0",
                dec_quantity: "0",
                mat_item_no: "13"},
            url: "${contextPath}/stock/managematerialhistory",
            success: function (result) {
                console.log(result);
            },error: function(result){
                console.log('error');
            }
        });
    }

    $("#update").submit(function () {
        var object = $("#update").serialize();
        $.ajax({
            type: "POST",
            data: new FormData($("#update")[0]),
            enctype: 'multipart/form-data',
            cache: false,
            contentType: false,
            processData: false,
            url: "${contextPath}/stock/managematerialhistory",
            success: function (result) {
                swal("สำเร็จ", "วัตถุดิบนี้ถูกอัพเดตเรียบร้อยแล้ว", "success");
                reset_field();
                $("#updateStockRemain").modal('toggle');
                refresh_table();
            }, error: function (result) {
                swal("ไม่สำเร็จ", "เซิร์ฟเวอร์อาจมีปัญหา", "error");
            }
        });
        return false;
    });

    $('.modal').on('hidden.bs.modal', function () {
        reset_field();
    });

    function reset_field() {
        $("#update")[0].reset();
    }

    function getMaterials() {
        $.ajax({
            type: "POST",
            url: "${contextPath}/stock/getmaterials",
            dataType: "json",
            success: function (result) {
                console.log(result);
            }
        });
    }

    function getHistories(matNo) {
        $.ajax({
            type: "PUT",
            url: "${contextPath}/stock/getmaterialhistory/" + matNo,
            dataType: "json",
            success: function (result) {
                console.log(result);
            }
        });
    }

    function set_mat_remain(matNo) {
        $.ajax({
            type: "PUT",
            url: "${contextPath}/stock/getmaterialhistory/" + matNo,
            dataType: "json",
            success: function (result) {
                $("#hiddenitemno").val(result.matNo);
                $("#update_importer").val(result.importer);
                $("#update_supplier").val(result.supplier);
                $("#update_inc_pack").val(result.inc_pack);
                $("#update_dec_pack").val(result.dec_pack);
                $("#update_inc_quantity").val(result.inc_quantity);
                $("#update_dec_quantity").val(result.dec_quantity);
                $("#stock_remain_unit").html($("#add_unit option:selected").text());
                $("#show_mat_item_name_for_update").html(result.matItemName);
            }
        });
    }

</script>
</body>
</html>
