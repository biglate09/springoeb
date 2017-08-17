<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../_include/topenv.jsp"/>
    <title>เมนูอาหารแบบชุด</title>
    <style>
        .foodDesc {
            width: 100%;
            height: 60%;
            overflow-y: scroll;
            margin-top: 10px;
            margin-bottom: 10px;
            background-color: #fff;
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
                            <h4>เมนูอาหารแบบชุด</h4>
                        </div>
                        <div class="x_content">
                            <form action="#">
                                <p>
                                    <a data-toggle="modal" data-target="#addMenuSet"
                                       class="btn btn-success btn-sm"><i class="fa fa-plus-circle"></i>&nbsp;
                                        เพิ่มชุดเมนู</a>
                                </p>
                                <div id="menuset_thumbnail">

                                </div>


                            </form>
                            <div class="modal fade" id="addMenuSet" role="dialog">
                                <div class="modal-dialog">
                                    <!-- เนือหาของ Modal ทั้งหมด -->
                                    <div class="modal-content modal-body-test">
                                        <!-- ส่วนหัวของ Modal -->
                                        <div class="modal-header">
                                            <!-- ปุ่มกดปิด (X) ตรงส่วนหัวของ Modal -->
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">เพิ่มชุดเมนูอาหารใหม่</h4>
                                        </div>
                                        <!-- ส่วนเนื้อหาของ Modal -->
                                        <div class="modal-body">
                                            <form class="form-horizontal form-label-left input_mask"
                                                  id="add_menuset" enctype="multipart/form-data">
                                                <div class="form-group">
                                                    <img class="col-md-offset-3 col-sm-offset-3 col-md-6 col-sm-6 col-xs-12 img-resize"
                                                         id="showpic_menuset" style="margin-bottom:20px;cursor:pointer;"
                                                         height="auto"
                                                         width="414"
                                                         src="../images/default_upload_image.png"/>
                                                    <div class="col-md-offset-3 col-sm-offset-3 col-md-6 col-sm-6 col-xs-12 has-feedback"
                                                         style="margin-bottom: 12px">
                                                        <input type="file" class="form-control" name="menuSetPicPath"
                                                               id="add_menuset_pic"
                                                               onchange="document.getElementById('showpic_menuset').src = window.URL.createObjectURL(this.files[0])"
                                                               placeholder="อัพโหลดรูปภาพ" required>
                                                    </div>

                                                    <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                                        <label>ชื่อชุดเมนูอาหารภาษาไทย</label>
                                                        <input type="text" class="form-control" name="menuSetNameTH"
                                                               id="add_menuset_nameTH"
                                                               placeholder="ชื่อชุดเมนูอาหารภาษาไทย" required>
                                                        <span class="fa fa-pencil form-control-feedback right"
                                                              aria-hidden="true"></span>
                                                    </div>
                                                    <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                                        <label>ชื่อชุดเมนูอาหารภาษาอังกฤษ</label>
                                                        <input type="text" class="form-control" name="menuSetNameEN"
                                                               id="add_menuset_nameEN"
                                                               placeholder="ชื่อชุดเมนูอาหารภาษาอังกฤษ" required>
                                                        <span class="fa fa-pencil form-control-feedback right"
                                                              aria-hidden="true"></span>
                                                    </div>
                                                    <div class="col-md-12 col-sm-12 col-xs-12 form-group has-feedback">
                                                        <label>รายละเอียดของชุดเมนูอาหาร</label>
                                                        <textarea rows="4" cols="50" class="form-control"
                                                                  name="menuSetDesc"
                                                                  id="add_menuset_desc"
                                                                  placeholder="รายละเอียด" required></textarea>
                                                    </div>
                                                    <div class="col-md-12">
                                                        <label>เลือกเมนูอาหารที่อยู่ในชุดอาหารนี้</label>
                                                        <table class="datatable-menu table table-striped table-bordered">
                                                            <thead>
                                                            <tr>
                                                                <th style="text-align:center;">ชื่อเมนูอาหาร</th>
                                                                <th style="text-align:center;">ราคา</th>
                                                                <th style="text-align:center;">จำนวน</th>
                                                            </tr>
                                                            </thead>
                                                            <tbody style="text-align:center;">
                                                            <c:forEach items="${menus}" var="m">
                                                                <tr>
                                                                    <td>${m.menuNameTH} / ${m.menuNameEN}</td>
                                                                    <td data-order="${m.menuPrice}">
                                                                        <fmt:formatNumber value="${m.menuPrice}"
                                                                                          pattern="#,###,##0.00"></fmt:formatNumber>
                                                                        บาท
                                                                    </td>
                                                                    <td><input price="${m.menuPrice}"
                                                                               menuNo="${m.menuNo}" type="number"
                                                                               class="menusetamount"
                                                                               style="text-align:center;"
                                                                               value="0" min="0" max="1000" step="1"
                                                                               required>
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <div class="col-md-12" style="text-align:center;margin-top:20px;">
                                                        <div class="well" style="overflow: auto">
                                                            ราคารวมเมนูเดี่ยวทั้งหมด : <span
                                                                id="sum_menu_price">0.00</span> บาท
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label>ราคาชุดเมนูอาหารนี้ (บาท)</label>
                                                        <input type="number" min="0" step="0.25" class="form-control"
                                                               name="menuSetPrice"
                                                               placeholder="ราคาชุดเมนูอาหารนี้ (บาท)" required>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <!-- ปุ่มกดปิด (Close) ตรงส่วนล่างของ Modal -->
                                                    <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                                                        <div class="checkbox"
                                                             style="display:inline-block;margin-right:15px;">
                                                            <label>
                                                                <input type="checkbox" name="available"
                                                                       id="add_menuset_available"
                                                                       class="flat">
                                                                พร้อมจำหน่าย
                                                            </label>
                                                        </div>
                                                        <button type="submit" style="margin-left:5px;"
                                                                class="btn btn-success">ตกลง
                                                        </button>
                                                        <button type="button" class="btn btn-default"
                                                                data-dismiss="modal">
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
</div>
<jsp:include page="../_include/bottomenv.jsp"/>
<script>
    $(document).ready(function () {
        $("#showpic_menuset").click(function () {
            $("#add_menuset_pic").click();
        });

        $("#showpic_menuset_edit").click(function () {
            $("#edit_menuset_pic").click();
        });

        $("#add_menuset_pic").change(function () {
            if ($("#add_menuset_pic").val() == '') {
                $("#showpic_menuset").attr('src', '../images/default_upload_image.png');
            }
        });

        $("#edit_menuset_pic").change(function () {
            if ($("#edit_menuset_pic").val() == '') {
                $("#showpic_menuset_edit").attr('src', '../images/default_upload_image.png');
            }
        });

        $(".datatable-menu").DataTable({
            columnDefs: [
                {orderable: false, targets: [-1]}
            ]
        });

        refresh_table();
    });

    $(".menusetamount").on('change keyup', function () {
        var sum_menu_price = 0;
        $(".menusetamount").each(function () {
            sum_menu_price += $(this).attr('price') * $(this).val();
        });

        $("#sum_menu_price").html(sum_menu_price.toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ","));
    });

    function refresh_table() {
        $.ajax({
            type: "POST",
            url: "${contextPath}/menu/getmenusets",
            dataType: "json",
            success: function (json) {
                $("#menuset_thumbnail").empty();
                var data_array = [];
                var price = 0;
                for (var i = 0; i < json.length; i++) {
                    var obj = json[i];
                    var div = '<div class="col-md-6 col-sm-6 col-xs-12">\
                            <div class="thumbnail">\
                            <div class="col-md-6 image view view-first" style="height: 100%;">\
                            <img style="width: 100%; display: block;" src="../images/menuset/' + obj.menuSetPicPath + '" alt="image"/>\
                            </div>\
                            <div class="col-md-6 caption" style="height: 100%;color:#73879C">\
                            <div class="col-md-12" style=";font-weight:bold;white-space:nowrap;overflow:hidden;text-overflow: ellipsis;cursor:pointer;">' + obj.menuSetNameTH + ' / ' + obj.menuSetNameEN + '</div>\
                            <div class="col-md-12 foodDesc">\
                            <div>\
                            Test <br>\
                            Test <br>\
                            Test <br>\
                            Test <br>\
                            Test <br>\
                            Test <br>\
                            Test <br>\
                            Test <br>\
                            </div>\
                            </div>\
                            <div class="col-md-6"> <span style="font-weight:bold;">ราคา</span> ' + obj.menuSetPrice.toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ",") + ' บาท</div>\
                            <div class="col-md-6" style="text-align:right;">\
                            <div class="panel_menuset">\
                            <a title="แก้ไข" data-toggle="modal" data-target="#editMenu" style="color:#73879C;cursor:pointer;margin-right:5px;">\
                            <i class="fa fa-pencil"></i></a>\
                            <a title="พร้อมจำหน่าย" style="color:#73879C;cursor:pointer;margin-right:5px;" onclick="change_available(' + obj.menuSetNo + ')">\
                            <i class="fa '+ (obj.available == true ? 'fa-eye' : 'fa-eye-slash') +'"></i></a>\
                            <a title="ลบ" style="color:#73879C;cursor:pointer;" onclick="del_menuset(' + obj.menuSetNo + ',\'' + obj.menuSetNameTH + '\')">\
                            <i class="fa fa-trash"></i></a>\
                            </div>\
                            </div>\
                            </div>\
                            </div>\
                            </div>';

                    $("#menuset_thumbnail").append(div);
                }
            }
        });
    }

    $("#add_menuset").submit(function () {
        var formdata = new FormData($("#add_menuset")[0]);
        var menuamounts = '[';
        $(".menusetamount").each(function () {
            var key = $(this).attr('menuNo');
            var value = $(this).val();
            menuamounts += '{' + key + ':' + value + '}';
        });
        menuamounts += ']';
        formdata.append('menuamounts', menuamounts);
        $.ajax({
            type: "POST",
            data: formdata,
            enctype: 'multipart/form-data',
            cache: false,
            contentType: false,
            processData: false,
            url: "${contextPath}/menu/managemenuset",
            success: function (result) {
                swal("สำเร็จ", "ชุดเมนู " + $("#add_menuset_nameTH").val() + " ถูกเพิ่มเรียบร้อยแล้ว", "success");
                $("#add_menuset")[0].reset();
                $("#addMenuSet").modal('toggle');
                $("#showpic_menuset").attr('src', '../images/default_upload_image.png');
                $("#sum_menu_price").html('0.00');
                $("#add_menuset_available").parent().removeClass('checked');
                $("#add_menuset_available").attr('checked', false);
                refresh_table();
            }, error: function (result) {
                swal("ไม่สำเร็จ", "ชื่อภาษาไทยหรืออังกฤษอาจซ้ำ กรุณาลองใหม่ในภายหลัง", "error");
            }
        });

        return false;
    });


    <%--$("#edit_menuset").submit(function () {--%>
    <%--var object = $("#edit_menuset").serialize();--%>
    <%--$.ajax({--%>
    <%--type: "POST",--%>
    <%--data: object,--%>
    <%--contentType: false,--%>
    <%--processData: false,--%>
    <%--url: "${contextPath}/menu/managemenu",--%>
    <%--success: function (result) {--%>
    <%--swal("สำเร็จ", "เมนู " + $("#add_menuset").val() + " ถูกแก้ไขเรียบร้อยแล้ว", "success");--%>
    <%--$("#edit_menuset")[0].reset();--%>
    <%--$("#editMenuSet").modal('toggle');--%>
    <%--refresh_table();--%>
    <%--}, error: function (result) {--%>
    <%--swal("ไม่สำเร็จ", "ชื่อภาษาไทยหรืออังกฤษอาจซ้ำ กรุณาลองใหม่ในภายหลัง", "error");--%>
    <%--}--%>
    <%--});--%>

    <%--return false;--%>
    <%--});--%>

    <%--function set_menuset(menuSetNo) {--%>
    <%--$.ajax({--%>
    <%--type: "PUT",--%>
    <%--url: "${contextPath}/menu/getmenu/" + menuNo,--%>
    <%--dataType: "json",--%>
    <%--success: function (result) {--%>
    <%--$("#hiddenmenuno").val(result.menuSetNo);--%>
    <%--$("#edit_menuset_nameTH").val(result.menuSetNameTH);--%>
    <%--$("#edit_menuset_nameEN").val(result.menuSetNameEN);--%>
    <%--$("#edit_menuset_desc").val(result.menuSetDesc);--%>
    <%--$("#edit_menuset_price").val(result.menuSetPrice.toFixed(2));--%>
    <%--$("#edit_menuset_available").val(result.menuSetAvailable);--%>
    <%--$("#edit_menu_stock_cat").val(result.menuCatNo);--%>
    <%--$("#edit_menu_available").attr('checked', result.available);--%>
    <%--//                $("#edit_menu_pic").val(result.menuPicPath);--%>
    <%--}--%>
    <%--});--%>

    <%--}--%>

    function del_menuset(menuSetNo, menuSetNameTH) {
        console.log('in delmenu');
        swal({
                title: "ยืนยันการลบ " + menuSetNameTH,
                text: "เมื่อยืนยัน คุณจะไม่สามารถนำข้อมูล " + menuSetNameTH + " กลับมาได้",
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
                    url: "${contextPath}/menu/delmenuset/" + menuSetNo,
                    success: function (json) {
                        swal("สำเร็จ", menuSetNameTH + " ถูกลบเรียบร้อยแล้ว", "success");
                        console.log('success');
                        refresh_table();
                        console.log('refresh success');
                    },
                    error: function (json) {
                        swal("ไม่สำเร็จ", "เซิร์ฟเวอร์อาจมีปัญหา", "error");
                    }
                });
            });
    }

    function change_available(menusetno) {
        $.ajax({
            type: "POST",
            data: {menusetno: menusetno},
            url: "${contextPath}/menu/changemenusetavailable",
            success: function (result) {
                refresh_table();
            }, error: function (result) {
                swal("ไม่สำเร็จ", "กรุณาลองใหม่ภายหลัง", "error");
            }
        });
    }
</script>
</body>
</html>