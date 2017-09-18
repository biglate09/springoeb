<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../_include/topenv.jsp"/>
    <title>จัดการการจอง</title>
</head>
<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <jsp:include page="../_include/navbar.jsp"/>
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
                            <h4>จัดการการจอง</h4>
                        </div>
                        <div class="x_content">
                            <form action="#">
                                <div class="col-md-4" style="padding:0px;">
                                    <a data-toggle="modal" data-target="#addReservation"
                                       class="btn btn-success btn-sm"><i class="fa fa-plus-circle"></i>&nbsp;
                                        เพิ่มการจอง
                                    </a>
                                </div>
                                <div class="col-md-offset-1 col-md-2 well" style="overflow:auto;text-align:center;">
                                    <div class="checkbox">
                                        <input type="checkbox" value="true" id="today_input" class="flat" checked>&nbsp;
                                        <span>ข้อมูลลูกค้าที่จองวันนี้</span>
                                    </div>
                                </div>
                                <table id="datatable-reservation"
                                       class="table table-striped table-bordered bulk_action1">
                                    <thead>
                                    <tr>
                                        <%--<th style="text-align:center;width:20%;">ชื่อลูกค้า</th>--%>
                                        <th style="text-align:center;width:25%;">ลูกค้า</th>
                                        <th style="text-align:center;width:20%;">เบอร์โทรศัพท์</th>
                                        <th style="text-align:center;width:20%;">วัน / เวลาที่จอง</th>
                                        <th style="text-align:center;width:35%;">ตัวเลือก</th>
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
                <!-- Modal Content (ADD RESERVATION)-->
                <div class="modal fade" id="addReservation" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <!-- เนือหาของ Modal ทั้งหมด -->
                        <div class="modal-content">
                            <!-- ส่วนหัวของ Modal -->
                            <div class="modal-header">
                                <!-- ปุ่มกดปิด (X) ตรงส่วนหัวของ Modal -->
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">เพิ่มการจองใหม่</h4>
                            </div>
                            <!-- ส่วนเนื้อหาของ Modal -->
                            <div class="modal-body">
                                <form class="form-horizontal form-label-left input_mask" method="POST"
                                      id="add_reservation"
                                      modelAttribute="reservation">
                                    <div class="form-group">
                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                            <label class="required">ชื่อลูกค้า</label>
                                            <input type="text" class="form-control" name="userName"
                                                   placeholder="ชื่อลูกค้า" required>
                                            <span class="fa fa-user form-control-feedback right"
                                                  aria-hidden="true"></span>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                            <label class="required">จำนวนลูกค้า</label>
                                            <input type="number" class="form-control" name="numberOfPerson"
                                                   placeholder="จำนวนลูกค้า" required>
                                            <span class="fa fa-users form-control-feedback right"
                                                  aria-hidden="true"></span>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                            <label class="required">เบอร์โทรศัพท์</label>
                                            <input type="text" class="form-control" placeholder="เบอร์โทรศัพท์"
                                                   name="tel">
                                            <span class="fa fa-phone form-control-feedback right"
                                                  aria-hidden="true"></span>
                                        </div>
                                        <div class="col-md-3 col-sm-3 col-xs-12 form-group has-feedback">
                                            <label class="required">วันที่จอง</label>
                                            <input type="date" class="form-control" placeholder="วันที่จอง"
                                                   name="dateformat">
                                            <span class="fa fa-calendar form-control-feedback right"
                                                  aria-hidden="true"></span>
                                        </div>
                                        <div class="col-md-3 col-sm-3 col-xs-12 form-group has-feedback">
                                            <label class="required">เวลาที่จอง</label>
                                            <input type="time" class="form-control" placeholder="เวลาที่จอง"
                                                   name="timeformat">
                                            <span class="fa fa-clock-o form-control-feedback right"
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
                <!-- /Modal Content (ADD RESERVATION)-->

                <!-- Modal Content (EDIT RESERVATION)-->
                <div class="modal fade" id="editReservation" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <!-- เนือหาของ Modal ทั้งหมด -->
                        <div class="modal-content">
                            <!-- ส่วนหัวของ Modal -->
                            <div class="modal-header">
                                <!-- ปุ่มกดปิด (X) ตรงส่วนหัวของ Modal -->
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">แก้ไขการจองของ "<span id="display_client_name"></span>"</h4>
                            </div>
                            <!-- ส่วนเนื้อหาของ Modal -->
                            <div class="modal-body">
                                <form class="form-horizontal form-label-left input_mask" id="edit_reservation"
                                      method="POST" modelAttribute="reservation">
                                    <input type="hidden" name="reserveNo" id="hiddenreservno">
                                    <div class="form-group">
                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                            <label class="required">ชื่อลูกค้า</label>
                                            <input type="text" class="form-control" name="userName"
                                                   placeholder="ชื่อลูกค้า" required id="userName">
                                            <span class="fa fa-user form-control-feedback right"
                                                  aria-hidden="true"></span>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                            <label class="required">จำนวนลูกค้า</label>
                                            <input type="number" class="form-control" name="numberOfPerson"
                                                   placeholder="จำนวนลูกค้า" required id="numberOfPerson">
                                            <span class="fa fa-users form-control-feedback right"
                                                  aria-hidden="true"></span>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                            <label class="required">เบอร์โทรศัพท์</label>
                                            <input type="text" class="form-control" id="telNo"
                                                   placeholder="เบอร์โทรศัพท์" name="tel">
                                            <span class="fa fa-phone form-control-feedback right"
                                                  aria-hidden="true"></span>
                                        </div>
                                        <div class="col-md-3 col-sm-3 col-xs-12 form-group has-feedback">
                                            <label class="required">วันที่จอง</label>
                                            <input type="date" class="form-control" placeholder="วันที่จอง"
                                                   name="dateformat" id="date">
                                            <span class="fa fa-calendar form-control-feedback right"
                                                  aria-hidden="true"></span>
                                        </div>
                                        <div class="col-md-3 col-sm-3 col-xs-12 form-group has-feedback">
                                            <label class="required">เวลาที่จอง</label>
                                            <input type="time" class="form-control" placeholder="เวลาที่จอง"
                                                   name="timeformat" id="time">
                                            <span class="fa fa-clock-o form-control-feedback right"
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
                <!-- /Modal Content (EDIT RESERVATION)-->
            </div>
        </div>
    </div>
