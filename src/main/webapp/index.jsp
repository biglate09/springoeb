<%@ page import="com.springoeb.system.model.BranchUser" %>
<%@ page import="com.springoeb.system.model.Role" %>
<%
    BranchUser branchUser = (BranchUser) session.getAttribute("branchUser");
    int roleNo = branchUser.getRoleNo();
    if(roleNo == Role.MANAGER) {
        response.sendRedirect(request.getContextPath() + "/employee/index");
    }else if(roleNo == Role.EMPLOYEE){
        response.sendRedirect(request.getContextPath() + "/employee/table");
    }else if(roleNo == Role.KITCHEN){
        response.sendRedirect(request.getContextPath() + "/kitchen/kitchen");
    }else if(roleNo == Role.CASHIER){
        response.sendRedirect(request.getContextPath() + "/cashier/cashier");
    }
%>