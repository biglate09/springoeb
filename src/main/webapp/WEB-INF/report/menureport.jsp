<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="com.springoeb.promotion.model.Promotion" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html style="height: 100%">
<head>
    <jsp:include page="../_include/topenv.jsp"/>
    <title>ภาพรวมเมนูอาหาร</title>
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
                <%--Menu Report--%>
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <div class="col-md-7"><h2>เมนูเดี่ยว (ขายดี)</h2></div>
                            <div class="col-md-2">
                                <select name="year" class="form-control menuchange" id="menuyear">
                                    <option value="" disabled>ปี พ.ศ.</option>
                                    <option value="0">ทุกปี</option>
                                    <option value="2017">2560</option>
                                </select>
                            </div>
                            <div class="col-md-2">
                                <select name="month" class="form-control menuchange" id="menumonth" disabled>
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
                            <div id="pie_menu" style="height:400px;">
                            </div>
                            <div id="loadingmenu" style="position:absolute;top:50%;left:50%;transform:translate(-50%,-50%);"><i class="fa-li fa fa-spinner fa-spin"></i></div>
                            <div id="menu_null" style="display:none;position:absolute;top:50%;left:50%;transform:translate(-50%,-50%);z-index:99999;">ไม่พบข้อมูลจากเงื่อนไขที่ท่านค้นหา</div>
                        </div>
                    </div>
                </div>

                <%--Menuset Report--%>
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <div class="col-md-7"><h2>เมนูชุด (ขายดี)</h2></div>
                            <div class="col-md-2">
                                <select name="year" class="form-control menusetchange" id="menusetyear">
                                    <option value="" disabled>ปี พ.ศ.</option>
                                    <option value="0">ทุกปี</option>
                                    <option value="2017">2560</option>
                                </select>
                            </div>
                            <div class="col-md-2">
                                <select name="month" class="form-control menusetchange" id="menusetmonth" disabled>
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
                            <div id="pie_menuset" style="height:400px;">
                            </div>
                            <div id="loadingmenuset" style="position:absolute;top:50%;left:50%;transform:translate(-50%,-50%);"><i class="fa-li fa fa-spinner fa-spin"></i></div>
                            <div id="menuset_null" style="display:none;position:absolute;top:50%;left:50%;transform:translate(-50%,-50%);">ไม่พบข้อมูลจากเงื่อนไขที่ท่านค้นหา</div>
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
    var limit_of_menu = 10;
    var menu_data_legends = [];
    var menu_data_series = [];
    var limit_of_menuset = 10;
    var menuset_data_legends = [];
    var menuset_data_series = [];
    //***********CONFIG BY BIGHEAD*************//

    $(document).ready(function () {
        init_bestsalemenu(0, 0);
        init_bestsalemenuset(0, 0);
    });

    function init_bestsalemenu(month, year) {
        $("#loadingmenu").css('display','inline-block');
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "${contextPath}/report/bestsalemenu",
            data: {month: month, year: year},
            success: function (menuArray) {
                $("#loadingmenu").css('display','none');
                menu_data_legends = [];
                menu_data_series = [];
                var index_menu = 0;
                var break_loop = false;
                for (var i = 0; i < menuArray.length; i++) { // loop menu
                    var menu = menuArray[i];
                    if (index_menu < limit_of_menu) {
                        for (key in menu) { // get key
                            value = menu[key];
                            if (value > 0) {
                                //push into array for display
                                menu_data_legends.push(key);
                                menu_data_series.push({
                                    name: key,
                                    value: value
                                });
                                index_menu++;
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
                if ($('#pie_menu').length) {
                    var echartPie = echarts.init(document.getElementById('pie_menu'));
                    echartPie.setOption({
                        tooltip: {
                            trigger: 'item',
                            formatter: "{a} <br/>{b} : {c} ({d}%)"
                        },
                        legend: {
                            x: 'center',
                            y: 'bottom',
                            data: menu_data_legends
                        },
                        toolbox: {
                            show: true,
                            feature: {
                                magicType: {
                                    show: true,
                                    type: ['pie', 'funnel'],
                                    option: {
                                        funnel: {
                                            x: '25%',
                                            width: '50%',
                                            funnelAlign: 'left',
                                            max: 1548
                                        }
                                    }
                                },
                                dataView: {
                                    show: true,
                                    title: "ดูข้อมูล"
                                },
                                saveAsImage: {
                                    show: true,
                                    title: "Save Image",
                                    pixelRatio: 2
                                }
                            }
                        },
                        calculable: true,
                        series: [{
                            name: 'เมนูอาหารแบบเดี่ยว',
                            type: 'pie',
                            radius: '55%',
                            center: ['50%', '48%'],
                            data: menu_data_series
                        }]
                    });
                }

                if (menu_data_legends.length == 0) {
                    $("#menu_null").css("display", "inline-block");
                } else {
                    $("#menu_null").css("display", "none");
                }
            }
        });
    }
    function init_bestsalemenuset(month, year) {
        $("#loadingmenuset").css('display','inline-block');
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "${contextPath}/report/bestsalemenuset",
            data: {month: month, year: year},
            success: function (menuArray) {
                $("#loadingmenuset").css('display','none');
                menuset_data_legends = [];
                menuset_data_series = [];
                var index_menuset = 0;
                var break_loop = false;
                for (var i = 0; i < menuArray.length; i++) { // loop menu
                    var menu = menuArray[i];
                    if (index_menuset < limit_of_menuset) {
                        for (key in menu) { // get key
                            value = menu[key];
                            if (value > 0) {
                                //push into array for display
                                menuset_data_legends.push(key);
                                menuset_data_series.push({
                                    name: key,
                                    value: value
                                });
                                index_menuset++;
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

                if ($('#pie_menuset').length) {

                    var echartPie = echarts.init(document.getElementById('pie_menuset'));

                    echartPie.setOption({
                        tooltip: {
                            trigger: 'item',
                            formatter: "{a} <br/>{b} : {c} ({d}%)"
                        },
                        legend: {
                            x: 'center',
                            y: 'bottom',
                            data: menuset_data_legends
                        },
                        toolbox: {
                            show: true,
                            feature: {
                                magicType: {
                                    show: true,
                                    type: ['pie', 'funnel'],
                                    option: {
                                        funnel: {
                                            x: '25%',
                                            width: '50%',
                                            funnelAlign: 'left',
                                            max: 1548
                                        }
                                    }
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
                        series: [{
                            name: 'เมนูอาหารแบบชุด',
                            type: 'pie',
                            radius: '55%',
                            center: ['50%', '48%'],
                            data: menuset_data_series
                        }]
                    });
                }

                if (menuset_data_legends.length == 0) {
                    $("#menuset_null").css("display", "inline-block");
                } else {
                    $("#menuset_null").css("display", "none");
                }
            }
        });
    }

    $("#menuyear").change(function () {
        if ($(this).val() == 0) {
            $("#menumonth").val(0);
            $("#menumonth").attr('disabled', true);
        } else {
            $("#menumonth").attr('disabled', false);
        }
    });

    $(".menuchange").change(function () {
        year = $("#menuyear").val();
        month = $("#menumonth").val();
        init_bestsalemenu(month, year);
    });

    $("#menusetyear").change(function () {
        if ($(this).val() == 0) {
            $("#menusetmonth").val(0);
            $("#menusetmonth").attr('disabled', true);
        } else {
            $("#menusetmonth").attr('disabled', false);
        }
    });

    $(".menusetchange").change(function () {
        year = $("#menusetyear").val();
        month = $("#menusetmonth").val();
        init_bestsalemenuset(month, year);
    });
</script>
</body>
</html>