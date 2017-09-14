<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>ตั้งค่าการลงชื่อเข้าใช้ระบบ </title>
    <!-- Bootstrap -->
    <link href="${contextPath}/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="${contextPath}/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="${contextPath}/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- Animate.css -->
    <link href="${contextPath}/vendors/animate.css/animate.min.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="${contextPath}/build/css/custom.min.css" rel="stylesheet">
</head>

<body class="login">
<div>

    <div class="login_wrapper">
        <div class="animate form login_form">
            <section class="login_content">
                <form>
                    <h1>ตั้งค่าการลงชื่อเข้าใช้</h1>
                    <div>
                        <input type="text" class="form-control" placeholder="Username" name="username" required="" />
                    </div>
                    <div>
                        <input type="password" class="form-control" placeholder="Password" name="password" required="" />
                    </div>
                    <div>
                        <input type="password" class="form-control" placeholder="Confirm Password" name="confirmpassword" required="" />
                    </div>
                    <div>
                        <button class="btn btn-primary submit form-control" style="text-align: center" >ตกลง</button>
                    </div>

                    <div class="clearfix"></div>

                    <div class="separator">
                        <div class="clearfix"></div>
                        <br/>
                        <div>
                            <h1><i class="fa fa-cutlery"></i> Order Eat Bill</h1>
                            <p>©2017 All Rights Reserved. Order Eat Bill. Privacy and Terms</p>
                        </div>
                    </div>
                </form>
            </section>
        </div>


    </div>
</div>
</body>
</html>
