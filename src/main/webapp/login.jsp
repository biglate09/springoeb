<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="Chrome">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ลงชื่อเข้าใช้</title>

    <!-- CSS -->
    <link rel="stylesheet" href="${contextPath}assets/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${contextPath}assets/css/font-awesome.min.css" />
    <link rel="stylesheet" href="${contextPath}assets/css/form-elements.css" />
    <link rel="stylesheet" href="${contextPath}assets/css/styles.css" />
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
    <%--<link rel="stylesheet" href="../webapp/assets/bootstrap/css/bootstrap.min.css">--%>
    <%--<link rel="stylesheet" href="../webapp/assets/font-awesome/css/font-awesome.min.css">--%>
    <%--<link rel="stylesheet" href="../webapp/assets/css/form-elements.css">--%>
    <%--<link rel="stylesheet" href="../webapp/assets/css/style.css">--%>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Favicon and touch icons -->
    <link rel="shortcut icon" href="assets/ico/favicon.png">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../webapp/assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../webapp/assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../webapp/assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../webapp/assets/ico/apple-touch-icon-57-precomposed.png">

</head>

<body>

<!-- Top content -->
<div class="top-content">

    <div class="inner-bg">
        <div class="container">
            <!-- <div class="row">
                <div class="col-sm-8 col-sm-offset-2 text">
                    <h1><strong>Bootstrap</strong> Login Form</h1>
                    <div class="description">
                        <p>
                            This is a free responsive login form made with Bootstrap.
                            Download it on <a href="http://azmind.com"><strong>AZMIND</strong></a>, customize and use it as you like!
                        </p>
                    </div>
                </div>
            </div> -->
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
                            <%--<div class="remember checkbox">--%>
                                <%--<label>--%>
                                    <%--<input type="checkbox" name="remember-me" ${rememberme?'checked':''}>จำรหัสผ่าน--%>
                                <%--</label>--%>
                            <%--</div>--%>
                            <button type="submit" class="btn">ลงชื่อเข้าใช้!</button>
                            <p style="color:red;text-align:center;font-size:13px;">${msg}</p>
                        </form>
                    </div>
                </div>
            </div>
            <!-- <div class="row">
                <div class="col-sm-6 col-sm-offset-3 social-login">
                    <h3>...or login with:</h3>
                    <div class="social-login-buttons">
                        <a class="btn btn-link-2" href="#">
                            <i class="fa fa-facebook"></i> Facebook
                        </a>
                        <a class="btn btn-link-2" href="#">
                            <i class="fa fa-twitter"></i> Twitter
                        </a>
                        <a class="btn btn-link-2" href="#">
                            <i class="fa fa-google-plus"></i> Google Plus
                        </a>
                    </div>
                </div>
            </div> -->
        </div>
    </div>

</div>


<!-- Javascript -->
<script src="assets/js/jquery-1.11.1.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/js/jquery.backstretch.min.js"></script>
<script src="assets/js/scripts.js"></script>

<!--[if lt IE 10]>
<script src="assets/js/placeholder.js"></script>
<![endif]-->

</body>

</html>