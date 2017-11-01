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
                                           class="form-control daterange" required value="${minDateTotal != null ? minDateTotal : 'ไม่พบข้อมูลในการค้นหา'} ${minDateTotal != null ? " - " : ''} ${maxDateTotal != null ? maxDateTotal : ''}">
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
    $(document).ready(function () {
        $(".daterange").daterangepicker();
        var d = new Date();
        init_totalincome(0,d.getFullYear());
    });

    function init_totalincome(fromDate, toDate) {
        var xAxisName = 'วัน';
        $.ajax({
            type: "PUT",
            dataType: "json",
            url: "${contextPath}/report/totalincome",
            data: {fromDate: fromDate, toDate: toDate},
            success: function (dataArray) {
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
                            name: 'วันที่',
                            axisTick: {show: false},
                            data: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30]
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
                            data: [320, 332, 301, 334, 890, 320, 332, 301, 334, 890, 320, 332, 332, 332, 332, 332, 332, 332, 332, 332, 332, 332, 332, 332, 332, 332, 332, 332, 332, 332]
                        },
                        {
                            name: 'รายจ่าย',
                            type: 'bar',
                            label: labelOption,
                            data: [220, 182, 191, 234, 290, 220, 182, 191, 234, 290, 220, 182, 182, 182, 182, 182, 182, 182, 182, 182, 182, 182, 182, 182, 182, 182, 182, 182, 182, 182]
                        }
                    ]
                };

                if (option && typeof option === "object") {
                    myChart.setOption(option, true);
                }
            }
        });
    }

    ///////////////////////////////

    $("#year").change(function () {
        if ($(this).val() == 0) {
            $("#month").val(0);
            $("#month").attr('disabled', true);
        } else {
            $("#month").attr('disabled', false);
        }
    });

    $(".eventchange").change(function () {
        year = $("#year").val();
        month = $("#month").val();
        init_totalincome(month, year);
    });
</script>
</body>
</html>