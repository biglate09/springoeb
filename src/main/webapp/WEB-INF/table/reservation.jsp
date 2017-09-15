<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../_include/topenv.jsp"/>
    <link href="../vendors/bootstrap-daterangepicker/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
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
                                <p>
                                    <a data-toggle="modal" data-target="#addReservation"
                                       class="btn btn-success btn-sm"><i class="fa fa-plus-circle"></i>&nbsp;
                                        เพิ่มการจอง
                                    </a>
                                </p>
                                <table id="datatable-reserv"
                                       class="table table-striped table-bordered bulk_action1">
                                    <thead>
                                    <tr>
                                        <th style="text-align:center;">ชื่อลูกค้า</th>
                                        <th style="text-align:center;">จำนวนลูกค้า</th>
                                        <th style="text-align:center;">เบอร์โทรศัพท์</th>
                                        <th style="text-align:center;">วัน / เวลาที่จอง</th>
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
                                <form class="form-horizontal form-label-left input_mask" id="add_table"
                                      modelAttribute="table">
                                    <div class="form-group">
                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                            <label class="required">ชื่อลูกค้า</label>
                                            <input type="text" class="form-control" name="clientName"
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
                                            <input type="text" class="form-control" id="" placeholder="เบอร์โทรศัพท์">
                                            <span class="fa fa-phone form-control-feedback right" aria-hidden="true"></span>
                                        </div>
                                        <div class="form-group">
                                            <label class="required">วันเวลาที่จอง</label>
                                            <div class="input-group date form_datetime col-md-6 col-sm-6 col-xs-12" data-date-format="dd MM yyyy - HH:ii p" data-link-field="dtp_input1">
                                                <input class="form-control" type="text" placeholder="วันเวลาที่จอง">
                                                <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                                            </div>
                                            <input type="hidden" id="dtp_input1" value="" /><br/>
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
                <div class="modal fade" id="editReserv" role="dialog">
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
                                <form class="form-horizontal form-label-left input_mask" id="edit_table"
                                      method="POST" modelAttribute="table">
                                    <input type="hidden" name="reservNo" id="hiddenreservno">
                                    <div class="form-group">
                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                            <label class="required">ชื่อลูกค้า</label>
                                            <input type="text" class="form-control" name="clientName"
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
                                            <input type="text" class="form-control" id="telNo" placeholder="เบอร์โทรศัพท์">
                                            <span class="fa fa-phone form-control-feedback right" aria-hidden="true"></span>
                                        </div>
                                        <div class="col-md-3 col-sm-3 col-xs-6 form-group has-feedback">
                                            <label class="required">วันที่จอง</label>
                                            <input type="date" id="workDate" class="form-control workdate"
                                                   name="workDate"
                                                   required>
                                            <span class="fa fa-calendar form-control-feedback right"
                                                  aria-hidden="true"></span>
                                        </div>
                                        <div class="col-md-3 col-sm-3 col-xs-6 form-group has-feedback">
                                            <label class="required">เวลาที่จอง</label>
                                            <input type="text" class="form-control" placeholder="hh:mm">
                                            <span class="fa fa-clock-o  form-control-feedback right" aria-hidden="true"></span>
                                        </div>

                                        <div class="col-md-4 col-sm-4 col-xs-4 form-group has-feedback" style="clear:both;">
                                            <select id="availableTable" name="availableTable" class="form-control" required>
                                                <option value="" disabled>เลือกโต๊ะที่จองได้ / จำนวนที่นั่ง</option>
                                                <option value=""></option>
                                            </select>
                                        </div>
                                        <div class="col-md-1 col-sm-1 col-xs-1">
                                            <a style="cursor:pointer" class="addReservField"><i class="fa fa-plus-circle"></i></a>
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
<!-- bootstrap-daterangepicker -->
<script src="../vendors/bootstrap-daterangepicker/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script src="../vendors/bootstrap-daterangepicker/bootstrap-datetimepicker.fr.js" charset="UTF-8"></script>
</body>
<script>
    $(document).ready(function () {
        $("#datatable-reserv").DataTable({
            order: [[0, "asc"]],
            columnDefs: [
                {orderable: false, targets: [-1]}
            ],
            columns: [
                {
                    data: 'clientName'
                },
                {
                    data: 'numberOfPerson'
                },
                {
                    data: 'telNo'
                },
                {
                    data: 'dateTime'
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
            url: "${contextPath}/",
            dataType: "json",
            success: function (json) {
                var data_array = [];
                for (var iterator = 0; iterator < json.length; iterator++) {
                    var mat_cat_obj = json[iterator];
                    var data_refresh = {
                        clientName: obj.reservNo,
                        numberOfPerson: obj.numberOfPerson,
                        telNo: obj.telNo,
                        dateTime: obj.date + ' ' + obj.time,
                        option: '<a onclick = "editReserv(' + obj.reservNo + ')" class = "btn btn-warning btn-sm" data-toggle = "modal" data-target = "#editMaterialCat"> <i class = "fa fa-pencil"> </i> &nbsp; แก้ไข </a>' +
                        '<a onclick = "delReserv(' + obj.reservNo + ',\'' + obj.reservNo +'\')") class = "btn btn-danger btn-sm"> <i class = "fa fa-trash"></i> &nbsp; ลบ </a>'
                    };
                    data_array.push(data_refresh);
                }

                $("#datatable-materialcategory").DataTable().clear();
                $("#datatable-materialcategory").DataTable().rows.add(data_array).draw(false);
            }
        });
    }
    $('.form_datetime').datetimepicker({
        //language:  'fr',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        forceParse: 0,
        showMeridian: 1
    });
    $('.form_date').datetimepicker({
        language:  'fr',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0
    });
    $('.form_time').datetimepicker({
        language:  'fr',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 1,
        minView: 0,
        maxView: 1,
        forceParse: 0
    });


</script>


</html>