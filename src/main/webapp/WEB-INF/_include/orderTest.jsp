<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="topenv.jsp"/>
    <title>ตำแหน่งพนักงาน</title>

</head>
<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <jsp:include page="navbar.jsp"/>

        <!-- page content -->
        <div class="right_col" role="main">
            <div class="">


                <div class="clearfix"></div>

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>เมนูอาหาร</h2><h2 style="float: right">บิลที่ <small>#0001</small></h2>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <form method="POST">
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <th>ชื่ออาหาร</th>
                                        <th>add-ons</th>
                                        <th>ราคา</th>
                                        <th>จำนวน</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>-</td>
                                        <td>
                                            <input type="checkbox" name="" value="" required class="flat" /> add-ons 1
                                            <br />
                                        </td>
                                        <td>-</td>
                                        <td><input type="number" name="" value="1"></td>
                                    </tr>
                                    <tr>
                                        <td>-</td>
                                        <td>
                                            <input type="checkbox" name="" value="" required class="flat" /> add-ons 1
                                            <br />
                                            <input type="checkbox" name="" value="" required class="flat" /> add-ons 1
                                            <br />
                                        </td>
                                        <td>-</td>
                                        <td><input type="number" name="" value="1"></td>
                                    </tr>
                                    <tr>
                                        <td>-</td>
                                        <td>
                                            <input type="checkbox" name="" value="" required class="flat" /> add-ons 1
                                            <br />
                                            <input type="checkbox" name="" value="" required class="flat" /> add-ons 1
                                            <br />
                                        </td>
                                        <td>-</td>
                                        <td><input type="number" name="" value="1"></td>
                                    </tr>
                                    <tr>
                                        <td>-</td>
                                        <td>
                                            <input type="checkbox" name="" value="" required class="flat" /> add-ons 1
                                            <br />
                                            <input type="checkbox" name="" value="" required class="flat" /> add-ons 1
                                            <br />
                                        </td>
                                        <td>-</td>
                                        <td><input type="number" name="" value="1"></td>
                                    </tr>
                                    </tbody>
                                </table>
                                </form>
                                <button type="submit" class="btn btn-success">สั่งอาหาร</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /page content -->
    </div>
</div>
<jsp:include page="bottomenv.jsp"/>
</body>
</html>