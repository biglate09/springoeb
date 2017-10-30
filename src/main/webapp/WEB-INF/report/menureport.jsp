<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
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
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>Pie Graph</h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                    </li>
                                    <li class="dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                        <ul class="dropdown-menu" role="menu">
                                            <li><a href="#">Settings 1</a>
                                            </li>
                                            <li><a href="#">Settings 2</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li><a class="close-link"><i class="fa fa-close"></i></a>
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
//    JS FOR PIE AREA-------------------------------------------------
    var dom = document.getElementById("container");
    var myChart = echarts.init(dom);

    var app = {};
    option = null;
    option = {
        backgroundColor: '#2c343c',

        title: {
            text: 'Customized Pie',
            left: 'center',
            top: 30,
            textStyle: {
                color: '#ccc'
            }
        },

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
        series : [
            {
                name:'访问来源',
                type:'pie',
                radius : '80%',
                center: ['50%', '50%'],
                data:[
                    {value:335, name:'直接访问'},
                    {value:310, name:'邮件营销'},
                    {value:274, name:'联盟广告'},
                    {value:235, name:'视频广告'},
                    {value:400, name:'ทดสอบ'},
                    {value:300, name:'ทดสอบจ้า'},
                    {value:300, name:'ทดสอบจ้า'},
                    {value:300, name:'ทดสอบจ้า'},
                    {value:300, name:'ทดสอบจ้า'},
                    {value:300, name:'ทดสอบจ้า'}
                ].sort(function (a, b) { return a.value - b.value; }),
                roseType: 'radius',
                label: {
                    normal: {
                        textStyle: {
                            color: 'rgba(255, 255, 255, 0.3)'
                        }
                    }
                },
                labelLine: {
                    normal: {
                        lineStyle: {
                            color: 'rgba(255, 255, 255, 0.3)'
                        },
                        smooth: 0.2,
                        length: 10,
                        length2: 20
                    }
                },
                itemStyle: {
                    normal: {
                        color: '#c23531',
                        shadowBlur: 200,
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

    //***********CONFIG BY BIGHEAD*************//
    var limit_of_menu = 10;
    var limit_of_menuset = 10;
    //***********CONFIG BY BIGHEAD*************//

    $( document ).ready(function() {
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "${contextPath}/report//bestsalemenu",
            success: function (menuArray) {
                console.log(menuArray);
                var index_menu = 0;
                var break_loop = false;
                var data_legends = [];
                var data_series = [];
                for(var i = 0 ; i < menuArray.length ; i++){ // loop menu
                    var menu = menuArray[i];
                    if(index_menu < limit_of_menu) {
                        for (key in menu) { // get key
                            value = menu[key];
                            if (value > 0) {
                                //push into array for display
                                data_legends.push(key);
                                data_series.push({
                                    name : key,
                                    value : value
                                });
                                index_menu++;
                            }else{
                                break_loop = true;
                            }
                        }
                    }else{
                        break_loop = true;
                    }

                    if(break_loop){
                        break;
                    }
                }
                console.log(data_series);
                console.log(data_legends);
            }
        });
    });
</script>
</body>
</html>