<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="com.springoeb.promotion.model.Promotion" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../_include/topenv.jsp"/>
    <title>จัดการโปรโมชั่นเมนูอาหาร</title>
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
                            <div class="col-md-7"><h2>เมนูเดี่ยว (ขายดี)</h2></div>
                            <div class="col-md-2">
                                <select name="year" class="form-control">
                                    <option value="" disabled>วันที่</option>
                                    <option>ทุกวัน</option>
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                                    <option>6</option>
                                    <option>7</option>
                                    <option>8</option>
                                    <option>9</option>
                                    <option>10</option>
                                    <option>11</option>
                                    <option>12</option>
                                    <option>13</option>
                                    <option>14</option>
                                    <option>15</option>
                                    <option>16</option>
                                    <option>17</option>
                                    <option>18</option>
                                    <option>19</option>
                                    <option>20</option>
                                    <option>21</option>
                                    <option>22</option>
                                    <option>23</option>
                                    <option>24</option>
                                    <option>25</option>
                                    <option>26</option>
                                    <option>27</option>
                                    <option>28</option>
                                    <option>29</option>
                                    <option>30</option>
                                    <option>31</option>
                                </select>
                            </div>
                            <div class="col-md-2">
                                <select name="month" class="form-control">
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
                            <div id="pie_menu" style="height:400px;"></div>
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
        init_bestsalemenu();
        init_bestsalemenuset();
    });


    $("#days").change(function() {
        var d = 0 ;
        if(month = 1 && 3 && 5 && 7 && 8 && 10 && 12) {
            d = 31;
        } else if(month = 4 && 6 && 9 && 11) {
            d = 30;
        } else {
            d = 29;
        }
    });

    function init_bestsalemenu() {
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "${contextPath}/report/bestsalemenu",
            success: function (menuArray) {
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

                    var dataStyle = {
                        normal: {
                            label: {
                                show: false
                            },
                            labelLine: {
                                show: false
                            }
                        }
                    };

                    var placeHolderStyle = {
                        normal: {
                            color: 'rgba(0,0,0,0)',
                            label: {
                                show: false
                            },
                            labelLine: {
                                show: false
                            }
                        },
                        emphasis: {
                            color: 'rgba(0,0,0,0)'
                        }
                    };
                }
            }
        });
    }

</script>
</body>
</html>