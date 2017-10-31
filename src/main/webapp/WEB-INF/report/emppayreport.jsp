<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../_include/topenv.jsp"/>
    <title>ภาพรวมค่าจ้างพนักงาน</title>
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
                            <div class="col-md-7"><h2>ค่าจ้างพนักงาน</h2></div>
                            <div class="col-md-2">
                                <select name="year" class="form-control menuchange" id="empyear">
                                    <option value="" disabled>ปี พ.ศ.</option>
                                    <option value="0">ทุกปี</option>
                                    <option value="2017">2560</option>
                                </select>
                            </div>
                            <div class="col-md-2">
                                <select name="month" class="form-control menuchange" id="empmonth" disabled>
                                    <option value="" disabled>เดือน</option>
                                    <option value="0">ทุกเดือน</option>
                                    <option value="1">มกราคม</option>
                                    <option value="2">กุมภาพันธ์</option>
                                    <option value="3">มีนาคม</option>
                                    <option value="4">เมษายน</option>
                                    <option value="5">พฤษภาคม</option>
                                    <option value="6">มิถุนายน</option>
                                    <option value="7">กรกฎาคม</option>
                                    <option value="8">สิงหาคม</option>
                                    <option value="9">กันยายน</option>
                                    <option value="10">ตุลาคม</option>
                                    <option value="11">พฤศจิกายน</option>
                                    <option value="12">ธันวาคม</option>
                                </select>
                            </div>

                            <ul class="nav navbar-right panel_toolbox" style="min-width: 0px">
                                <li><a class="collapse-link"><i class="fa fa-chevron-up right"></i></a>
                                </li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <div id="echart_line_emppay" style="height:400px;"></div>
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
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/echarts-all-3.js"></script>
<script>
    //echart Pie
    //***********CONFIG BY BIGHEAD*************//
    var limit_of_paid = 10;
    var emp_data_legends = [];
    var emp_data_series = [];
    //***********CONFIG BY BIGHEAD*************//

    $(document).ready(function () {
        emppaid(0,0);
    });

    function emppaid(month, year) {
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "${contextPath}/report/",
            data: {month: month, year: year},
            success: function (menuArray) {
                var index = 0;
                var break_loop = false;
                for (var i = 0; i < menuArray.length; i++) { // loop menu
                    var menu = menuArray[i];
                    if (index < limit_of_paid) {
                        for (key in menu) { // get key
                            value = menu[key];
                            if (value > 0) {
                                //push into array for display
                                emp_data_legends.push(key);
                                emp_data_series.push({
                                    name: key,
                                    value: value
                                });
                                index++;
                            } else {
                                break_loop = true;
                            }
                        }
                    } else {
                        break_loop = true;
                    }

                    if (break_loop) {
                        break;
                    }
                }
                if ($('#echart_line_emppay').length ){

                    var echartLine = echarts.init(document.getElementById('echart_line_emppay'));

                    echartLine.setOption({
                        tooltip: {
                            trigger: 'axis'
                        },
                        legend: {
                            x: 220,
                            y: 40,
                            data: emp_data_legends
                        },
                        toolbox: {
                            show: true,
                            feature: {
                                magicType: {
                                    show: true
                                },
                                dataView: {
                                    show: true,
                                    title: "ดูข้อมูล",
                                    lang: ['ดูข้อมูล', 'ปิด', 'รีเฟรช']
                                },
                                saveAsImage: {
                                    show: true,
                                    title: "Save Image",
                                    pixelRatio: 2
                                }
                            }
                        },
                        calculable: true,
                        xAxis: [{
                            type: 'category',
                            boundaryGap: false,
                            data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
                        }],
                        yAxis: [{
                            type: 'value'
                        }],
                        series: [{
                            name: 'ค่าจ้างพนักงาน',
                            type: 'line',
                            smooth: true,
                            itemStyle: {
                                normal: {
                                    areaStyle: {
                                        type: 'default'
                                    }
                                }
                            },
                            data: emp_data_series
                        }]
                    });

                }
                if (index == 0) {
                    $("#echart_line_emppay").html("ไม่มีข้อมูลการขายเมนูเดี่ยว "+ $("#empmonth option:selected").text() + " " + $("#empyear option:selected").text());
                }
            }
        });
    }
    $("#empyear").change(function(){
        if($(this).val() == 0){
            $("#empmonth").val(0);
            $("#empmonth").attr('disabled',true);
        }else{
            $("#empmonth").attr('disabled',false);
        }
    });

    $(".menuchange").change(function(){
        year = $("#empyear").val();
        month = $("#empmonth").val();
        init_bestsalemenu(month,year);
    });

</script>
</body>
</html>