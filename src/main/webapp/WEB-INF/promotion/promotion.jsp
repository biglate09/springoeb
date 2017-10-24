<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="com.springoeb.promotion.model.Promotion" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../_include/topenv.jsp"/>
    <title>จัดการโปรโมชั่นเมนูอาหาร</title>
    <link href="${contextPath}/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
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
                            <h4>โปรโมชั่นเมนูอาหาร</h4>
                        </div>
                        <div class="x_content">
                            <div class="col-md-4" style="padding:0px;">
                                <p>
                                    <a data-toggle="modal" data-target="#promotion_modal"
                                       class="btn btn-success btn-sm"><i class="fa fa-plus-circle"></i>&nbsp;
                                        เพิ่มโปรโมชั่น</a>
                                </p>
                            </div>
                            <div class="col-md-4 col-md-offset-4 form-group" style="padding:0px;">
                                <input type="text" class="form-control" id="myInput"
                                       onkeyup="filterCard()" placeholder="ค้นหาด้วยชื่อโปรโมชั่น...">
                                <span class="fa fa-search form-control-feedback right"
                                      aria-hidden="true"></span>
                            </div>

                            <div id="promotion_thumbnail" style="clear:both">
                            </div>

                            <div id="error_show">
                            </div>

                            <!--Add Or Edit Modal-->
                            <div class="modal fade" id="promotion_modal" role="dialog">
                                <div class="modal-dialog">
                                    <!-- เนือหาของ Modal ทั้งหมด -->
                                    <div class="modal-content modal-body-test" style="overflow-y:hidden;">
                                        <!-- ส่วนหัวของ Modal -->
                                        <div class="modal-header">
                                            <!-- ปุ่มกดปิด (X) ตรงส่วนหัวของ Modal -->
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">จัดการโปรโมชั่น</h4>
                                        </div>
                                        <!-- ส่วนเนื้อหาของ Modal -->
                                        <div class="modal-body">
                                            <form class="form-horizontal form-label-left input_mask"
                                                  id="managePromotion" enctype="multipart/form-data">
                                                <input type="hidden" name="promotionNo" id="promotionNo">
                                                <div class="form-group">
                                                    <img class="col-md-offset-3 col-sm-offset-3 col-md-6 col-sm-6 col-xs-12 img-resize"
                                                         id="promotionPicture"
                                                         style="margin-bottom:20px;cursor:pointer;"
                                                         height="auto"
                                                         width="414"
                                                         src="../images/default_upload_image.png"/>
                                                    <div class="col-md-offset-3 col-sm-offset-3 col-md-6 col-sm-6 col-xs-12 has-feedback"
                                                         style="margin-bottom: 12px">
                                                        <input type="file" class="form-control" name="promotionPicPath"
                                                               id="promotionPicPath" accept="image/*"
                                                               onchange="document.getElementById('promotionPicture').src = window.URL.createObjectURL(this.files[0])"
                                                               placeholder="อัพโหลดรูปภาพ">
                                                    </div>

                                                    <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                                        <label class="required">ชื่อโปรโมชั่นภาษาไทย</label>
                                                        <input type="text" class="form-control" name="promotionNameTH"
                                                               id="promotionNameTH"
                                                               placeholder="ชื่อโปรโมชั่นภาษาไทย" required>
                                                        <span class="fa fa-pencil form-control-feedback right"
                                                              aria-hidden="true"></span>
                                                    </div>
                                                    <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                                        <label class="required">ชื่อโปรโมชั่นภาษาอังกฤษ</label>
                                                        <input type="text" class="form-control" name="promotionNameEN"
                                                               id="promotionNameEN"
                                                               placeholder="ชื่อโปรโมชั่นภาษาอังกฤษ" required>
                                                        <span class="fa fa-pencil form-control-feedback right"
                                                              aria-hidden="true"></span>
                                                    </div>
                                                    <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                                        <label class="required">วันเริ่มต้นโปรโมชั่น</label>
                                                        <input type="text" class="form-control date" name="fromDate"
                                                               id="fromDate"
                                                               placeholder="วันเริ่มต้นโปรโมชั่น" required>
                                                        <span class="fa fa-clock-o form-control-feedback right"
                                                              aria-hidden="true"></span>
                                                    </div>
                                                    <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                                        <label class="required">วันสิ้นสุดโปรโมชั่น</label>
                                                        <input type="text" class="form-control date" name="toDate"
                                                               id="toDate"
                                                               placeholder="วัดสิ้นสุดโปรโมชั่น" required>
                                                        <span class="fa fa-clock-o form-control-feedback right"
                                                              aria-hidden="true"></span>
                                                    </div>
                                                    <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                                        <label class="required">ลดราคาตามวันในสัปดาห์</label>
                                                        <select name="day" id="day" class="form-control" required>
                                                            <option value="EVE" selected>ทุกวัน</option>
                                                            <option value="${Promotion.MONDAY}">เฉพาะวันจันทร์</option>
                                                            <option value="${Promotion.TUESDAY}">เฉพาะวันอังคาร</option>
                                                            <option value="${Promotion.WEDNESDAY}">เฉพาะวันพุธ</option>
                                                            <option value="${Promotion.THURSDAY}">เฉพาะวันพฤหัสบดี
                                                            </option>
                                                            <option value="${Promotion.FRIDAY}">เฉพาะวันศุกร์</option>
                                                            <option value="${Promotion.SATURDAY}">เฉพาะวันเสาร์</option>
                                                            <option value="${Promotion.SUNDAY}">เฉพาะวันอาทิตย์</option>
                                                        </select>
                                                    </div>
                                                    <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                                        <label class="required">เปอร์เซ็นต์ในการลดราคา (%)</label>
                                                        <input type="number" min="0.01" step="0.01" max="100"
                                                               class="form-control" name="discount"
                                                               id="discount"
                                                               placeholder="ใส่เปอร์เซ็นต์ในการลดราคา 0 - 100"
                                                               required>
                                                        <span class="fa fa-percent form-control-feedback right"
                                                              aria-hidden="true"></span>
                                                    </div>
                                                    <div class="col-md-12 col-sm-12 col-xs-12 form-group has-feedback">
                                                        <label>รายละเอียดของโปรโมชั่น</label>
                                                        <textarea rows="4" cols="50" class="form-control"
                                                                  name="promotionDesc"
                                                                  id="promotionDesc"
                                                                  placeholder="รายละเอียด"></textarea>
                                                    </div>
                                                    <div class="col-md-12">
                                                        <label>เลือกหมวดหมู่เมนูอาหารที่เข้าร่วมโปรโมชั่น</label>
                                                        <table class="table table-striped table-bordered bulk_action1"
                                                               id="datatable-menugroup">
                                                            <thead>
                                                            <tr>
                                                                <th style="text-align:center;">
                                                                    <input type="checkbox" id="check-all-1"
                                                                           class="flat">
                                                                </th>
                                                                <th style="text-align:center;">
                                                                    ชื่อหมวดหมู่เมนูอาหาร
                                                                </th>
                                                                <th style="text-align:center;">
                                                                    ประเภทอาหาร
                                                                </th>
                                                            </tr>
                                                            </thead>
                                                            <tbody style="text-align:center;">
                                                            <c:forEach items="${menuGroups}" var="mg">
                                                                <tr>
                                                                    <td>
                                                                        <input type="checkbox" class="flat"
                                                                               name="table_records"
                                                                               value="${mg.menuGroupNo}">
                                                                    </td>
                                                                    <td>${mg.menuGroupNameTH}
                                                                        / ${mg.menuGroupNameEN}</td>
                                                                    <td>
                                                                            ${mg.menuCategory.menuCatName}
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <!-- ปุ่มกดปิด (Close) ตรงส่วนล่างของ Modal -->
                                                    <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                                                        <%--<label style="margin-right:15px;">--%>
                                                            <%--<input type="checkbox" name="available"--%>
                                                                   <%--id="available"--%>
                                                                   <%--class="flat">--%>
                                                            <%--พร้อมให้บริการ--%>
                                                        <%--</label>--%>
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
                            <%--modal for add--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../_include/bottomenv.jsp"/>
