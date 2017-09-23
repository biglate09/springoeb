<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../_include/topenv.jsp"/>
    <title>จัดการสมาชิกของสาขา</title>
</head>
<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <jsp:include page="../_include/navbar.jsp"/>
    </div>

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
                        <h4>จัดการสมาชิกทั้งหมด</h4>
                    </div>
                    <div class="x_content">
                        <form action="#">
                            <p>
                                <a data-toggle="modal" data-target="#addMember"
                                   class="btn btn-success btn-sm"><i class="fa fa-plus-circle"></i>&nbsp;
                                    เพิ่มสมาชิก</a>
                            </p>
                            <table id="datatable-members"
                                   class="table table-striped table-bordered">
                                <thead>
                                <tr>
                                    <th style="text-align:center;">ชื่อผู้ใช้</th>
                                    <th style="text-align:center;">หน้าที่</th>
                                    <th style="text-align:center;">ตัวเลือก</th>
                                </tr>
                                </thead>
                                <tbody style="text-align:center;">

                                </tbody>
                            </table>
                        </form>
                    </div>
                </div>
            </div>
            <!-- /page content -->
            <!-- Modal Content (Add Member)-->
            <div class="modal fade" id="addMember" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">เพิ่มสมาชิกสาขา</h4>
                        </div>
                        <div class="modal-body">
                            <form class="form-horizontal form-label-left input_mask" modelAttribute="member"
                                  id="add_member">
                                <div class="form-group">
                                    <div class="col-md-12 col-sm-12 col-xs-12 form-group has-feedback">
                                        <label class="required">ชื่อผู้ใช้</label>
                                        <input type="text" class="form-control" name="username" id="username"
                                               placeholder="ชื่อผู้ใช้" minlength="8" required>
                                        <span class="fa fa-user form-control-feedback right"
                                              aria-hidden="true"></span>
                                    </div>
                                    <div class="col-md-12 col-sm-12 col-xs-12 form-group has-feedback">
                                        <label class="required">รหัสผ่าน</label>
                                        <input type="password" class="form-control" name="password" id="password"
                                               placeholder="รหัสผ่าน" minlength="8" required>
                                        <span class="fa fa-lock form-control-feedback right"
                                              aria-hidden="true"></span>
                                    </div>

                                    <div class="col-md-12 col-sm-12 col-xs-12 form-group has-feedback">
                                        <label class="required">ยืนยันรหัสผ่าน</label>
                                        <input type="password" class="form-control" id="confirmPassword"
                                               placeholder="ยืนยันรหัสผ่าน" minlength="8" required>
                                        <span class="fa fa-lock form-control-feedback right"
                                              aria-hidden="true"></span>
                                    </div>

                                    <div class="col-md-12 col-sm-12 col-xs-12 form-group has-feedback"
                                         style="clear: both;">
                                        <label class="required">หน้าที่</label>
                                        <select name="roleNo" class="form-control" required>
                                            <option value="" selected disabled>เลือกหน้าที่</option>
                                            <c:forEach items="${roles}" var="r">
                                                <option value="${r.roleNo}">${r.roleName}</option>
                                            </c:forEach>
                                        </select>
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
            <!-- /Modal Content (Add Member)-->

            <!-- Modal Content (Add Member)-->
            <div class="modal fade" id="resetMember" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">รีเซ็ตรหัสผ่านของสมาชิกสาขา</h4>
                        </div>
                        <div class="modal-body">
                            <form class="form-horizontal form-label-left input_mask" modelAttribute="member"
                                  id="reset_member">
                                <input type="hidden" id="branchUserNo_hidden" name="branchUserNo">
                                <div class="form-group">
                                    <div class="col-md-12 col-sm-12 col-xs-12 form-group has-feedback">
                                        <label class="required">ชื่อผู้ใช้</label>
                                        <input type="text" class="form-control" name="username" id="username_edit"
                                               placeholder="ชื่อผู้ใช้" minlength="8" required disabled>
                                        <span class="fa fa-user form-control-feedback right"
                                              aria-hidden="true"></span>
                                    </div>
                                    <div class="col-md-12 col-sm-12 col-xs-12 form-group has-feedback">
                                        <label class="required">รหัสผ่าน</label>
                                        <input type="password" class="form-control" name="password" id="password_edit"
                                               placeholder="รหัสผ่าน" minlength="8" required>
                                        <span class="fa fa-lock form-control-feedback right"
                                              aria-hidden="true"></span>
                                    </div>

                                    <div class="col-md-12 col-sm-12 col-xs-12 form-group has-feedback">
                                        <label class="required">ยืนยันรหัสผ่าน</label>
                                        <input type="password" class="form-control" id="confirmPassword_edit"
                                               placeholder="ยืนยันรหัสผ่าน" minlength="8" required>
                                        <span class="fa fa-lock form-control-feedback right"
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
            <!-- /Modal Content (Add Member)-->
        </div>
    </div>
