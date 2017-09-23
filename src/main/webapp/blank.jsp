<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="WEB-INF/_include/topenv.jsp"/>
    <title>ตำแหน่งพนักงาน</title>

</head>
<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <jsp:include page="WEB-INF/_include/navbar.jsp"/>
1    </div>
</div>
<jsp:include page="WEB-INF/_include/bottomenv.jsp"/>
</body>
</html>