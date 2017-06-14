<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="include/topenv.jsp"/>
    <title>ตำแหน่งพนักงาน</title>
</head>
<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <jsp:include page="include/navbar.jsp"/>
        <!-- page content -->
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
                            <h4>ตำแหน่งพนักงาน</h4>
                        </div>
                        <div class="x_content">
                            <form action="#">
                                <p>
                                    <a href="javascript:void(0)" data-toggle="modal" data-target="#addEmpPos"
                                       class="btn btn-success btn-sm"><i class="fa fa-plus-circle"></i>&nbsp;
                                        เพิ่มพนักงาน</a>
                                    <button type="submit" name="submit" value="del" href="javascript:void(0)"
                                            class="btn btn-danger btn-sm" disabled><i class="fa fa-trash"></i>&nbsp;
                                        ลบที่เลือก
                                    </button>
                                </p>
                                <table id="datatable-checkbox"
                                       class="table table-striped table-bordered bulk_action1">
                                    <thead>
                                    <tr>
                                        <th><input title="checkall" type="checkbox" class="flat" id="check-all-1"
                                                   disabled></th>
                                        <th style="width:20%;text-align:center;">ชื่อตำแหน่ง</th>
                                        <th style="width:20%;text-align:center;">ตัวเลือก</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${employeePositions}" var="ep" varStatus="vs">
                                    <tr id="tr${ep.empPosNo}" style="text-align:center;">
                                        <td>
                                            <input type="checkbox" name="tabdle_records" value="${ep.empPosNo}"
                                                   class="flat"
                                                   disabled>
                                        </td>
                                        <td style="width:80%">
                                            <a href="javascript:void(0)" onclick="editEmpPos(${ep.empPosNo})"
                                               data-toggle="modal"
                                               data-target="#editEmpPos" style="font-weight: bold;">${ep.empPosName}</a>
                                        </td>
                                        <td style="width:20%">
                                            <a onclick="editEmpPos(${ep.empPosNo})" class="btn btn-warning btn-sm"
                                               href="javascript:void(0)" data-toggle="modal"
                                               data-target="#editEmpPos"><i class="fa fa-pencil"></i>&nbsp;
                                                แก้ไข </a>
                                            <a href="${pageContext}/employee/deleteemployeeposition/${ep.empPosNo}" )
                                               class="btn btn-danger btn-sm" href="javascript:void(0)"><i
                                                    class="fa fa-trash"></i>&nbsp; ลบ</a>
                                        </td>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- /page content -->
                <!-- Modal Content (ADD EMP POS)-->
                <div class="modal fade" id="addEmpPos" role="dialog">
                    <div class="modal-dialog">
                        <!-- เนือหาของ Modal ทั้งหมด -->
                        <div class="modal-content">
                            <!-- ส่วนหัวของ Modal -->
                            <div class="modal-header">
                                <!-- ปุ่มกดปิด (X) ตรงส่วนหัวของ Modal -->
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">เพิ่มตำแหน่งพนักงานใหม่</h4>
                            </div>
                            <!-- ส่วนเนื้อหาของ Modal -->
                            <div class="modal-body">
                                <form class="form-horizontal form-label-left input_mask"
                                      action="${pageContext}/employee/manageemployeeposition" method="POST"
                                      modelAttribute="employeeposition">
                                    <div class="form-group">
                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                            <input type="text" class="form-control" name="empPosName"
                                                   placeholder="ชื่อตำแหน่งพนักงาน" required>
                                            <span class="fa fa-user form-control-feedback right"
                                                  aria-hidden="true"></span>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <!-- ปุ่มกดปิด (Close) ตรงส่วนล่างของ Modal -->
                                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                                            <button type="submit" class="btn btn-success">ตกลง</button>
                                            <button type="button" class="btn btn-default" data-dismiss="modal">
                                                ยกเลิก
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /Modal Content (ADD EMP POS)-->

                <!-- Modal Content (EDIT EMP POS)-->
                <div class="modal fade" id="editEmpPos" role="dialog">
                    <div class="modal-dialog">
                        <!-- เนือหาของ Modal ทั้งหมด -->
                        <div class="modal-content">
                            <!-- ส่วนหัวของ Modal -->
                            <div class="modal-header">
                                <!-- ปุ่มกดปิด (X) ตรงส่วนหัวของ Modal -->
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">แก้ไขตำแหน่งพนักงาน</h4>
                            </div>
                            <!-- ส่วนเนื้อหาของ Modal -->
                            <div class="modal-body">
                                <form class="form-horizontal form-label-left input_mask"
                                      action="${pageContext}/employee/manageemployeeposition" method="POST"
                                      modelAttribute="employeeposition">
                                    <input type="hidden" name="empPosNo" id="hiddenempposno">
                                    <div class="form-group">
                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                            <input type="text" class="form-control" id="editempposname"
                                                   name="empPosName"
                                                   placeholder="ชื่อตำแหน่งพนักงาน" required>
                                            <span class="fa fa-user form-control-feedback right"
                                                  aria-hidden="true"></span>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <!-- ปุ่มกดปิด (Close) ตรงส่วนล่างของ Modal -->
                                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                                            <button type="submit" class="btn btn-success">ตกลง</button>
                                            <button type="button" class="btn btn-default" data-dismiss="modal">
                                                ยกเลิก
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /Modal Content (EDIT EMP POS)-->
            </div>
        </div>
    </div>
</div>
<jsp:include page="include/bottomenv.jsp"/>
<script>
    function editEmpPos(empPosNo){
        $.ajax({
            type: "GET",
            url: "${pageContext}/employee/ajax/getemployeeposition/" + empPosNo,
            dataType: "json",
            success: function (result) {
                $("#hiddenempposno").val(result.empPosNo);
                $("#editempposname").val(result.empPosName);
            }
        });
    }
</script>
<%--<script src="handmade/emppos.js"></script>--%>
</body>
</html>