<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>${reset == null ? 'ตั้งค่าการลงชื่อเข้าใช้ระบบ' : 'รีเซ็ตรหัสผ่าน'} </title>
    <link rel="icon" type="image/png" href="${contextPath}/images/OEB_LOGO.png">
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
    <link href="${contextPath}/vendors/sweetalert/sweetalert.css" rel="stylesheet">
</head>

<body class="login">
<div>
    <div class="login_wrapper">
        <div class="animate form login_form">
            <section class="login_content">
                <form id="adduser">
                    <h1>${reset == null ? 'ตั้งค่าการลงชื่อเข้าใช้ระบบ' : 'รีเซ็ตรหัสผ่าน'}</h1>
                    <div>
                        <input type="text" class="form-control" placeholder="Username" name="username" required=""
                               value="${username}" ${username != null ? 'readonly' : ''} minlength="8"/>
                    </div>
                    <div>
                        <input type="password" class="form-control" placeholder="Password" name="password" id="password"
                               required="" minlength="8"/>
                    </div>
                    <div>
                        <input type="password" class="form-control" placeholder="Confirm Password" id="confirmpassword"
                               name="confirmpassword" required="" minlength="8"/>
                    </div>
                    <div>
                        <button class="btn btn-primary submit form-control" style="text-align: center">ตกลง</button>
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
<script src="${contextPath}/vendors/sweetalert/sweetalert.min.js"></script>
<script src="${contextPath}/vendors/jquery/dist/jquery.min.js"></script>
<script>
    $("#adduser").submit(function () {
        if ($("#password").val() == $("#confirmpassword").val()) {
            $.ajax({
                url: "${contextPath}/system/register${userNo != null ? 'user' : 'emp'}process/"+ ${userNo != null ? userNo : empNo},
                data: $("#adduser").serialize(),
                method: "POST",
                success: function (target) {
                    swal("${reset == null ? 'สมัครสมาชิกสำเร็จ' : 'รีเซ็ตรหัสผ่านสำเร็จ'}","กรุณารอสักครู่", "success");
                    setTimeout(function () {
                        window.location.replace(target);
                    },2000);
                },
                error: function () {
                    swal("ไม่สำเร็จ", "username อาจซ้ำ กรุณาลองใหม่อีกครั้ง", "error");
                }
            });
        } else {
            swal("ไม่สำเร็จ", "กรุณากรอก Password ให้ตรงกัน", "error");
        }
        return false;
    });
</script>
</html>
