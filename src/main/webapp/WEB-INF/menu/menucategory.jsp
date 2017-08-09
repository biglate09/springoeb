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
                console.log(json);
                var data_array = [];
                for (var i=0; i<json.length; i++){
                    var obj = json[i];
                    var data = {
                        menuCatName: obj.menuCatNameTH +" / "+ obj.menuCatNameEN,
                        group: obj.stockCategory.stockCatName,
                        option: '<a onclick = " set_menu_category(' + obj.menuCatNo + ')" class = "btn btn-warning btn-sm" data-toggle = "modal" data-target = "#editMenuCat"> <i class = "fa fa-pencil"> </i> &nbsp; แก้ไข </a>' +
                        '<a onclick = " del_menu_category(' + obj.menuCatNo+ ',\'' + obj.menuCatNameTH +'\')") class = "btn btn-danger btn-sm"> <i class = "fa fa-trash"></i> &nbsp; ลบ </a>'
                    }
                    data_array.push(data);
                }
                $("#datatable-menucat").DataTable().clear();
                $("#datatable-menucat").DataTable().rows.add(data_array).draw(false);
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
                },
                error: function (json) {
                    swal ("ไม่สำเร็จ", "เซิร์ฟเวอร์อาจมีปัญหา", "error");
                }
            });
        });
    }
</script>
</body>
</html>