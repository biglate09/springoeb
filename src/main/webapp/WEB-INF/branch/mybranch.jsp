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

                                <div class="col align-self-start form-group has-feedback">
                                    <label>ชื่อสาขา</label>
                                    <input class="form-control" style="width: 50%" name="branchName" placeholder="ชื่อสาขา">
                                </div>
                                <div class="col align-self-start form-group has-feedback">
                                    <label>รายละเอียดสาขา</label>
                                    <textarea rows="4" cols="60" class="form-control" style="width: 50%" name="branchDesc"
                                              placeholder="รายละเอียด..."></textarea>
                                </div>

                                <hr style="margin-top: 20px;margin-bottom: 15px;border: 0;border-top: 1px solid #eeeeee;" />
                                <div class="col-md-12">
                                    <h4 style="font-weight: normal;text-decoration: underline;margin-bottom: 15px;">ติดต่อ</h4>
                                </div>
                                <div class="col-md-6">
                                    <div class="col form-group has-feedback">
                                        <label>ที่อยู่</label>
                                        <input class="form-control" name="addressName" >
                                    </div>
                                    <div class="col form-group has-feedback">
                                        <label>ถนน</label>
                                        <input class="form-control" name="road" >
                                    </div>
                                    <div class="col form-group has-feedback">
                                        <label>จังหวัด</label>
                                        <select class="form-control" name="province">
                                            <option>จังหวัด</option>
                                        </select>
                                    </div>
                                    <div class="col form-group has-feedback">
                                        <label>ตำบล/แขวง</label>
                                        <select class="form-control" name="subDistrict">
                                            <option>ตำบล/แขวง</option>
                                        </select>
                                    </div>
                                    <div class="col form-group has-feedback">
                                        <label>อำเภอ/เขต</label>
                                        <select class="form-control" name="district">
                                            <option>อำเภอ/เขต</option>
                                        </select>
                                    </div>
                                    <div class="col form-group has-feedback">
                                        <label>รหัสไปรษณีย์</label>
                                        <select class="form-control" name="zip">
                                            <option>รหัสไปรษณีย์</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="col form-group">
                                        <label>เบอร์โทรศัพท์</label>
                                        <input class="form-control" name="tel" placeholder="0xx-xxx-xxxx">
                                    </div>
                                    <div class="col form-group">
                                        <label>Line ID </label>
                                        <input class="form-control" name="line" placeholder="Line ID">
                                    </div>
                                    <div class="col form-group">
                                        <label>Facebook</label>
                                        <input class="form-control" name="fb" placeholder="fb.com/xxxxxx">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12 col-sm-12 col-xs-12" style="text-align: center;">
                                <button type="submit" style="margin-left:5px;width: 100px;"
                                        class="btn btn-warning">แก้ไข
                                </button>
                                <button type="button" class="btn btn-default" style="width: 100px;">
                                    ยกเลิก
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </div>
</div>
<jsp:include page="../_include/bottomenv.jsp"/>
</body>
</html>