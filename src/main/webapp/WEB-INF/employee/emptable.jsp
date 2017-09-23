<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%@ page import="com.springoeb.system.model.Role" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>ตารางการทำงาน</title>

    <jsp:include page="../_include/topenv.jsp"/>
    <link href="${contextPath}/vendors/fullcalendar/dist/fullcalendar.css" rel="stylesheet">
    <link href="${contextPath}/vendors/fullcalendar/dist/fullcalendar.print.css" rel="stylesheet" media="print">
</head>

<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <jsp:include page="../_include/navbar.jsp"/>
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
            </div>
            <div class="modal-body">
                <form class="form-horizontal form-label-left input_mask" id="table_add"
                      action="${contextPath}/employee/managetable">
                    <input type="hidden" id="hiddendate_1" name="date">
                    <div class="form-group" id="addworkfield">
                        <div class="col-md-12" style="margin-bottom:2vh;">
                            <a class="btn btn-success btn-sm" id="addworkfieldbtn">
                                <i class="fa fa-plus-circle"></i>
                                &nbsp;เพิ่มรายการ
                            </a>
                        </div>
                        <div style="clear:both">
                            <div class="col-md-4 col-sm-3 col-xs-3 form-group has-feedback">
                                <label class="required">ชื่อพนักงาน</label>
                                <select name="empNo" class="form-control" required>
                                    <c:forEach items="${employees}" var="e">
                                        <option value="${e.empNo}">${e.empName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-4 col-sm-3 col-xs-3 form-group has-feedback">
                                <label class="required">ตำแหน่ง</label>
                                <select name="empPosNo" class="form-control" required>
                                    <c:forEach items="${employeePositions}" var="ep">
                                        <option value="${ep.empPosNo}">${ep.empPosName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="btn-group col-md-3" data-toggle="buttons">
                                <label class="required">ช่วงเวลาทำงาน</label>
                                <select name="workTime" class="form-control" required>
                                    <option value="00:00:00">เช้า</option>
                                    <option value="13:00:00">บ่าย</option>
                                    <option value="18:00:00">ทั้งวัน</option>
                                </select>
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
    <div class="modal-dialog modal-lg">
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
                        <div class="col-md-4 col-sm-3 col-xs-3 form-group has-feedback">
                            <label class="required">ชื่อพนักงาน</label>
                            <select name="empNo" class="form-control" id="empNo_edit" required>
                                <c:forEach items="${employees}" var="e">
                                    <option value="${e.empNo}">${e.empName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-md-4 col-sm-3 col-xs-3 form-group has-feedback">
                            <label class="required">ตำแหน่ง</label>
                            <select name="empPosNo" class="form-control" id="empPosNo_edit" required>
                                <c:forEach items="${employeePositions}" var="ep">
                                    <option value="${ep.empPosNo}">${ep.empPosName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="btn-group col-md-3" data-toggle="buttons">
                            <label class="required">ช่วงเวลาทำงาน</label>
                            <select name="workTime" class="form-control" id="time_edit" required>
                                <option value="00:00:00">เช้า</option>
                                <option value="13:00:00">บ่าย</option>
                                <option value="18:00:00">ทั้งวัน</option>
                            </select>
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

<jsp:include page="../_include/bottomenv.jsp"/>

<!-- FullCalendar -->
<script src="${contextPath}/vendors/moment/min/moment.min.js"></script>
<script src="${contextPath}/vendors/fullcalendar/dist/fullcalendar.js"></script>

<%--<!-- Custom Theme Scripts -->--%>
<%--<script src="${contextPath}/build/js/custom.js"></script>--%>

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
        title: (sh < 13 ? '[เช้า] ' : sh < 18 ? '[บ่าย] ' : '[ทั้งวัน] ') + ' ... ' + '${et.employee.empName}' + ' (' + empposname + ')',
        start: new Date(y, m, d, sh, sm),
        end: new Date(y, m, d, eh, em),
        empNo: ${et.employee.empNo},
        empPosNo: ${et.employeePosition.empPosNo},
        empTimeNo: ${et.empTimeNo},
        textColor: '${et.employee.fontColor}',
        color: '${et.employee.bgColor}'
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
            timeFormat: ' ',
            header: {
                left: 'prev,next today',
                center: 'title',
                // right: 'month,agendaWeek,agendaDay,listMonth'
                right: 'month'
            },
            firstDay: 1,
            selectable: true,
//            eventLimit: true,
            selectHelper: true,
            select: function (start, end, allDay) {
                <c:if test="${branchUser.roleNo == Role.MANAGER}">
                $('#fc_create').click();
                </c:if>
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
            },
            <c:if test="${branchUser.roleNo == Role.MANAGER}">
            eventClick: function (calEvent, jsEvent, view) {
                $('#fc_edit').click();
                $('#title2').val(calEvent.title);
                $("#empNo_edit").val(calEvent.empNo);
                $("#empPosNo_edit").val(calEvent.empPosNo);
                $("#time_edit").val(calEvent.start._d.getHours() < 13 ? '00:00:00' : '13:00:00');
                $("#hidden_empTimeNo_edit").val(calEvent.empTimeNo);
                $("#hidden_date_edit").val(calEvent.start._d.getFullYear() + "-" + (calEvent.start._d.getMonth() + 1) + "-" + calEvent.start._d.getDate());
                $("#del_link").attr('href', '${contextPath}/employee/deletetable/' + calEvent.empTimeNo);
                categoryClass = $("#event_type").val();
                calendar.fullCalendar('unselect');
            },
            </c:if>
            editable: false,
            events: events
        });
    };

    var wrapper = $("#addworkfield");
    var add_button = $("#addworkfieldbtn");
    var work_field = '<div style="clear:both;" class="removable_div">' +
        '<div class="col-md-4 col-sm-3 col-xs-3 form-group has-feedback">' +
        '<select name="empNo" class="form-control" required>' +
        <c:forEach items="${employees}" var="e">
        '<option value="${e.empNo}">${e.empName}</option>' +
        </c:forEach>
        '</select>' +
        '</div>' +
        '<div class="col-md-4 col-sm-3 col-xs-3 form-group has-feedback">' +
        '<select name="empPosNo" class="form-control" required>' +
        <c:forEach items="${employeePositions}" var="ep">
        '<option value="${ep.empPosNo}">${ep.empPosName}</option>' +
        </c:forEach>
        '</select>' +
        '</div>' +
        '<div class="btn-group col-md-3" data-toggle="buttons">' +
        '<select name="workTime" class="form-control" required>' +
        '<option value="00:00:00">เช้า</option>' +
        '<option value="13:00:00">บ่าย</option>' +
        '<option value="18:00:00">ทั้งวัน</option>' +
        '</select>' +
        '</div>' +
        '<div class="col-md-1 col-sm-1 col-xs-1">' +
        '<a style="cursor:pointer" class="removeworkfieldbtn"><i class="fa fa-trash"></i></a>' +
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
