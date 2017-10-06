<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../_include/topenv.jsp"/>
    <title>ระบบหลังครัว</title>
</head>
<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <jsp:include page="../_include/navbar.jsp"/>
        <!-- page content -->
        <div class="right_col" role="main">
            <div class="">
                <div class="page-title">
                    <div class="title_right">
                        <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h4>
                                    เมนูอาหารที่ถูกสั่ง
                                </h4>
                            </div>
                            <div class="x_content">
                                <table id="datatable_kitchen_status" class="table table-striped table-bordered">
                                    <thead>
                                    <tr>
                                        <th class="table-rows">ชื่ออาหาร</th>
                                        <th class="table-rows">โต๊ะที่สั่ง</th>
                                        <th class="table-rows">จำนวน</th>
                                        <th class="table-rows">สถานะอาหาร</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td style="text-align:center;"></td>
                                            <td style="text-align:center;"></td>
                                            <td style="text-align:center;"></td>
                                            <td style="text-align:center;">
                                                <button type="button" class="btn btn-default">เมนูที่ได้รับมา</button>
                                                <button type="button" class="btn btn-primary">เมนูที่กำลังปรุง</button>
                                                <button type="button" class="btn btn-success">เมนูที่พร้อมเสิร์ฟ</button>
                                                <button type="button" class="btn btn-danger">เมนูที่ถูกยกเลิก</button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../_include/bottomenv.jsp"/>
</body>
<script>
    $(document).ready(function () {
        $("#datatable_kitchen_status").DataTable({
            "order": [[2, "asc"]],
            "columnDefs": [
                {
                    orderable: false, targets: [-1]
                }
            ]
        });
    });
</script>
</html>