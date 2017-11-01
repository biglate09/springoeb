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
                            <div class="col-md-7"><h2>ภาพรวมผลประกอบการ</h2></div>
                            <div class="col-md-2">
                                <select name="year" class="form-control eventchange" id="year">
                                    <option value="" disabled>ปี พ.ศ.</option>
                                    <option value="2017">2560</option>
                                </select>
                            </div>
                            <div class="col-md-2">
                                <select name="month" class="form-control eventchange" id="month">
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
    var month_array = ['มกราคม','กุมภาพันธ์','มีนาคม','เมษายน','พฤษภาคม','มิถุนายนส','กรกฎาคม','สิงหาคม','กันยายน','ตุลาคม','พฤศจิกายน','ธันวาคม'];
    //Script for bar chart----------------------------------------
    $(document).ready(function () {
        init_totalincome(0, 0);
    });

    function init_totalincome(month, year) {
        var xAxisName = 'เดือน';
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "${contextPath}/report/bestsalemenu",
            data: {month: month, year: year},
            success: function (menuArray) {
                if(month != 0 && year != 0){
                    xAxisName = 'วันที่'
                }else{
                    xAxisName = 'เดือน'
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