</div>
<jsp:include page="../_include/bottomenv.jsp"/>
<script>
    $(document).ready(function () {
        $("#datatable-members").DataTable({
            order: [[1, "asc"]],
            columnDefs: [
                {orderable: false, targets: [-1]}
            ],
            columns: [
                {
                    data: 'username'
                },
                {
                    data: {
                        _ : 'role.display',
                        sort : 'role.order'
                    }
                },
                {
                    data: 'option'
                }
            ]
        });

        refresh_table();
    });

    $("#addMember").submit(function () {
        var object = $("#add_member").serialize();
        if($("#password").val() == $("#confirmPassword").val()){
            $.ajax({
                type: "POST",
                data: object,
                url: "${contextPath}/branch/managemember",
                success: function (result) {
                    swal("สำเร็จ", "สมาชิก " + $("#username").val() + " ถูกเพิ่มเรียบร้อยแล้ว", "success");
                    reset_field();
                    $("#addMember").modal('toggle');
                    refresh_table();
                }, error: function (result) {
                    swal("ไม่สำเร็จ", "กรุณาลองใหม่อีกครั้ง", "error");
                }
            });
        }else{
            swal("ไม่สำเร็จ", "กรุณากรอกรหัสผ่านให้ตรงกัน", "error");
        }
        return false;
    });

    $("#resetMember").submit(function () {
        var object = $("#reset_member").serialize();
        if($("#password_edit").val() == $("#confirmPassword_edit").val()){
            $.ajax({
                type: "POST",
                data: object,
                url: "${contextPath}/branch/managemember",
                success: function (result) {
                    swal("สำเร็จ", "รีเซ็ตเรียบร้อยแล้ว", "success");
                    reset_field();
                    $("#resetMember").modal('toggle');
                    refresh_table();
                }, error: function (result) {
                    swal("ไม่สำเร็จ", "กรุณาลองใหม่อีกครั้ง", "error");
                }
            });
        }else{
            swal("ไม่สำเร็จ", "กรุณากรอกรหัสผ่านให้ตรงกัน", "error");
        }
        return false;
    });

    $('.modal').on('hidden.bs.modal', function () {
        reset_field();
    });

    function reset_field() {
        $("#add_member")[0].reset();
        $("#reset_member")[0].reset();
    }

    function refresh_table() {
        $.ajax({
            type: "POST",
            url: "${contextPath}/branch/getmembers",
            dataType: "json",
            success: function (json) {
                var data_array = [];
                for (var i = 0; i < json.length; i++) {
                    var member = json[i];
                    var data_refresh = {
                        username : member.username,
                        role : {
                            display : member.role.roleName,
                            order : member.role.roleNo
                        },
                        option : '<a onclick="resetpassword('+member.branchUserNo+',\'' + member.username + '\')"  data-toggle="modal" data-target="#resetMember" class="btn btn-dark btn-sm"><i class="fa fa-undo"></i>&nbsp; รีเซ็ต</a>' +
                        (member.branchUserNo == ${branchUser.branchUserNo} ? '' : '<a onclick="delMember(' + member.branchUserNo + ',\'' + member.username + '\')" class="btn btn-danger btn-sm"> <i class="fa fa-trash"></i>&nbsp; ลบ</a>')
                    };
                    data_array.push(data_refresh);
                }

                $("#datatable-members").DataTable().clear();
                $("#datatable-members").DataTable().rows.add(data_array).draw(false);
            }
        });
    }

    function delMember(memberNo, username) {
        swal({
            title: "คุณต้องการลบสมาชิกใช่ไหม",
            text: "กรุณาพิมพ์คำว่า \"ฉันต้องการลบ " + username+"\"",
            type: "input",
            showCancelButton: true,
            closeOnConfirm: false,
            inputPlaceholder: "ฉันต้องการลบ username",
        }, function (input) {
            if(input == 'ฉันต้องการลบ ' + username){
                $.ajax({
                    type: "DELETE",
                    url: "${contextPath}/branch/deletemember/" + memberNo,
                    success: function (json) {
                        swal("สำเร็จ", username + " ถูกลบเรียบร้อยแล้ว", "success");
                        refresh_table();
                    },
                    error: function (json) {
                        swal("ไม่สำเร็จ", "กรุณาลองใหม่อีกครั้ง", "error");
                    }
                });
            }else{
                swal("ไม่สำเร็จ", "คุณพิมพ์ผิด กรุณาลองใหม่อีกครั้ง", "error");
            }
        });
    }

    function resetpassword(branchUserNo,username) {
        $("#branchUserNo_hidden").val(branchUserNo);
        $("#username_edit").val(username);
    }
</script>
</body>
</html>