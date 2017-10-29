<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../_include/topenv.jsp"/>
    <title>จัดการสาขาทั้งหมด</title>

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
                        <h4>จัดการสาขาทั้งหมด</h4>
                    </div>
                    <div class="x_content">
                        <form action="#">
                            <p>
                                <a data-toggle="modal" data-target="#addBranch"
                                   class="btn btn-success btn-sm"><i class="fa fa-plus-circle"></i>&nbsp;
                                    เพิ่มสาขา</a>
                            </p>
                            <table id="datatable-branches"
                                   class="table table-striped table-bordered">
                                <thead>
                                <tr>
                                    <th style="width:5%;text-align:center;">หมายเลขสาขา</th>
                                    <th style="width:20%;text-align:center;">ชื่อสาขา</th>
                                    <th style="width:20%;text-align:center;">ตัวเลือก</th>
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
            <!-- Modal Content (Add Branch)-->
            <div class="modal fade" id="addBranch" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">เพิ่มสาขาใหม่</h4>
                        </div>
                        <div class="modal-body">
                            <form class="form-horizontal form-label-left input_mask" modelAttribute="branch" id="add_branch">
                                <div class="form-group">
                                    <div class="col-md-12 col-sm-12 col-xs-12 form-group has-feedback">
                                        <label class="required">ชื่อสาขา</label>
                                        <input type="text" class="form-control" name="branchName" id="branchName"
                                               placeholder="ชื่อสาขา" required>
                                        <span class="fa fa-pencil form-control-feedback right"
                                              aria-hidden="true"></span>
                                    </div>
                                    <div class="col-md-12 col-sm-12 col-xs-12 form-group has-feedback">
                                        <label class="required">อีเมลสาขา</label>
                                        <input type="email" class="form-control" name="email" id="email"
                                               placeholder="เช่น mybranch@mail.com" required>
                                        <span class="fa fa-envelope form-control-feedback right"
                                              aria-hidden="true"></span>
                                    </div>
                                    <div class="col-md-12 col-sm-12 col-xs-12 form-group has-feedback">
                                        <label class="required">Username ของสาขา</label>
                                        <input type="text" class="form-control" name="username" id="username"
                                               placeholder="Username" required>
                                        <span class="fa fa-user form-control-feedback right"
                                              aria-hidden="true"></span>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <!-- ปุ่มกดปิด (Close) ตรงส่วนล่างของ Modal -->
                                    <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                                        <button type="submit" class="btn btn-success"><i class="fa fa-circle-o-notch fa-spin" id="loadingbtn" style="display:none"></i> ตกลง</button>
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
            <!-- /Modal Content (Add Branch)-->
        </div>
    </div>
</div>
<jsp:include page="../_include/bottomenv.jsp"/>
<script>
    $(document).ready(function () {
        $("#datatable-branches").DataTable({
            order: [[0, "asc"]],
            columnDefs: [
                {orderable: false, targets: [-1]}
            ],
            columns: [
                {
                    data: {
                        _ : 'No.display',
                        sort : 'No.order'
                    }
                },
                {
                    data: 'branchName'
                },
                {
                    data: 'option'
                }
            ]
        });

        refresh_table();
    });

    $("#addBranch").submit(function(){
        $('#loadingbtn').show();
        var object = $("#add_branch").serialize();
        $.ajax({
            type: "POST",
            data: object,
            url: "${contextPath}/branch/managebranch",
            success: function (result) {
                $('#loadingbtn').hide();
                swal("สำเร็จ", "สาขา " + $("#branchName").val() + " ถูกเพิ่มเรียบร้อยแล้ว", "success");
                reset_field();
                $("#addBranch").modal('toggle');
                refresh_table();
            },error: function(result){
                $('#loadingbtn').hide();
                swal("ไม่สำเร็จ", "กรุณาลองใหม่อีกครั้ง", "error");
            }
        });
        return false;
    });

    $('.modal').on('hidden.bs.modal', function(){
        reset_field();
    });

    function reset_field(){
        $("#add_branch")[0].reset();
    }

    function refresh_table() {
        $.ajax({
            type: "POST",
            url: "${contextPath}/branch/getbranches",
            dataType: "json",
            success: function (json) {
                var data_array = [];
                for (var iterator = 0; iterator < json.length; iterator++) {
                    var obj = json[iterator];
                    branchsort = iterator;
                    for(var i = (iterator+'').length ; i<10 ; i++){
                        branchsort += "0" + branchsort;
                    }

                    var data_refresh = {
                        No: {
                            display : iterator+1,
                            order : branchsort
                        },
                        branchName: obj.branchName,
                        option: (!obj.hasAdmin ? '<a onclick = "resent(' + obj.branchNo + ')" class = "btn btn-info btn-sm"> <i class = "fa fa-envelope"></i> &nbsp; ส่งอีกครั้ง </a>' : '') +
                        '<a onclick = "del_branch(' + obj.branchNo + ',\'' + obj.branchName +'\')" class = "btn btn-danger btn-sm"> <i class = "fa fa-trash"></i> &nbsp; ลบ </a>'
                    };
                    data_array.push(data_refresh);
                }

                $("#datatable-branches").DataTable().clear();
                $("#datatable-branches").DataTable().rows.add(data_array).draw(false);
            }
        });
    }

    function resent(branchNo) {
        $.ajax({
            type: "POST",
            url: "${contextPath}/branch/confirmresent/"+branchNo,
            dataType: "json",
            success: function (result) {
                swal({
                    title: "คุณต้องการส่งซ้ำ",
                    text: "Username : " + result.username + ' ไปยังอีเมล',
                    type: "input",
                    showCancelButton: true,
                    closeOnConfirm: false,
                    inputPlaceholder: "Input Email",
                    inputValue: result.sentEmail
                }, function (email) {
                    if (email === false) return false;
                    if (email === "") {
                        swal.showInputError("กรุณากรอกอีเมล");
                        return false;
                    }
                    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                    if (!re.test(email)){
                        swal.showInputError("กรุณากรอกรูปแบบอีเมลให้ถูกต้อง");
                        return false;
                    }

                    $.ajax({
                        type: "POST",
                        data: {
                            'branchNo' : branchNo,
                            'email' : email
                        },
                        url: "${contextPath}/branch/resent",
                        success: function(){
                            swal("สำเร็จ", "ส่งซ้ำเรียบร้อยแล้ว", "success");
                        },
                        error: function(){
                            swal("ไม่สำเร็จ", "อีเมลอาจผิด กรุณาลองอีกครั้ง", "error");
                        }
                    });
                });
            }
        });
    }

    function del_branch(branchNo, branchName) {
        swal({
                title: "ยืนยันการลบ " + branchName,
                text: "เมื่อยืนยัน จะไม่สามารถนำข้อมูล " + branchName + " กลับมาได้",
                type: "warning",
                showCancelButton: true,
                cancelButtonText: "ยกเลิก",
                confirmButtonText: "ใช่, ต้องการลบ",
                confirmButtonColor: "#DD6B55",
                closeOnConfirm: false
            },
            function () {
                $.ajax({
                    type: "DELETE",
                    url: "${contextPath}/branch/deletebranch/" + branchNo,
                    success: function (json) {
                        swal("สำเร็จ", branchName + " ถูกลบเรียบร้อยแล้ว", "success");
                        refresh_table();
                    },
                    error: function (json) {
                        swal("ไม่สำเร็จ", "เซิร์ฟเวอร์อาจมีปัญหา", "error");
                    }
                });
            });
    }
</script>
</body>
</html>