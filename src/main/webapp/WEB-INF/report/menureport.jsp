<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html style="height: 100%">
<head>
    <jsp:include page="../_include/topenv.jsp"/>
    <link href="${contextPath}/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
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
                <div class="col-md-6 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <div class="col-md-5"><h2>เมนูเดี่ยวขายดี (10 อันดับ)</h2></div>
                            <div class="col-md-6">
                                <div class="col-md-9" style="padding-right:0px;">
                                    <input type="text" name="filterdate" id="filterdate_menu"
                                           class="form-control daterange" value="${minDateMenu} - ${maxDateMenu}" required>
                                </div>
                                <div class="input-group-btn">
                                    <button class="btn btn-default"
                                            type="submit" id="menureportfilter">
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
                            <div id="pie_menu" style="height:400px;">
                            </div>
                            <div id="loadingmenu" style="position:absolute;top:50%;left:50%;transform:translate(-50%,-50%);"><i class="fa-li fa fa-spinner fa-spin"></i></div>
                            <div id="menu_null" style="display:none;position:absolute;top:50%;left:50%;transform:translate(-50%,-50%);z-index:99999;">ไม่พบข้อมูลจากเงื่อนไขที่ท่านค้นหา</div>
                        </div>
                    </div>
                </div>

                <%--Menuset Report--%>
                <div class="col-md-6 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <div class="col-md-5"><h2>เมนูชุดขายดี (10 อันดับ)</h2></div>
                            <div class="col-md-6">
                                <div class="col-md-9" style="padding-right:0px;">
                                    <input type="text" name="filterdate" id="filterdate_menuset"
                                           class="form-control daterange" required value="${minDateMenuSet} - ${maxDateMenuSet}">
                                </div>
                                <div class="input-group-btn">
                                    <button class="btn btn-default"
                                            type="submit" id="menusetreportfilter">
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
        $(".daterange").daterangepicker();
        init_bestsalemenu('${minDateMenu}', '${maxDateMenu}');
        init_bestsalemenuset('${minDateMenuSet}', '${maxDateMenuSet}');
    });

    function init_bestsalemenu(fromDate, toDate) {
        $("#loadingmenu").css('display','inline-block');
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "${contextPath}/report/bestsalemenu",
            data: {fromDate: fromDate, toDate: toDate},
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
            },error : function(){
                $("#loadingmenu").css('display','none');
                swal("ผิดพลาด", "กรุณาลองใหม่อีกครั้ง", "error");
            }
        });
    }
    function init_bestsalemenuset(fromDate, toDate) {
        $("#loadingmenuset").css('display','inline-block');
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "${contextPath}/report/bestsalemenuset",
            data: {fromDate: fromDate, toDate: toDate},
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
                                    title: [''],
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
            },error : function(){
                $("#loadingmenuset").css('display','none');
                swal("ผิดพลาด", "กรุณาลองใหม่อีกครั้ง", "error");
            }
        });
    }

    $("#menureportfilter").click(function(){
        init_bestsalemenu($("#filterdate_menu").val().substr(0,10),$("#filterdate_menu").val().substr(13,10));
    });

    $("#menusetreportfilter").click(function(){
        init_bestsalemenuset($("#filterdate_menuset").val().substr(0,10),$("#filterdate_menuset").val().substr(13,10));
    });
</script>
</body>
</html>