<script src="${contextPath}/vendors/moment/min/moment.min.js"></script>
<script src="${contextPath}/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
<script>
    $(document).ready(function () {
        $('.date').daterangepicker({
                locale: 'DD-MM-YYYY',
                singleDatePicker: true,
                showDropdowns: true
            }
        );

        var addfirsttime = true;

        $("#promotion_modal").on('shown.bs.modal', function () {
            if (addfirsttime) {
                addfirsttime = false;
                $("#datatable-menugroup").DataTable({
                    scrollY: "40vh",
                    paging: false,
                    order: [[2, "desc"]],
                    columnDefs: [
                        {orderable: false, targets: [0]}
                    ]
                });
            }
        });

        $("#promotionPicture").click(function () {
            $("#promotionPicPath").click();
        });

        $("#promotionPicPath").change(function () {
            if ($(this).val() == '') {
                $("#promotionPicture").attr('src', '../images/default_upload_image.png');
            }
        });

        refresh_table();
    });

    $('.modal').on('hidden.bs.modal', function () {
        reset_field();
    });

    function reset_field() {
        $("#managePromotion")[0].reset();
        $("#promotionPicture").attr('src', '../images/default_upload_image.png');
        $(".flat").parent().removeClass('checked');
        $(".flat").attr('checked', false);
    }

    function filterCard() {
        var input = $("#myInput").val();
        var hascard = false;
        $(".cardname").each(function () {
            if (($(this).text().toLowerCase()).indexOf(input.toLowerCase()) == -1) {
                $(this).parent().parent().parent().css('display', 'none');
            } else {
                $(this).parent().parent().parent().css('display', '');
                hascard = true;
            }
        });

        if (!hascard) {
            $("#error_show").html('\
                    <div class="well col-md-12" style="overflow: auto">\
                        <p style="text-align:center;font-weight:bold;">ไม่พบข้อมูลโปรโมชั่น' + (input == '' ? '' : 'ด้วยคำค้นหา ' + '"' + input + '"') + '</p>\
                    </div>\
                    ');
        } else {
            $("#error_show").html('');
        }
    }

    function set_promotion(promotionNo){
        $.ajax({
            type: "PUT",
            url: "${contextPath}/promotion/getpromotion/" + promotionNo,
            dataType: "json",
            success: function (promo) {
                $("#promotionNameTH").val(promo.promotionNameTH);
                $("#promotionNameEN").val(promo.promotionNameEN);
                $("#fromDate").val(promo.fromDate.substr(8,2) + "-" + promo.fromDate.substr(5,2) + "-" +promo.fromDate.substr(0,4));
                $("#toDate").val(promo.toDate.substr(8,2) + "-" + promo.toDate.substr(5,2) + "-" +promo.toDate.substr(0,4));
                $("#day").val(promo.day);
                $("#discount").val(promo.discount);
                $("#promotionDesc").val(promo.promotionDesc);
                $("#promotionNo").val(promo.promotionNo);
                $("#promotionPicture").attr('src','../images/promotion/'+promo.promotionPicPath);
//                if(promo.available == true){
//                    $("#available").iCheck("check");
//                }

                var menugroups = promo.menuGroupPromotions;
                for(var i = 0 ; i < menugroups.length ; i++){
                    $("input[value="+menugroups[i].menuGroupNo+"]").iCheck("check");
                }
            }
        });
    }

    function del_promotion(promotionNo){
        swal({
                title: "ยืนยันการลบโปรโมชั่น",
                text: "เมื่อยืนยัน จะไม่สามารถนำข้อมูลกลับมาได้",
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
                    url: "${contextPath}/promotion/deletepromotion/" + promotionNo,
                    success: function (json) {
                        swal("สำเร็จ","โปรโมชั่นถูกลบเรียบร้อยแล้ว", "success");
                        refresh_table();
                    },
                    error: function (json) {
                        swal("ไม่สำเร็จ", "กรุณาลองใหม่อีกครั้ง", "error");
                    }
                });
            });
    }

    <%--function change_available(promotionno) {--%>
        <%--$.ajax({--%>
            <%--type: "POST",--%>
            <%--url: "${contextPath}/promotion/changeavailable/" + promotionno,--%>
            <%--dataType: "json",--%>
            <%--success: function (result) {--%>
                <%--swal("สำเร็จ", "เปลี่ยนเป็น " + (result.available == false ? 'ไม่' : '') + "พร้อมให้บริการ เรียบร้อยแล้ว", "success");--%>
                <%--refresh_table();--%>
            <%--}, error: function (result) {--%>
                <%--swal("ไม่สำเร็จ", "กรุณาลองใหม่ภายหลัง", "error");--%>
            <%--}--%>
        <%--});--%>
    <%--}--%>

    $("#managePromotion").submit(function () {
        $.ajax({
            type: "POST",
            data: new FormData($("#managePromotion")[0]),
            enctype: 'multipart/form-data',
            cache: false,
            contentType: false,
            processData: false,
            url: "${contextPath}/promotion/managepromotion",
            success: function (result) {
                swal("สำเร็จ", "โปรโมชั่นถูก"+($("#promotionNo").val() == '' ? 'เพิ่ม' : 'แก้ไข')+"เรียบร้อยแล้ว", "success");
                reset_field();
                $("#promotion_modal").modal('toggle');
                refresh_table();
            }, error: function (result) {
                swal("ไม่สำเร็จ", "ชื่อโปรโมชั่นอาจซ้ำ กรุณาลองใหม่ในภายหลัง", "error");
            }
        });
        return false;
    });

    function refresh_table() {
        $.ajax({
            type: "POST",
            url: "${contextPath}/promotion/getpromotions",
            dataType: "json",
            success: function (json) {
                $("#promotion_thumbnail").empty();
                if (json.length != 0) {
                    for (var i = 0; i < json.length; i++) {
                        var promotion = json[i];
                        var menugroup = promotion.menuGroupPromotions;
                        var menugroup_txt = "";
                        for(var j = 0; j < menugroup.length; j++){
                            menugroup_txt += "<span style='white-space:nowrap;overflow:hidden;text-overflow: ellipsis;'>" + menugroup[j].menuGroup.menuGroupNameTH + "</span><br>";
                        }
                        var div = '<div class="col-md-6 col-sm-6 col-xs-12">\
                            <div class="thumbnail">\
                            <div class="col-md-6 image view view-first" style="height:100%;">\
                            <img style="width: 100%; display: block;" src="' + (promotion.promotionPicPath == null ? ('../images/default_upload_image.png') : ('../images/promotion/' + promotion.promotionPicPath) ) + '" alt="image"/>\
                            <div class="mask">\
                            <p>' + (promotion.promotionDesc == null ? 'ไม่มีรายละเอียด' : promotion.promotionDesc) + '</p>\
                            <div class="tools tools-bottom" style="margin-top:200px;">\
                            </div>\
                            </div>\
                            </div>\
                            <div class="col-md-6 caption" style="height:100%;color:#73879C">\
                            <div class="col-md-12 cardname" data-toggle="modal" data-target="#promotion_modal" onclick="set_promotion(' + promotion.promotionNo + ')" style="font-weight:bold;white-space:nowrap;overflow:hidden;text-overflow: ellipsis;cursor:pointer;">' + promotion.promotionNameTH + ' / ' + promotion.promotionNameEN + '</div>\
                            <div class="col-md-12 foodDesc">\
                            <div>\
                            <p style="text-align:center;font-weight:bold;">รายละเอียดโปรโมชั่น</p>\
                            <span class="col-md-offset-1 col-md-4" style="font-weight:bold">ลดราคา </span> <span class="col-md-7">' + promotion.discount  + '%</span>\
                            <span class="col-md-offset-1 col-md-4" style="font-weight:bold">เริ่มต้น </span> <span class="col-md-7">' + promotion.fromDate  + '</span>\
                            <span class="col-md-offset-1 col-md-4" style="font-weight:bold">สิ้นสุด </span> <span class="col-md-7">' + promotion.toDate  + '</span>\
                            <span class="col-md-offset-1 col-md-4" style="font-weight:bold">วัน </span> <span class="col-md-7">' + (promotion.day == '${Promotion.MONDAY}' ? 'วันจันทร์' : promotion.day == '${Promotion.TUESDAY}' ? 'วันอังคาร' : promotion.day == '${Promotion.WEDNESDAY}' ? 'วันพุธ' : promotion.day == '${Promotion.THURSDAY}' ? 'วันพฤหัสบดี' : promotion.day == '${Promotion.FRIDAY}' ? 'วันศุกร์' : promotion.day == '${Promotion.SATURDAY}' ? 'วันเสาร์' : promotion.day == '${Promotion.SUNDAY}' ? 'วันอาทิตย์' : 'ทุกวัน')  + '</span>\
                            <p style="text-align:center;font-weight:bold;">------------------------------</p>\
                            <p style="text-align:center;font-weight:bold;">หมวดหมู่เมนูที่ร่วมโปรโมชั่น</p>\
                            <span class="col-md-offset-1 col-md-10" style="text-align:center;">\
                            '+ menugroup_txt +'\
                            </span>\
                            </div>\
                            </div>\
                            <div class="col-md-12" style="font-weight:bold;text-align:right;"> \
                            <a title="แก้ไข" style="color:#73879C;cursor:pointer;margin-right:5px;" data-toggle="modal" data-target="#promotion_modal" onclick="set_promotion(' + promotion.promotionNo + ')"><i class="fa fa-pencil"></i></a>' + '\
                            <a title="ลบ" onclick="del_promotion(' + promotion.promotionNo + ')" style="color:#73879C;cursor:pointer;"><i class="fa fa-trash"></i></a>' + '\
                            </div>\
                            </div>\
                            </div>\
                            </div>';

                        //<a title="โปรโมชั่นนี้' + (promotion.available == true ? '' : 'ไม่' ) + 'พร้อมให้บริการ คลิกเพื่อเปลี่ยน" onclick="change_available(' + promotion.promotionNo + ')" style="color:#73879C;cursor:pointer;margin-right:5px;"><i class="fa ' + (promotion.available == true ? 'fa-check-square-o' : 'fa-square-o' ) + '"></i></a>\
                        $("#promotion_thumbnail").append(div);
                        $("#error_show").html('');
                    }
                } else {
                    $("#error_show").html('\
                    <div class="well col-md-12" style="overflow: auto">\
                        <p style="text-align:center;font-weight:bold;"> ไม่พบข้อมูลโปรโมชั่น </p>\
                    </div>\
                    ');
                }
            }
        });
    }
</script>
</body>
</html>