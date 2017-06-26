<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html >
    <head>
        <meta charset="UTF-8">
        <title>ลงชื่อเข้าใช้</title>
        <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>
        <link rel="stylesheet" href="${contextPath}/build/css/loginstyle.css">
    </head>

    <body>
        <div class="login-form">
            <form action="${contextPath}/system/login" method="POST">
                <div class="col-xs-2 col-xs-0ffset-2">     
                    <img class="logo" src="${contextPath}/images/OEB_LOGO.png" >
                </div>

                <div class="form-group ">
                    <input type="text" class="form-control" placeholder="ชื่อผู้ใช้" name="username" value="${username}" autofocus onfocus="this.value = this.value" required>
                    <i class="fa fa-user"></i>
                </div>
                <div class="form-group log-status">
                    <input type="password" class="form-control ${username!=null?'wrong-entry':''}" placeholder="รหัสผ่าน" name="password" required minlength="8">
                    <i class="fa fa-lock"></i>
                </div>
                <div class="remember checkbox">
                    <label>
                        <input type="checkbox" name="remember-me" ${rememberme?'checked':''}>จำรหัสผ่าน
                    </label>
                </div>
                <button type="submit" class="log-btn" >ลงชื่อเข้าใช้</button>
                <p style="color:red;text-align:center;font-size:13px;">${msg}</p>
            </form>
        </div>
        <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    </body>
</html>