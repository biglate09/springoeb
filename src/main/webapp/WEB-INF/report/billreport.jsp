<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
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
                            <div class="col-md-7"><h2>รายได้ผลประกอบการ</h2></div>
                            <div class="col-md-4">
                                <div class="col-md-9" style="padding-right:0px;">
                                    <input type="text" name="filterdate" id="filterdate_menuset"
                                           class="form-control daterange" required
                                           value="${minDateBill} - ${maxDateBill}">
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
    var month_array = ['ม.ค.','ก.พ.','มี.ค.','ม.ย.','พ.ค.','มิ.ย.','ก.ค.','ส.ค.','ก.ย.','ต.ค.','พ.ย.','ธ.ค.'];

    $(document).ready(function () {
        init_billreport('${minDateBill}','${maxDateBill}');
        $(".daterange").daterangepicker();
    });

    function init_billreport(fromDate, toDate) {
        var xAxisName = 'วันที่';
        var xAxis_data = [];
        var series_data = [];
        if(fromDate.substr(6,4) != toDate.substr(6,4)){
            xAxisName = 'ปี'
        }else{
            if(fromDate.substr(3,2) != toDate.substr(3,2)){
                xAxisName = 'เดือน';
            }else{
                xAxisName = 'วันที่';
            }
        }
        $("#loading").css('display', 'inline-block');
        $.ajax({
            type: "PUT",
            dataType: "json",
            url: "${contextPath}/report/getbillreport",
            data: {fromDate: fromDate, toDate: toDate},
            success: function (billArray) {
                console.log(billArray);
                $("#loading").css('display', 'none');
                for (key in billArray) {
                    value = billArray[key];
                    if(xAxisName == 'เดือน') {
                        xAxis_data.push(month_array[key-1]);
                    }else{
                        xAxis_data.push(key);
                    }
                    series_data.push(value);
                }
                var dom = document.getElementById("container");
                var myChart = echarts.init(dom);
                var app = {};
                option = null;
                option = {
                    tooltip: {
                        trigger: 'axis'
                    },
                    grid: {
                        left: '3%',
                        right: '4%',
                        bottom: '3%',
                        containLabel: true
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
                    xAxis: {
                        name: xAxisName,
                        type: 'category',
                        boundaryGap: false,
                        data: xAxis_data
                    },
                    yAxis: {
                        name: 'จำนวนเงิน (บาท)',
                        type: 'value'
                    },
                    series: [
                        {
                            name: 'รายได้จากค่าอาหาร',
                            type: 'line',
                            data: series_data
                        }
                    ]
                };
                ;
                if (option && typeof option === "object") {
                    myChart.setOption(option, true);
                }
            }
        });
    }
</script>
</body>
</html>