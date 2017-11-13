<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Admin</title>
</head>
<body>
<form action="${contextPath}/OEBProject/system/createrestaurant" method="POST">
    ชื่อร้านอาหาร <input type="text" name="srestName"><br>
    สาขาแรก <br>
    ชื่อสาขา <input type="text" name="branchName"><br>
    Email <input type="email" name="email"><br>
    Username <input type="text" name="username">
    <input type="submit">
</form>
</body>
</html>