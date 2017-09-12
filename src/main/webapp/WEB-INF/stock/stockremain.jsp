<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML>
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
                                       class="table table-striped table-bordered ">
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
                                        <h4 class="modal-title">รายละเอียดของ <span
                                                id="show_mat_item_name_for_info"></span> </h4>
                                    </div>
                                    <!-- ส่วนเนื้อหาของ Modal -->
                                    <div class="modal-body">
                                        <form class="form-horizontal form-label-left input_mask"
                                              modelAttribute="matitem">
                                            <input type="hidden" name="matFlag" value="M">
                                            <div class="form-group">
                                                <div class="col-md-12 col-sm-12 col-xs-12">
                                                    <table id="stockRemainsInfo"
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

                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <!-- ปุ่มกดปิด (Close) ตรงส่วนล่างของ Modal -->
                                                <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
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
                                                           value="0" min="0" required>
                                                        <span style="font-weight:normal"
                                                              class="unit"></span>
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
                                                           value="0" min="0" required>
                                                    <span style="font-weight:normal"
                                                          class="unit"></span>

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

        $("#stockRemainsInfo").DataTable({
            order: [[0, "asc"]],
            columnDefs: [
                {orderable: false, targets: [-1]}
            ],
            columns: [
                {
                    data: {
                        _: 'update.display',
                        sort: 'update.order'
                    }
                },
                {
                    data: {
                        _: 'amount.display',
                        sort: 'amount.order'
                    }
                },
                {
                    data: 'supplier'
                },
                {
                    data: 'importer'
                },
                {
                    data: 'matRemain'
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

                    matRemain = 0;
                    for(j=0 ;j < obj.materialHistories.length ;j++){
                        matRemain += obj.materialHistories[j].matQuantity;
                    }

                    var data = {
                        matItemName: '<a style="cursor:pointer;font-weight:bold;" onclick = "set_mat_remain(' + obj.matItemNo + ',\'' + obj.matItemName +'\',\'' + obj.unit.unitName + '\')" data-toggle = "modal" data-target = "#updateStockRemain">' + obj.matItemName + '</a>',
                        item: obj.materialCategory.matCatName,
                        remain: '<div style="color ' + (matRemain < 0 ? ':red' : '' ) + '">'+ matRemain +'</div>',
                        option: '<a onclick = "set_mat_remain(' + obj.matItemNo + ',\'' + obj.matItemName +'\',\'' + obj.unit.unitName + '\')" class = "btn btn-warning btn-sm" data-toggle = "modal" data-target = "#updateStockRemain"> <i class = "fa fa-pencil"> </i> &nbsp; อัพเดต </a>' +
                                '<a onclick = "getHistories(' + obj.matItemNo + ',\'' + obj.matItemName +'\')" class = "btn btn-primary btn-sm" data-toggle = "modal" data-target = "#matHistoriesInfo"> <i class = "fa fa-info-circle"></i> &nbsp; รายละเอียด </a>'
                    }
                    data_array.push(data);
                }
                $("#datatable-stockremain").DataTable().clear();
                $("#datatable-stockremain").DataTable().rows.add(data_array).draw(false);
            }
        });
    }


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
            data: object,
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

    function getHistories(matNo ,matName) {
        $.ajax({
            type: "PUT",
            url: "${contextPath}/stock/getmaterialhistory/" + matNo,
            dataType: "json",
            success: function (result) {
                console.log(result);
                var data_array = [];
                for (var k = 0 ; k < result.length ; k++){
                    var obj= result[k];
                    console.log(obj);
                    var date = new Date(obj.date.substring(0, 4), obj.date.substring(5, 7), obj.date.substring(8, 11), obj.time.substring(0, 2), obj.time.substring(3, 5), obj.time.substring(7, 9), 0);
                    amount_order = obj.matQuantity * 1000;
                    for (var j = ("" + amount_order).length; j < 30; j++) {
                        amount_order = "0" + amount_order;
                    }
                    var data = {
                        update: {
                            display: ((date.getDate() < 10 ? "0" + date.getDate() : date.getDate()) + "/" + ((date.getMonth()) < 10 ? "0" + (date.getMonth()) : date.getMonth()) + "/" + date.getFullYear() + " " + (date.getHours() < 10 ? "0" + date.getHours() : date.getHours()) + "." + (date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes()) + " น."),
                            order: "" + date.getFullYear() + date.getMonth() + date.getDate() + date.getHours() + date.getMinutes() + date.getSeconds()
                        },
                        amount: {
                            display: '<div style="color ' + (obj.matQuantity < 0 ? ':red' : ':green' ) + '">'+ obj.matQuantity +'</div>',
                            order: amount_order
                        },
                        supplier: obj.supplier,
                        importer: obj.importer,
                        matRemain: obj.matRemain
                    };
                    data_array.push(data);
                }
                $('#show_mat_item_name_for_info').html(matName);
                $("#stockRemainsInfo").DataTable().clear();
                $("#stockRemainsInfo").DataTable().rows.add(data_array).draw(false);
            }
        });
    }
    function set_mat_remain(matNo,matName,unitName) {
        $('#show_mat_item_name_for_update').html(matName);
        $('.unit').html(unitName);
        $('#hiddenitemno').val(matNo);
    }

</script>
</body>
</html>
