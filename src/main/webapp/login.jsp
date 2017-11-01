<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ลงชื่อเข้าใช้</title>
    <link rel="icon" type="image/png" href="${contextPath}/images/OEB_LOGO_TEST.png">
    <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>
    <style>
        * {
            box-sizing: border-box;
            -moz-box-sizing: border-box;
            -webkit-box-sizing: border-box;
            font-family: arial;
        }

        h1 {
            color: #ccc;
            text-align: center;
            font-family: 'Vibur', cursive;
            font-size: 50px;
        }

        .logo {
            height: 40%;
            width: 40%;
            margin-bottom: 10%;
            display: block;
            margin-left: auto;
            margin-right: auto;
        }

        .remember {
            color: #999;
            font-size: 12px;
            margin-bottom: 3%;
        }

        .login-form {
            width: 350px;
            padding: 40px 30px;
            background: #eee;
            -moz-border-radius: 4px;
            -webkit-border-radius: 4px;
            border-radius: 4px;
            margin: auto;
            position: absolute;
            left: 0;
            right: 0;
            top: 50%;
            box-shadow: 0px 0px 15px #888888;
            -moz-transform: translateY(-50%);
            -ms-transform: translateY(-50%);
            -webkit-transform: translateY(-50%);
            transform: translateY(-50%);
        }

        .form-group {
            position: relative;
            margin-bottom: 15px;
        }

        .form-control {
            width: 100%;
            height: 50px;
            border: none;
            padding: 5px 7px 5px 15px;
            background: #fff;
            color: #666;
            border: 2px solid #ddd;
            -moz-border-radius: 4px;
            -webkit-border-radius: 4px;
            border-radius: 4px;
        }

        .form-control:focus, .form-control:focus + .fa {
            border-color: #10CE88;
            color: #10CE88;
        }

        .form-group .fa {
            position: absolute;
            right: 15px;
            top: 17px;
            color: #999;
        }

        .log-status.wrong-entry {
            -moz-animation: wrong-log 0.3s;
            -webkit-animation: wrong-log 0.3s;
            animation: wrong-log 0.3s;
        }

        .log-status.wrong-entry .form-control, .wrong-entry .form-control + .fa {
            border-color: #ed1c24;
            color: #ed1c24;
        }

        .log-btn {
            background: #0AC986;
            display: inline-block;
            width: 100%;
            font-size: 16px;
            height: 50px;
            color: #fff;
            text-decoration: none;
            border: none;
            -moz-border-radius: 4px;
            -webkit-border-radius: 4px;
            border-radius: 4px;
        }

        .link {
            text-decoration: none;
            color: #C6C6C6;
            float: right;
            font-size: 12px;
            margin-bottom: 15px;
        }

        .link:hover {
            text-decoration: underline;
            color: #8C918F;
        }

        .alert {
            font-size: 12px;
            color: #f00;
            float: left;
        }

        @-moz-keyframes wrong-log {
            0%, 100% {
                left: 0px;
            }
            20%, 60% {
                left: 15px;
            }
            40%, 80% {
                left: -15px;
            }
        }

        @-webkit-keyframes wrong-log {
            0%, 100% {
                left: 0px;
            }
            20%, 60% {
                left: 15px;
            }
            40%, 80% {
                left: -15px;
            }
        }

        @keyframes wrong-log {
            0%, 100% {
                left: 0px;
            }
            20%, 60% {
                left: 15px;
            }
            40%, 80% {
                left: -15px;
            }
        }
    </style>
</head>

<body style="background-color:darkorange;background-image: url('${contextPath}/images/bg.png');width: 100vw;background-repeat: no-repeat;background-attachment: fixed;">
<div class="login-form">
    <form action="${contextPath}/system/login" method="POST" modelAttribute="branchUser">
        <div class="col-xs-2 col-xs-0ffset-2">
            <img class="logo" src="${contextPath}/images/OEB_LOGO.png">
        </div>

        <div class="form-group ">
            <input type="text" class="form-control" placeholder="ชื่อผู้ใช้" name="username" value="${username}"
                   ${username == null ? 'autofocus' : '' } onfocus="this.value = this.value" required>
            <i class="fa fa-user"></i>
        </div>
        <div class="form-group log-status">
            <input type="password" class="form-control ${username!=null?'wrong-entry':''}" placeholder="รหัสผ่าน"
                   name="password" ${username != null ? 'autofocus' : '' } required minlength="8">
            <i class="fa fa-lock"></i>
        </div>
        <div class="remember checkbox">
            <label>
                <input type="checkbox" name="remember-me" ${rememberme?'checked':''} >จำรหัสผ่าน
            </label>
        </div>
        <button type="submit" class="log-btn">ลงชื่อเข้าใช้</button>
        <p style="color:red;text-align:center;font-size:13px;">${msg}</p>
    </form>
</div>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
</body>
</html>