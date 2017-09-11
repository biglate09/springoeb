<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html   >

<head>
    <meta charset="utf-8">
    <title>ลงชื่อเข้าใช้</title>

    <!-- CSS -->
    <link href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500" rel="stylesheet" >
    <link href="${contextPath}/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${contextPath}/assets/css/font-awesome.min.css" rel="stylesheet" />
    <link href="${contextPath}/assets/css/form-elements.css" rel="stylesheet" />
    <link href="${contextPath}/assets/css/styles.css" rel="stylesheet" />

    <%--<link rel="stylesheet" href="../webapp/assets/bootstrap/css/bootstrap.min.css">--%>
    <%--<link rel="stylesheet" href="../webapp/assets/font-awesome/css/font-awesome.min.css">--%>
    <%--<link rel="stylesheet" href="../webapp/assets/css/form-elements.css">--%>
    <%--<link rel="stylesheet" href="../webapp/assets/css/style.css">--%>

</head>

<body>

<!-- Top content -->
<div class="top-content">

    <div class="inner-bg">
        <div class="container">
            <div class="row">
                <div class="col-sm-6 col-sm-offset-3 form-box">
                    <div class="form-top">
                        <div class="form-top-left">
                            <h3>ลงชื่อเข้าใช้</h3>
                            <p>ระบุ ชื่อผู้ใช้ และ รหัสผ่าน เพื่อลงชื่อเข้าใช้:</p>
                        </div>
                        <div class="form-top-right">
                            <img class="logo" src="${contextPath}/images/OEB_LOGO.png" style="width: 105px;height: 105px;">
                        </div>
                    </div>
                    <div class="form-bottom">
                        <form role="form" action="${contextPath}/system/login" method="post" class="login-form" modelAttribute="branchUser">
                            <div class="form-group">
                                <label class="sr-only" for="form-username">ชื่อผู้ใช้</label>
                                <input type="text" name="username" placeholder="ชื่อผู้ใช้..." class="form-username form-control" id="form-username"
                                       value="${username}" autofocus onfocus="this.value = this.value" required>
                            </div>
                            <div class="form-group">
                                <label class="sr-only" for="form-password">รหัสผ่าน</label>
                                <input type="password" name="password" placeholder="รหัสผ่าน..." class="form-password form-control
                                ${username!=null?'wrong-entry':''}" id="form-password">
                            </div>
                            <div class="remember checkbox">
                                <label>
                                    <input type="checkbox" name="remember-me" ${rememberme?'checked':''}>จำรหัสผ่าน
                                </label>
                            </div>
                            <button type="submit" class="btn">ลงชื่อเข้าใช้!</button>
                            <p style="color:red;text-align:center;font-size:13px;">${msg}</p>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>


<!-- Javascript -->
<script src="${contextPath}/assets/js/jquery-1.11.1.min.js"></script>
<script src="${contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="${contextPath}/assets/js/jquery.backstretch.min.js"></script>
<script src="${contextPath}/assets/js/scripts.js"></script>


</body>

</html>