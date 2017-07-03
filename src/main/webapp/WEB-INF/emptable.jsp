<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>ตารางการทำงาน</title>

    <!-- Bootstrap -->
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- FullCalendar -->
    <link href="../vendors/fullcalendar/dist/fullcalendar.css" rel="stylesheet">
    <link href="../vendors/fullcalendar/dist/fullcalendar.print.css" rel="stylesheet" media="print">

    <!-- Custom styling plus plugins -->
    <link href="../build/css/custom.min.css" rel="stylesheet">
</head>

<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <jsp:include page="include/navbar.jsp"/>
    </div>

    <!-- page content -->
    <div class="right_col" role="main">
        <div class="">
            <div class="page-title">
                <div class="title_right">
                    <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                    </div>
                </div>
            </div>

            <div class="clearfix"></div>

            <div class="row">
                <div class="col-md-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h4>ตารางการทำงาน</h4>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <div id="employee-calendar"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /page content -->

</div>

<!-- calendar modal -->
<div id="CalenderModalNew" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">เพิ่มตารางการทำงานของวันที่ <span id="modal_date"></span></h4>
                <a class="btn btn-success btn-sm" id="addworkfieldbtn">
                    <i class="fa fa-plus-circle"></i>
                    &nbsp;เพิ่มรายการ
                </a>
            </div>
            <div class="modal-body">
                <form class="form-horizontal form-label-left input_mask"
                      action="${contextPath}/employee/managetable" method="POST">
                    <input type="hidden" id="hiddendate_1" name="date">
                    <div class="form-group" id="addworkfield">
                        <div>
                            <div class="col-md-3 col-sm-3 col-xs-3 form-group has-feedback" style="width:23%">
                                <select name="empNo" class="form-control" required>
                                    <c:forEach items="${employees}" var="e">
                                        <option value="${e.empNo}">${e.empName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-3 form-group has-feedback" style="width:23%">
                                <select name="empPosNo" class="form-control" required>
                                    <c:forEach items="${employeePositions}" var="ep">
                                        <option value="${ep.empPosNo}">${ep.empPosName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-3 form-group has-feedback" style="width:20%">
                                <input type="time" class="form-control" placeholder="เวลาเริ่มงาน" name="timeStart"
                                       required>
                                <span class="fa fa-hourglass form-control-feedback right"
                                      aria-hidden="true"></span>
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-3 form-group has-feedback" style="width:20%">
                                <input type="time" class="form-control"
                                       placeholder="เวลาสิ้นสุดงาน" name="timeEnd" required>
                                <span class="fa fa-hourglass-end form-control-feedback right"
                                      aria-hidden="true"></span>
                            </div>
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
<div id="CalenderModalEdit" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel2">แก้ไขตารางการทำงาน</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal calender" role="form"
                      action="${contextPath}/employee/managetable" method="POST">
                    <input type="hidden" name="empTimeNo" id="hidden_empTimeNo_edit">
                    <input type="hidden" name="date" id="hidden_date_edit">
                    <div class="form-group" style="padding: 5px 20px;">
                        <div class="col-md-6 form-group has-feedback">
                            <select name="empNo" class="form-control" id="empNo_edit" required>
                                <c:forEach items="${employees}" var="e">
                                    <option value="${e.empNo}">${e.empName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-md-6 form-group has-feedback">
                            <select name="empPosNo" class="form-control" id="empPosNo_edit" required>
                                <c:forEach items="${employeePositions}" var="ep">
                                    <option value="${ep.empPosNo}">${ep.empPosName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-md-6 form-group has-feedback">
                            <input type="time" class="form-control" placeholder="เวลาเริ่มงาน" name="timeStart"
                                   id="timeStart_edit"
                                   required>
                            <span class="fa fa-hourglass form-control-feedback right"
                                  aria-hidden="true"></span>
                        </div>
                        <div class="col-md-6 form-group has-feedback">
                            <input type="time" class="form-control"
                                   placeholder="เวลาสิ้นสุดงาน" name="timeEnd" id="timeEnd_edit" required>
                            <span class="fa fa-hourglass-end form-control-feedback right"
                                  aria-hidden="true"></span>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <a id="del_link">
                            <button type="button" class="btn btn-danger">ลบ</button>
                        </a>
                        <button type="submit" class="btn btn-primary">ตกลง</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">ยกเลิก</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div id="fc_create" data-toggle="modal" data-target="#CalenderModalNew"></div>
<div id="fc_edit" data-toggle="modal" data-target="#CalenderModalEdit"></div>
<!-- /calendar modal -->

<!-- jQuery -->
<script src="../vendors/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="../vendors/fastclick/lib/fastclick.js"></script>
<!-- NProgress -->
<script src="../vendors/nprogress/nprogress.js"></script>
<!-- FullCalendar -->
<script src="../vendors/moment/min/moment.min.js"></script>
<script src="../vendors/fullcalendar/dist/fullcalendar.js"></script>

<!-- Custom Theme Scripts -->
<script src="../build/js/custom.js"></script>

</body>
<script>
    var events = [];
    <c:forEach items="${employeeTables}" var="et">
    var workDate = new Date('${et.date}');
    var y = workDate.getFullYear();
    var m = workDate.getMonth();
    var d = workDate.getDate();
    var timestart = '${et.timeStart}';
    var timeend = '${et.timeEnd}';
    var sh = timestart.substring(0, 2);
    var sm = timestart.substring(3, 5);
    var eh = timeend.substring(0, 2);
    var em = timeend.substring(3, 5);
    var empposname = '${et.employeePosition.empPosName}';
    var e = {
        title: '${et.employee.empName}' + ' (' + empposname + ')',
        start: new Date(y, m, d, sh, sm),
        end: new Date(y, m, d, eh, em),
        empNo: ${et.employee.empNo},
        empPosNo: ${et.employeePosition.empPosNo},
        empTimeNo: ${et.empTimeNo}
    };
    events.push(e);
    </c:forEach>

    /* CALENDAR */

    function init_calendar() {

        if (typeof ($.fn.fullCalendar) === 'undefined') {
            return;
        }

        var date = new Date(),
            d = date.getDate(),
            m = date.getMonth(),
            y = date.getFullYear(),
            started,
            categoryClass;

        var calendar = $('#employee-calendar').fullCalendar({
            timeFormat: 'HH.mm น.',
            header: {
                left: 'prev,next today',
                center: 'title',
                // right: 'month,agendaWeek,agendaDay,listMonth'
                right: 'month,listMonth'
            },
            selectable: true,
            selectHelper: true,
            select: function (start, end, allDay) {
                $('#fc_create').click();
                dateobj = start._d;

                date_d = (dateobj.getDate()) < 10 ? ("0" + dateobj.getDate()) : (dateobj.getDate());
                date_m = (dateobj.getMonth() + 1) < 10 ? ("0" + (dateobj.getMonth() + 1)) : (dateobj.getMonth() + 1);
                date_y = dateobj.getFullYear();

                switch (parseInt(date_m)) {
                    case 1:
                        format_month = 'มกราคม';
                        break;
                    case 2:
                        format_month = 'กุมภาพันธ์';
                        break;
                    case 3:
                        format_month = 'มีนาคม';
                        break;
                    case 4:
                        format_month = 'เมษายน';
                        break;
                    case 5:
                        format_month = 'พฤษภาคม';
                        break;
                    case 6:
                        format_month = 'มิถุนายน';
                        break;
                    case 7:
                        format_month = 'กรกฎาคม';
                        break;
                    case 8:
                        format_month = 'สิงหาคม';
                        break;
                    case 9:
                        format_month = 'กันยายน';
                        break;
                    case 10:
                        format_month = 'ตุลาคม';
                        break;
                    case 11:
                        format_month = 'พฤศจิกายน';
                        break;
                    case 12:
                        format_month = 'ธันวาคม';
                        break;
                }

                format_date = dateobj.getDate() + " " + format_month + " " + date_y;
                java_date = date_y + "-" + date_m + "-" + date_d;
                $("#modal_date").html(format_date);
                $("#hiddendate_1").val(java_date);


//                started = start;
//                ended = end;
//
//                $(".antosubmit").on("click", function () {
//                    var title = $("#title").val();
//                    if (end) {
//                        ended = end;
//                    }
//
//                    categoryClass = $("#event_type").val();
//
//                    if (title) {
//                        calendar.fullCalendar('renderEvent', {
//                                title: title,
//                                start: started,
//                                end: end,
//                                allDay: allDay
//                            },
//                            true // make the event "stick"
//                        );
//                    }
//
//                    $('#title').val('');
//
//                    calendar.fullCalendar('unselect');
//
//                    $('.antoclose').click();
//
//                    return false;
//                });
            },
            eventClick: function (calEvent, jsEvent, view) {
                $('#fc_edit').click();
                $('#title2').val(calEvent.title);

                $("#empNo_edit").val(calEvent.empNo);
                $("#empPosNo_edit").val(calEvent.empPosNo);
                $("#timeStart_edit").val((calEvent.start._d.getHours() < 10 ? "0" + calEvent.start._d.getHours() : calEvent.start._d.getHours()) + ":" + (calEvent.start._d.getMinutes() < 10 ? "0" + calEvent.start._d.getMinutes() : calEvent.start._d.getMinutes()));
                $("#timeEnd_edit").val((calEvent.end._d.getHours() < 10 ? "0" + calEvent.end._d.getHours() : calEvent.end._d.getHours()) + ":" + (calEvent.end._d.getMinutes() < 10 ? "0" + calEvent.end._d.getMinutes() : calEvent.end._d.getMinutes()));
                $("#hidden_empTimeNo_edit").val(calEvent.empTimeNo);
                $("#hidden_date_edit").val(calEvent.start._d.getFullYear() + "-" + (calEvent.start._d.getMonth() + 1) + "-" + calEvent.start._d.getDate());
                $("#del_link").attr('href','${contextPath}/employee/deletetable/'+calEvent.empTimeNo);
                categoryClass = $("#event_type").val();

//                $(".antosubmit2").on("click", function () {
//                    calEvent.title = $("#title2").val();
//
//                    calendar.fullCalendar('updateEvent', calEvent);
//                    $('.antoclose2').click();
//                });
                calendar.fullCalendar('unselect');
            },
            editable: false,
            events: events
        });
    };

    var wrapper = $("#addworkfield");
    var add_button = $("#addworkfieldbtn");
    var work_field = '<div>' +
        '<div class="col-md-3 col-sm-3 col-xs-3 form-group has-feedback" style="width:23%;">' +
        '<select name="empNo" class="form-control" required>' +
        <c:forEach items="${employees}" var="e">
        '<option value="${e.empNo}">${e.empName}</option>' +
        </c:forEach>
        '</select>' +
        '</div>' +
        '<div class="col-md-3 col-sm-3 col-xs-3 form-group has-feedback" style="width:23%;">' +
        '<select name="empPosNo" class="form-control" required>' +
        <c:forEach items="${employeePositions}" var="ep">
        '<option value="${ep.empPosNo}">${ep.empPosName}</option>' +
        </c:forEach>
        '</select>' +
        '</div>' +
        '<div class="col-md-3 col-sm-3 col-xs-3 form-group has-feedback" style="width:20%">' +
        '<input type="time" class="form-control" placeholder="เวลาเริ่มงาน" name="timeStart" required>' +
        '<span class="fa fa-hourglass form-control-feedback right" aria-hidden="true"></span>' +
        '</div>' +
        '<div class="col-md-3 col-sm-3 col-xs-3 form-group has-feedback" style="width:20%">' +
        '<input type="time" class="form-control" placeholder="เวลาสิ้นสุดงาน" name="timeEnd" required>' +
        '<span class="fa fa-hourglass-end form-control-feedback right" aria-hidden="true"></span>' +
        '</div>' +
        '<div class="col-md-1 col-sm-1 col-xs-1">' +
        '<a style="cursor:pointer" class="removeworkfieldbtn">remove</a>' +
        '</div>' +
        '</div>';

    $(add_button).click(function () {
        $(wrapper).append(work_field);
    });

    $(wrapper).on("click", ".removeworkfieldbtn", function () {
        $(this).parent('div').parent('div').remove();
    });
</script>
</html>