</div>
<jsp:include page="../_include/bottomenv.jsp"/>
</body>
<script>
    $(document).ready(function () {
        $("#datatable-reservation").DataTable({
            order: [[2, "desc"]],
            columnDefs: [
                {orderable: false, targets: [-1]}
            ],
            columns: [
                {
                    data: {
                        _: 'numberOfPerson.display',
                        sort: 'numberOfPerson.order'
                    }
                },
                {
                    data: 'tel'
                },
                {
                    data: {
                        _: 'dateTime.display',
                        sort: 'dateTime.order'
                    }
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
            url: "${contextPath}/table/getreservations/"+$('#today_input').is(':checked'),
            dataType: "json",
            success: function (json) {
                var data_array = [];
                for (var iterator = 0; iterator < json.length; iterator++) {
                    var obj = json[iterator];
                    ///////////////////
                    var numberOfPerson_order = obj.numberOfPerson + "";
                    for (var i = numberOfPerson_order.length; i < 10; i++) {
                        numberOfPerson_order = "0" + numberOfPerson_order;
                    }
                    var date = new Date(obj.date + " " + obj.time);
                    var datetime_display = (date.getDate() < 10 ? '0' + date.getDate() : date.getDate()) + '/' + ((date.getMonth() + 1) < 10 ? '0' + (date.getMonth() + 1) : date.getMonth()) + '/' + date.getFullYear();
                    datetime_display += ' ' + date.getHours() + '.' + (date.getMinutes() < 10 ? '0' + date.getMinutes() : date.getMinutes()) + ' น.';
                    var datetime_order = '' + date.getFullYear() + ((date.getMonth() + 1) < 10 ? '0' + (date.getMonth() + 1) : (date.getMonth() + 1)) + (date.getDate() < 10 ? '0' + date.getDate() : date.getDate()) + (date.getHours() < 10 ? "0" + date.getHours() : date.getHours()) + (date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes());
                    ///////////////////
                    var data_refresh = {
                        numberOfPerson: {
                            display: obj.userName + " (" + obj.numberOfPerson + " คน)",
                            order: numberOfPerson_order
                        },
                        tel: obj.tel,
                        dateTime: {
                            display: datetime_display,
                            order: datetime_order
                        },
                        option: '<a onclick = "setReservation(' + obj.reserveNo + ')" class = "btn btn-warning btn-sm" data-toggle = "modal" data-target = "#editReservation"> <i class = "fa fa-pencil"> </i> &nbsp; แก้ไข </a>' +
                        '<a onclick = "delReservation(' + obj.reserveNo + ')") class = "btn btn-danger btn-sm"> <i class = "fa fa-trash"></i> &nbsp; ลบ </a>'
                    };
                    data_array.push(data_refresh);
                }

                $("#datatable-reservation").DataTable().clear();
                $("#datatable-reservation").DataTable().rows.add(data_array).draw(false);
            }
        });
    }

    function delReservation(reservationNo) {
        swal({
                title: "ยืนยันการลบการจองนี้",
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
                    url: "${contextPath}/table/delreservation/" + reservationNo,
                    success: function (json) {
                        swal("สำเร็จ", "ลบเรียบร้อยแล้ว", "success");
                        refresh_table();
                    },
                    error: function (json) {
                        swal("ไม่สำเร็จ", "กรุณาลองใหม่อีกครั้ง", "error");
                    }
                });
            });
    }

    function setReservation(reservationNo) {
        $.ajax({
            type: "PUT",
            url: "${contextPath}/table/getreservation/" + reservationNo,
            dataType: "json",
            success: function (reservation) {
                $("#display_client_name").html(reservation.userName);
                $("#userName").val(reservation.userName);
                $("#numberOfPerson").val(reservation.numberOfPerson);
                $("#telNo").val(reservation.tel);
                $("#date").val(reservation.date);
                $("#time").val(reservation.time);
                $("#hiddenreservno").val(reservation.reserveNo);
            }
        });
    }

    $("#add_reservation").submit(function () {
        $.ajax({
            type: "POST",
            data: $(this).serialize(),
            url: "${contextPath}/table/managereservation",
            success: function (result) {
                swal("สำเร็จ", "เพิ่มการจองเรียบร้อย", "success");
                $("#addReservation").modal('toggle');
                reset_field();
                refresh_table();
            }, error: function (result) {
                swal("ไม่สำเร็จ", "กรุณาลองใหม่อีกครั้ง", "error");
            }
        });
        return false;
    });

    $("#edit_reservation").submit(function () {
        $.ajax({
            type: "POST",
            data: $(this).serialize(),
            url: "${contextPath}/table/managereservation",
            success: function (result) {
                swal("สำเร็จ", "แก้ไขเรียบร้อยแล้ว", "success");
                $("#editReservation").modal('toggle');
                reset_field();
                refresh_table();
            }, error: function (result) {
                swal("ไม่สำเร็จ", "กรุณาลองใหม่อีกครั้ง", "error");
            }
        });
        return false;
    });

    $('.modal').on('hidden.bs.modal', function () {
        reset_field();
    });

    function reset_field() {
        $("#add_reservation")[0].reset();
    }

    $('#today_input').on('ifChanged', function(event){
        refresh_table();
    });
</script>
</html>