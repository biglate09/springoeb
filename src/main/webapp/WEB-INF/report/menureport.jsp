<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="com.springoeb.promotion.model.Promotion" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html style="height: 100%">
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
                                <h2>เมนูเดี่ยว (ขายดี)</h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
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

    if ($('#pie_menu').length ){

        var echartPie = echarts.init(document.getElementById('pie_menu'), theme);

        echartPie.setOption({
            tooltip: {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                x: 'center',
                y: 'bottom',
                data: ['ขนมจีบกุ้ง', 'ขนมจีบหมูสับ', 'ขนมจีบปู', 'ซาลาเปาไส้หมูแดง', 'บะหมี่ฮ่องกงหมูแดง', 'เกี๊ยวซ่า']
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
                        title: "Save Image"
                    }
                }
            },
            calculable: true,
            series: [{
                name: 'เมนูอาหารแบบเดี่ยว',
                type: 'pie',
                radius: '55%',
                center: ['50%', '48%'],
                data: [{
                    value: 335,
                    name: 'ขนมจีบกุ้ง'
                }, {
                    value: 310,
                    name: 'ขนมจีบหมูสับ'
                }, {
                    value: 234,
                    name: 'ขนมจีบปู'
                }, {
                    value: 200,
                    name: 'ซาลาเปาไส้หมูแดง'
                }, {
                    value: 189,
                    name: 'บะหมี่ฮ่องกงหมูแดง'
                }, {
                    value: 204,
                    name: 'เกี๊ยวซ่า'
                }]
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
    //    JS FOR PIE AREA-------------------------------------------------
    var dom = document.getElementById("container");
    var myChart = echarts.init(dom);

    var app = {};
    option = null;
    option = {
        backgroundColor: '#cc',

//        title: {
//            text: 'Customized Pie',
//            left: 'center',
//            top: 30,
//            textStyle: {
//                color: '#ccc'
//            }
//        },

        tooltip : {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },

        visualMap: {
            show: false,
            min: 80,
            max: 600,
            inRange: {
                colorLightness: [0, 1]
            }
        },
        toolbox: {
            show: true,
            feature: {
                magicType: {
                    show: true,
                    type: ['pie', 'line', 'bar']
                },
                dataView: {
                    show: true,
                    title: "ดูข้อมูล"
                },
                saveAsImage: {
                    show: true,
                    title: "บันทึกรูป",
                    backgroundColor: '#ccc',
                    pixelRatio: 3,
                }
            }
        },
        series : [
            {
                name:'เมนูเดี่ยว',
                type:'pie',
                radius : '75%',
                center: ['50%', '50%'],
                data:[
                    {value:335, name:'ขนมจีบกุ้ง'},
                    {value:310, name:'ขนมจีบปู'},
                    {value:274, name:'ซาลาเปาหมูแดงทอด'},
                    {value:235, name:'ก๋วยเตี๋ยวหลอด'},
                    {value:400, name:'ขนมจีบหมูแต้มข้าวโพด'}
                ].sort(function (a, b) { return a.value - b.value; }),
                roseType: 'radius',
                label: {
                    normal: {
                        textStyle: {
                            color: '#2c343c'
                        }
                    }
                },
                labelLine: {
                    normal: {
                        lineStyle: {
                            color: '#2c343c'
                        },
                        smooth: 0.2,
                        length: 10,
                        length2: 20
                    }
                },
                itemStyle: {
                    normal: {
                        color: '#c23531',
                        shadowBlur: 100,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                },

                animationType: 'scale',
                animationEasing: 'elasticOut',
                animationDelay: function (idx) {
                    return Math.random() * 200;
                }
            }
        ]
    };
    ;
    if (option && typeof option === "object") {
        myChart.setOption(option, true);
    }
</script>
</body>
</html>