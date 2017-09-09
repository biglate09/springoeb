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
            url: "${contextPath}/stock/getmaterials",
            dataType: "json",
            success: function (json) {
                var data_array = [];
                for (var i = 0; i < json.length; i++) {
                    var obj = json[i];
                    var data = {
                        matItemName: '<a style="cursor:pointer;font-weight:bold;" onclick = "manageMaterialHistory(' + obj.matItemNo + ')" data-toggle = "modal" data-target = "#updateMaterial">' + obj.matItemName + '</a>',
                        item: obj.materialCategory.matCatName,
                        remain: obj.getMaterials(),
                        option: '<a onclick = "manageMaterialHistory(' + obj.matItemNo + ')" class = "btn btn-warning btn-sm" data-toggle = "modal" data-target = "#add"> <i class = "fa fa-pencil"> </i> &nbsp; อัพเดต </a>' +
                        '<a onclick = "manageMaterialHistory(' + obj.matItemNo + ',\'' + obj.matItemName + '\')" class = "btn btn-danger btn-sm"> <i class = "fa fa-trash"></i> &nbsp; รายละเอียด </a>'
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
            data: new FormData($("#update")[0]),
            enctype: 'multipart/form-data',
            cache: false,
            contentType: false,
            processData: false,
            url: "${contextPath}/stock/managematerialhistory",
            success: function (result) {
                swal("สำเร็จ", "เมนูนี้ถูกแก้ไขเรียบร้อยแล้ว", "success");
                $("#update")[0].reset();
                $("#updateMatRemain").modal('toggle');
                refresh_table();
            }, error: function (result) {
                swal("ไม่สำเร็จ", "ชื่อภาษาไทยหรืออังกฤษอาจซ้ำ กรุณาลองใหม่ในภายหลัง", "error");
            }
        });
        return false;
    });

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
</script>
</body>
</html>
