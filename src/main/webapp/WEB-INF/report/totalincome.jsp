<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="com.springoeb.promotion.model.Promotion" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../_include/topenv.jsp"/>
    <title>ภาพรวมผลประกอบการ</title>
    <link href="${contextPath}/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
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
                            <div class="col-md-7">
                                <h2>ภาพรวมผลประกอบการ</h2>
                            </div>
                            <div class="col-md-4">
                                <div class="col-md-9" style="padding-right:0px;">
                                    <input type="text" id="filterdate"
                                           class="form-control daterange" required
                                           value="${minDateTotal != null ? minDateTotal : 'ไม่พบข้อมูลในการค้นหา'} ${minDateTotal != null ? " - " : ''} ${maxDateTotal != null ? maxDateTotal : ''}">
                                </div>
                                <div class="input-group-btn">
                                    <button class="btn btn-default"
                                            type="submit" id="reportfilter">
                                        <i class="glyphicon glyphicon-search fa fa-search"></i>
                                    </button>
                                </div>
                            </div>
                            <ul class="nav navbar-right panel_toolbox" style="min-width: 0px">
                                <li><a class="collapse-link"><i class="fa fa-chevron-up right"></i></a>
                                </li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <div id="container" style="height:400px;"></div>
                            <div id="loading" style="position:absolute;top:50%;left:50%;transform:translate(-50%,-50%);"><i class="fa-li fa fa-spinner fa-spin"></i></div>
                            <div id="null" style="display:none;position:absolute;top:50%;left:50%;transform:translate(-50%,-50%);z-index:99999;">ไม่พบข้อมูลจากเงื่อนไขที่ท่านค้นหา</div>
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
    //Script for bar chart----------------------------------------
    var month_array = ['ม.ค.','ก.พ.','มี.ค.','ม.ย.','พ.ค.','มิ.ย.','ก.ค.','ส.ค.','ก.ย.','ต.ค.','พ.ย.','ธ.ค.'];

    $(document).ready(function () {
        $(".daterange").daterangepicker();
        var d = new Date();
        init_totalincome("${minDateTotal}", "${maxDateTotal}");
    });

    function init_totalincome(fromDate, toDate) {
        var xAxisName = 'วันที่';
        if(fromDate.substr(6,4) != toDate.substr(6,4)){
            xAxisName = 'ปี'
        }else{
            if(fromDate.substr(3,2) != toDate.substr(3,2)){
                xAxisName = 'เดือน';
            }else{
                xAxisName = 'วันที่';
            }
        }
        var incomeDataSeries = [];
        var expenseDataSeries = [];
        var dataxAxis = [];
        var key_number = 0;
        $.ajax({
            type: "PUT",
            dataType: "json",
            url: "${contextPath}/report/totalincome",
            data: {fromDate: fromDate, toDate: toDate},
            success: function (dataArray) {
                $("#loading").css('display','none');
                for (key in dataArray) {
                    key_number++;
                    value = dataArray[key];
                    incomeDataSeries.push(value.income);
                    expenseDataSeries.push(-value.expense);
                    if(xAxisName == 'เดือน') {
                        dataxAxis.push(month_array[key-1]);
                    }else{
                        dataxAxis.push(key);
                    }
                }
                var dom = document.getElementById("container");
                var myChart = echarts.init(dom);
                var app = {};
                option = null;

                app.config = {
                    rotate: 90,
                    align: 'left',
                    verticalAlign: 'middle',
                    position: 'insideBottom',
                    distance: 15,
                    onChange: function () {
                        var labelOption = {
                            normal: {
                                rotate: app.config.rotate,
                                align: app.config.align,
                                verticalAlign: app.config.verticalAlign,
                                position: app.config.position,
                                distance: app.config.distance
                            }
                        };
                        myChart.setOption({
                            series: [{
                                label: labelOption
                            }, {
                                label: labelOption
                            }
                            ]
                        });
                    }
                };


                var labelOption = {
                    normal: {
                        show: false,
                        position: app.config.position,
                        distance: app.config.distance,
                        align: app.config.align,
                        verticalAlign: app.config.verticalAlign,
                        rotate: app.config.rotate,
                        formatter: '{c}  {name|{a}}',
                        fontSize: 16,
                        rich: {
                            name: {
                                textBorderColor: '#fff'
                            }
                        }
                    }
                };

                option = {
                    color: ['#003366', '#e5323e'],
                    tooltip: {
                        trigger: 'axis',
                        axisPointer: {
                            type: 'shadow'
                        }
                    },
                    legend: {
                        data: ['รายรับ', 'รายจ่าย']
                    },
                    toolbox: {
                        show: true,
                        feature: {
                            mark: {show: true},
                            dataView: {
                                show: true,
                                title: 'ดูข้อมูล',
                                lang: ['ดูข้อมูล', 'ปิด', 'รีเฟรช']
                            },
                            magicType: {show: true, type: ['line', 'bar'],title: ['']},
                            saveAsImage: {
                                show: true,
                                title: 'บันทึกภาพ'
                            }
                        }
                    },
                    calculable: true,
                    xAxis: [
                        {
                            type: 'category',
                            name: xAxisName,
                            axisTick: {show: false},
                            data: dataxAxis
                        }
                    ],
                    yAxis: [
                        {
                            type: 'value',
                            name: 'จำนวนเงิน (บาท)'
                        }
                    ],
                    series: [
                        {
                            name: 'รายรับ',
                            type: 'bar',
                            barGap: 0,
                            label: labelOption,
                            data: incomeDataSeries
                        },
                        {
                            name: 'รายจ่าย',
                            type: 'bar',
                            label: labelOption,
                            data: expenseDataSeries
                        }
                    ]
                };

                if (option && typeof option === "object") {
                    myChart.setOption(option, true);
                }

                if (key_number == 0) {
                    $("#null").css("display", "inline-block");
                } else {
                    $("#null").css("display", "none");
                }
            },error : function(){
                $("#loading").css('display','none');
                swal("ผิดพลาด", "กรุณาลองใหม่อีกครั้ง", "error");
            }
        });
    }

    ///////////////////////////////

    $("#reportfilter").click(function(){
        $("#loading").css("display", "inline-block");
        init_totalincome($("#filterdate").val().substr(0,10),$("#filterdate").val().substr(13,10));
    });
</script>
</body>
</html>