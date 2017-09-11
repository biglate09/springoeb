<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../_include/topenv.jsp"/>
    <title>จัดการสาขานี้</title>
</head>
<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <jsp:include page="../_include/navbar.jsp"/>
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
                                <h4>จัดการสาขานี้</h4>
                            </div>
                            <div class="x_content">
                                <div class="col-md-6 col-sm-6 col-xs-12 align-self-start form-group has-feedback">
                                    <label>ชื่อสาขา</label>
                                    <input class="form-control" name="branchName" placeholder="ชื่อสาขา">
                                </div>
                                <div class="col-md-6 col-sm-6 col-xs-12 align-self-start form-group has-feedback">
                                    <label>รายละเอียดสาขา</label>
                                    <textarea rows="4" cols="50" class="form-control" name="branchDesc"
                                              placeholder="รายละเอียด..."></textarea>
                                </div>
                                <hr style="margin-bottom:5px !important; margin-top:5px !important; margin-top: 20px;margin-bottom: 20px;
                                border: 0;border-top: 1px solid #eeeeee;" />
                                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                    <label>ที่อยู่</label>
                                    <input class="form-control" name="addressName" >
                                </div>
                                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                    <label>ถนน</label>
                                    <input class="form-control" name="road" >
                                </div>
                                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                    <label>จังหวัด</label>
                                    <select class="form-control" name="province">
                                        <option>จังหวัด</option>
                                    </select>
                                </div>
                                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                    <label>ตำบล/แขวง</label>
                                    <select class="form-control" name="subDistrict">
                                        <option>ตำบล/แขวง</option>
                                    </select>
                                </div>
                                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                    <label>อำเภอ/เขต</label>
                                    <select class="form-control" name="district">
                                        <option>อำเภอ/เขต</option>
                                    </select>
                                </div>
                                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                    <label>รหัสไปรษณีย์</label>
                                    <select class="form-control" name="zip"></select>
                                </div>
                            </div>


    </div>
</div>
<jsp:include page="../_include/bottomenv.jsp"/>
</body>
</html>