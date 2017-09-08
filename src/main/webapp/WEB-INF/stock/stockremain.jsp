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
                            <button onclick="getMaterials()">ปุ่มทดสอบ getmaterials</button>
                            <button onclick="manageMaterialHistory()">ปุ่มทดสอบ managematerialhistory</button>
                            <button onclick="getHistories(9)">ปุ่มทดสอบ getmaterialhistory</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../_include/bottomenv.jsp"/>
<script>
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
