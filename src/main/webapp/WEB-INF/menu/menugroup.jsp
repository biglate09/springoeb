<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../_include/topenv.jsp"/>
    <title>หมวดหมู่เมนูอาหาร</title>
    <style>
        .required:after {
            content:" *";
            color:red;
        }
    </style>
</head>
<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <jsp:include page="../_include/navbar.jsp"/>
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
                            <h4>หมวดหมู่เมนูอาหาร</h4>
                        </div>
                        <div class="x_content">
                            <form action="#">
                                <p>
                                    <a data-toggle="modal" data-target="#addMenuGroup"
                                       class="btn btn-success btn-sm"><i class="fa fa-plus-circle"></i>&nbsp;
                                        เพิ่มหมวดหมู่</a>
                                </p>
                                <table id="datatable-menugroup"
                                       class="table table-striped table-bordered bulk_action1">
                                    <thead>
                                    <tr>
                                        <th style="width:20%;text-align:center;">ชื่อหมวดหมู่อาหาร</th>
                                        <th style="width:20%;text-align:center;">ประเภท</th>
                                        <th style="width:20%;text-align:center;">ตัวเลือก</th>
                                    </tr>
                                    </thead>
                                    <tbody style="text-align:center;">
                                    </tbody>
                                </table>
                            </form>
                        </div>
                        <div class="modal fade" id="addMenuGroup" role="dialog">
                            <div class="modal-dialog modal-lg">
                                <!-- เนือหาของ Modal ทั้งหมด -->
                                <div class="modal-content">
                                    <!-- ส่วนหัวของ Modal -->
                                    <div class="modal-header">
                                        <!-- ปุ่มกดปิด (X) ตรงส่วนหัวของ Modal -->
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">เพิ่มหมวดหมู่เมนูอาหารใหม่</h4>
                                    </div>
                                    <!-- ส่วนเนื้อหาของ Modal -->
                                    <div class="modal-body ">
                                        <form class="form-horizontal form-label-left input_mask" modelAttribute="menugroup" id="add_menu_group">
                                            <div class="form-group">
                                                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                                    <label class="required">ชื่อหมวดหมู่อาหารภาษาไทย</label>
                                                    <input type="text" class="form-control" name="menuGroupNameTH" id="add_menu_group_nameTH"
                                                           placeholder="ชื่อหมวดหมู่อาหารภาษาไทย" required>
                                                    <span class="fa fa-pencil form-control-feedback right"
                                                          aria-hidden="true"></span>
                                                </div>
                                                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                                    <label class="required">ชื่อหมวดหมู่อาหารภาษาอังกฤษ</label>
                                                    <input type="text" class="form-control" name="menuGroupNameEN" id="add_menu_group_nameEN"
                                                           placeholder="ชื่อหมวดหมู่อาหารภาษาอังกฤษ" required>
                                                    <span class="fa fa-pencil form-control-feedback right"
                                                          aria-hidden="true"></span>
                                                </div>
                                                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                                    <label class="required">ประเภทอาหาร</label>
                                                    <select name="menuCatNo" id="add_menu_cat" class="form-control" required>
                                                        <option value="" disabled selected>เลือกประเภทอาหาร</option>
                                                        <c:forEach items="${menuCategories}" var="mc">
                                                            <option value="${mc.menuCatNo}">${mc.menuCatName}</option>
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
                        <div class="modal fade" id="editMenuGroup" role="dialog">
                            <div class="modal-dialog modal-lg">
                                <!-- เนือหาของ Modal ทั้งหมด -->
                                <div class="modal-content">
                                    <!-- ส่วนหัวของ Modal -->
                                    <div class="modal-header">
                                        <!-- ปุ่มกดปิด (X) ตรงส่วนหัวของ Modal -->
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">แก้ไขหมวดหมู่เมนูอาหาร <span id="show_menu_group_name_for_edit"></span></h4>
                                    </div>
                                    <!-- ส่วนเนื้อหาของ Modal -->
                                    <div class="modal-body">
                                        <form class="form-horizontal form-label-left input_mask" modelAttribute="menugroup" id="edit_menu_group">
                                            <input type="hidden" name="menuGroupNo" id="hiddenmenugroupno">
                                            <div class="form-group">
                                                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                                    <label class="required">ชื่อหมวดหมู่อาหารภาษาไทย</label>
                                                    <input type="text" class="form-control" name="menuGroupNameTH" id="edit_menu_group_nameTH"
                                                           placeholder="ชื่อหมวดหมู่อาหารภาษาไทย" required>
                                                    <span class="fa fa-pencil form-control-feedback right"
                                                          aria-hidden="true"></span>
                                                </div>
                                                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                                    <label class="required">ชื่อหมวดหมู่อาหารภาษาอังกฤษ</label>
                                                    <input type="text" class="form-control" name="menuGroupNameEN" id="edit_menu_group_nameEN"
                                                           placeholder="ชื่อหมวดหมู่อาหารภาษาอังกฤษ" required>
                                                    <span class="fa fa-pencil form-control-feedback right"
                                                          aria-hidden="true"></span>
                                                </div>
                                                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                                    <label class="required">ประเภทอาหาร</label>
                                                    <select name="menuCatNo" id="edit_menu_group_no" class="form-control" required>
                                                        <option value="" disabled>เลือกประเภทอาหาร</option>
                                                        <c:forEach items="${menuCategories}" var="mc">
                                                            <option value="${mc.menuCatNo}">${mc.menuCatName}</option>
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
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../_include/bottomenv.jsp"/>
<script>
    $(document).ready(function () {
        $("#datatable-menugroup").DataTable({
            order: [[0,"asc"]],
            columnDefs: [
                {orderable: false, targets: [-1]}
            ],
            columns: [
                {
                    data: 'menuGroupName'
                },
                {
                    data: 'group'
                },
                {
                    data: 'option'
                }
            ]
        });

        refresh_table();
    });

    function refresh_table() {
        $.ajax({
            type: "POST",
            url: "${contextPath}/menu/getmenugroups",
            dataType: "json",
            success: function (json) {
                var data_array = [];
                for (var i=0; i<json.length; i++){
                    var obj = json[i];
                    var data = {
                        menuGroupName: '<a style="cursor:pointer;font-weight:bold;" onclick = "set_menu_group(' + obj.menuGroupNo + ')" data-toggle = "modal" data-target = "#editMenuGroup">' + obj.menuGroupNameTH +" / "+ obj.menuGroupNameEN + '</a>',
                        group: obj.menuCategory.menuCatName,
                        option: '<a onclick = "set_menu_group(' + obj.menuGroupNo + ')" class = "btn btn-warning btn-sm" data-toggle = "modal" data-target = "#editMenuGroup"> <i class = "fa fa-pencil"> </i> &nbsp; แก้ไข </a>' +
                        '<a onclick = "del_menu_group(' + obj.menuGroupNo+ ',\'' + obj.menuGroupNameTH +'\')" class = "btn btn-danger btn-sm"> <i class = "fa fa-trash"></i> &nbsp; ลบ </a>'
                    }
                    data_array.push(data);
                }
                $("#datatable-menugroup").DataTable().clear();
                $("#datatable-menugroup").DataTable().rows.add(data_array).draw(false);
            }
        });
    }

    $("#add_menu_group").submit(function(){
        var object = $("#add_menu_group").serialize();
        $.ajax({
            type: "POST",
            data: object,
            url: "${contextPath}/menu/managemenugroup",
            success: function (result) {
                swal("สำเร็จ", "ชื่อหมวดหมู่ " + $("#add_menu_group").val() + " ถูกเพิ่มเรียบร้อยแล้ว", "success");
                reset_field();
                $("#addMenuGroup").modal('toggle');
                refresh_table();
            },error: function(result){
                swal("ไม่สำเร็จ", "ชื่ออาจซ้ำ กรุณาลองใหม่ในภายหลัง", "error");
            }
        });
        return false;
    });

    $('.modal').on('hidden.bs.modal', function(){
        reset_field();
    });

    function reset_field(){
        $("#add_menu_group")[0].reset();
    }

    $("#edit_menu_group").submit(function(){
        var object = $("#edit_menu_group").serialize();
        $.ajax({
            type: "POST",
            data: object,
            url: "${contextPath}/menu/managemenugroup",
            success: function (result) {
                swal("สำเร็จ", "ชื่อหมวดหมู่ " + $("#add_menu_group").val() + " ถูกแก้ไขเรียบร้อยแล้ว", "success");
                $("#edit_menu_group")[0].reset();
                $("#editMenuGroup").modal('toggle');
                refresh_table();
            },error: function(result){
                swal("ไม่สำเร็จ", "ชื่ออาจซ้ำ กรุณาลองใหม่ในภายหลัง", "error");
            }
        });
        return false;
    });

    function set_menu_group(menuGroupNo) {
        $.ajax({
            type: "PUT",
            url: "${contextPath}/menu/getmenugroup/" + menuGroupNo,
            dataType: "json",
            success: function (result) {
                $("#hiddenmenugroupno").val(result.menuGroupNo);
                $("#edit_menu_group_nameTH").val(result.menuGroupNameTH);
                $("#edit_menu_group_nameEN").val(result.menuGroupNameEN);
                $("#edit_menu_group_no").val(result.menuCatNo);
                $("#show_menu_group_name_for_edit").html(result.menuGroupNameTH + " / " + result.menuGroupNameEN);
            }
        });
    }

    function del_menu_group(menuGroupNo,menuGroupNameTH) {
        swal ({
                title: "ยืนยันการลบ " + menuGroupNameTH,
                text: "เมื่อยืนยัน จะไม่สามารถนำข้อมูล "+menuGroupNameTH+" กลับมาได้",
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
                    url: "${contextPath}/menu/delmenugroup/"+menuGroupNo,
                    success: function (json) {
                        swal ("สำเร็จ", menuGroupNameTH+" ถูกลบเรียบร้อยแล้ว", "success");
                        refresh_table();
                    },
                    error: function (json) {
                        swal ("ไม่สำเร็จ", "ยังมีเมนูที่เป็นอาหารหมวดหมู่นี้อยู่ กรุณาลบออกให้หมดก่อน หรือเซิร์ฟเวอร์อาจมีปัญหา", "error");
                    }
                });
            });
    }
</script>
</body>
</html>