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
                <div class="col-md-6 col-sm-6 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>Bar Graph</h2>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <div id="container" style="height: 100%"></div>
                        </div>
                    </div>
                </div>

                <div class="col-md-6 col-sm-6 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>Bar Graph</h2>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <div id="container_of_pieChart" style="height: 100%"></div>
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
    $(document).ready(function () {
        $('.date').daterangepicker({
                locale: 'DD-MM-YYYY',
                singleDatePicker: true,
                showDropdowns: true
            }
        );

        var addfirsttime = true;

        $("#promotion_modal").on('shown.bs.modal', function () {
            if (addfirsttime) {
                addfirsttime = false;
                $("#datatable-menugroup").DataTable({
                    scrollY: "40vh",
                    paging: false,
                    order: [[2, "desc"]],
                    columnDefs: [
                        {orderable: false, targets: [0]}
                    ]
                });
            }
        });

        $("#promotionPicture").click(function () {
            $("#promotionPicPath").click();
        });

        $("#promotionPicPath").change(function () {
            if ($(this).val() == '') {
                $("#promotionPicture").attr('src', '../images/default_upload_image.png');
            }
        });

        refresh_table();
    });

    $('.modal').on('hidden.bs.modal', function () {
        reset_field();
    });

    function reset_field() {
        $("#managePromotion")[0].reset();
        $("#promotionPicture").attr('src', '../images/default_upload_image.png');
        $(".flat").parent().removeClass('checked');
        $(".flat").attr('checked', false);
    }

    function filterCard() {
        var input = $("#myInput").val();
        var hascard = false;
        $(".cardname").each(function () {
            if (($(this).text().toLowerCase()).indexOf(input.toLowerCase()) == -1) {
                $(this).parent().parent().parent().css('display', 'none');
            } else {
                $(this).parent().parent().parent().css('display', '');
                hascard = true;
            }
        });

        if (!hascard) {
            $("#error_show").html('\
                    <div class="well col-md-12" style="overflow: auto">\
                        <p style="text-align:center;font-weight:bold;">ไม่พบข้อมูลโปรโมชั่น' + (input == '' ? '' : 'ด้วยคำค้นหา ' + '"' + input + '"') + '</p>\
                    </div>\
                    ');
        } else {
            $("#error_show").html('');
        }
    }

    function set_promotion(promotionNo){
        $.ajax({
            type: "PUT",
            url: "${contextPath}/promotion/getpromotion/" + promotionNo,
            dataType: "json",
            success: function (promo) {
                $("#promotionNameTH").val(promo.promotionNameTH);
                $("#promotionNameEN").val(promo.promotionNameEN);
                $("#fromDate").val(promo.fromDate.substr(8,2) + "-" + promo.fromDate.substr(5,2) + "-" +promo.fromDate.substr(0,4));
                $("#toDate").val(promo.toDate.substr(8,2) + "-" + promo.toDate.substr(5,2) + "-" +promo.toDate.substr(0,4));
                $("#day").val(promo.day);
                $("#discount").val(promo.discount);
                $("#promotionDesc").val(promo.promotionDesc);
                $("#promotionNo").val(promo.promotionNo);
                $("#promotionPicture").attr('src','../images/promotion/'+promo.promotionPicPath);
//                if(promo.available == true){
//                    $("#available").iCheck("check");
//                }

                var menugroups = promo.menuGroupPromotions;
                for(var i = 0 ; i < menugroups.length ; i++){
                    $("input[value="+menugroups[i].menuGroupNo+"]").iCheck("check");
                }
            }
        });
    }

    function del_promotion(promotionNo){
        swal({
                title: "ยืนยันการลบโปรโมชั่น",
                text: "เมื่อยืนยัน จะไม่สามารถนำข้อมูลกลับมาได้",
                type: "warning",
                showCancelButton: true,
                cancelButtonText: "ยกเลิก",
                confirmButtonText: "ใช่, ต้องการลบ",
                confirmButtonColor: "#DD6B55",
                closeOnConfirm: false

            },
            function () {
                $.ajax({
                    type: "DELETE",
                    url: "${contextPath}/promotion/deletepromotion/" + promotionNo,
                    success: function (json) {
                        swal("สำเร็จ","โปรโมชั่นถูกลบเรียบร้อยแล้ว", "success");
                        refresh_table();
                    },
                    error: function (json) {
                        swal("ไม่สำเร็จ", "กรุณาลองใหม่อีกครั้ง", "error");
                    }
                });
            });
    }


    $("#managePromotion").submit(function () {
        $('#loadingbtn').show();
        $.ajax({
            type: "POST",
            data: new FormData($("#managePromotion")[0]),
            enctype: 'multipart/form-data',
            cache: false,
            contentType: false,
            processData: false,
            url: "${contextPath}/promotion/managepromotion",
            success: function (result) {
                $('#loadingbtn').hide();
                swal("สำเร็จ", "โปรโมชั่นถูก"+($("#promotionNo").val() == '' ? 'เพิ่ม' : 'แก้ไข')+"เรียบร้อยแล้ว", "success");
                reset_field();
                $("#promotion_modal").modal('toggle');
                refresh_table();
            }, error: function (result) {
                $('#loadingbtn').hide();
                swal("ไม่สำเร็จ", "ชื่อโปรโมชั่นอาจซ้ำ กรุณาลองใหม่ในภายหลัง", "error");
            }
        });
        return false;
    });

    function refresh_table() {
        $.ajax({
            type: "POST",
            url: "${contextPath}/promotion/getpromotions",
            dataType: "json",
            success: function (json) {
                $("#promotion_thumbnail").empty();
                if (json.length != 0) {
                    for (var i = 0; i < json.length; i++) {
                        var promotion = json[i];
                        var menugroup = promotion.menuGroupPromotions;
                        var menugroup_txt = "";
                        for(var j = 0; j < menugroup.length; j++){
                            menugroup_txt += "<span style='white-space:nowrap;overflow:hidden;text-overflow: ellipsis;'>" + menugroup[j].menuGroup.menuGroupNameTH + "</span><br>";
                        }
                        var div = '<div class="col-md-6 col-sm-6 col-xs-12">\
                            <div class="thumbnail">\
                            <div class="col-md-6 image view view-first" style="height:100%;">\
                            <img style="width: 100%; display: block;" src="' + (promotion.promotionPicPath == null ? ('../images/default_upload_image.png') : ('../images/promotion/' + promotion.promotionPicPath) ) + '" alt="image"/>\
                            <div class="mask">\
                            <p>' + (promotion.promotionDesc == null ? 'ไม่มีรายละเอียด' : promotion.promotionDesc) + '</p>\
                            <div class="tools tools-bottom" style="margin-top:200px;">\
                            </div>\
                            </div>\
                            </div>\
                            <div class="col-md-6 caption" style="height:100%;color:#73879C">\
                            <div class="col-md-12 cardname" data-toggle="modal" data-target="#promotion_modal" onclick="set_promotion(' + promotion.promotionNo + ')" style="font-weight:bold;white-space:nowrap;overflow:hidden;text-overflow: ellipsis;cursor:pointer;">' + promotion.promotionNameTH + ' / ' + promotion.promotionNameEN + '</div>\
                            <div class="col-md-12 foodDesc">\
                            <div>\
                            <p style="text-align:center;font-weight:bold;">รายละเอียดโปรโมชั่น</p>\
                            <span class="col-md-offset-1 col-md-4" style="font-weight:bold">ลดราคา </span> <span class="col-md-7">' + promotion.discount  + '%</span>\
                            <span class="col-md-offset-1 col-md-4" style="font-weight:bold">เริ่มต้น </span> <span class="col-md-7">' + promotion.fromDate  + '</span>\
                            <span class="col-md-offset-1 col-md-4" style="font-weight:bold">สิ้นสุด </span> <span class="col-md-7">' + promotion.toDate  + '</span>\
                            <span class="col-md-offset-1 col-md-4" style="font-weight:bold">วัน </span> <span class="col-md-7">' + (promotion.day == '${Promotion.MONDAY}' ? 'วันจันทร์' : promotion.day == '${Promotion.TUESDAY}' ? 'วันอังคาร' : promotion.day == '${Promotion.WEDNESDAY}' ? 'วันพุธ' : promotion.day == '${Promotion.THURSDAY}' ? 'วันพฤหัสบดี' : promotion.day == '${Promotion.FRIDAY}' ? 'วันศุกร์' : promotion.day == '${Promotion.SATURDAY}' ? 'วันเสาร์' : promotion.day == '${Promotion.SUNDAY}' ? 'วันอาทิตย์' : 'ทุกวัน')  + '</span>\
                            <p style="text-align:center;font-weight:bold;">------------------------------</p>\
                            <p style="text-align:center;font-weight:bold;">หมวดหมู่เมนูที่ร่วมโปรโมชั่น</p>\
                            <span class="col-md-offset-1 col-md-10" style="text-align:center;">\
                            '+ menugroup_txt +'\
                            </span>\
                            </div>\
                            </div>\
                            <div class="col-md-12" style="font-weight:bold;text-align:right;"> \
                            <a title="แก้ไข" style="color:#73879C;cursor:pointer;margin-right:5px;" data-toggle="modal" data-target="#promotion_modal" onclick="set_promotion(' + promotion.promotionNo + ')"><i class="fa fa-pencil"></i></a>' + '\
                            <a title="ลบ" onclick="del_promotion(' + promotion.promotionNo + ')" style="color:#73879C;cursor:pointer;"><i class="fa fa-trash"></i></a>' + '\
                            </div>\
                            </div>\
                            </div>\
                            </div>';

                        //<a title="โปรโมชั่นนี้' + (promotion.available == true ? '' : 'ไม่' ) + 'พร้อมให้บริการ คลิกเพื่อเปลี่ยน" onclick="change_available(' + promotion.promotionNo + ')" style="color:#73879C;cursor:pointer;margin-right:5px;"><i class="fa ' + (promotion.available == true ? 'fa-check-square-o' : 'fa-square-o' ) + '"></i></a>\
                        $("#promotion_thumbnail").append(div);
                        $("#error_show").html('');
                    }
                } else {
                    $("#error_show").html('\
                    <div class="well col-md-12" style="overflow: auto">\
                        <p style="text-align:center;font-weight:bold;"> ไม่พบข้อมูลโปรโมชั่น </p>\
                    </div>\
                    ');
                }
            }
        });
    }
//    JS FOR BAR GRAPH-------------------------------------------------
    var dom = document.getElementById("container_of_pieChart");
    var myChart = echarts.init(dom);
    var app = {};
    option = null;
    option = {
        title : {
            text: '某地区蒸发量和降水量',
            subtext: '纯属虚构'
        },
        tooltip : {
            trigger: 'axis'
        },
        legend: {
            data:['蒸发量','降水量']
        },
        toolbox: {
            show : true,
            feature : {
                dataView : {show: true, readOnly: false},
                magicType : {show: true, type: ['line', 'bar']},
                restore : {show: true},
                saveAsImage : {show: true}
            }
        },
        calculable : true,
        xAxis : [
            {
                type : 'category',
                data : ['มกราคม','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']
            }
        ],
        yAxis : [
            {
                type : 'value'
            }
        ],
        series : [
            {
                name:'蒸发量',
                type:'bar',
                data:[2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3],
                markPoint : {
                    data : [
                        {type : 'max', name: '最大值'},
                        {type : 'min', name: '最小值'}
                    ]
                },
                markLine : {
                    data : [
                        {type : 'average', name: '平均值'}
                    ]
                }
            },
            {
                name:'降水量',
                type:'bar',
                data:[2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3],
                markPoint : {
                    data : [
                        {name : '年最高', value : 182.2, xAxis: 7, yAxis: 183},
                        {name : '年最低', value : 2.3, xAxis: 11, yAxis: 3}
                    ]
                },
                markLine : {
                    data : [
                        {type : 'average', name : '平均值'}
                    ]
                }
            }
        ]
    };
    ;
    if (option && typeof option === "object") {
        myChart.setOption(option, true);
    }
//Script for pie chart----------------------------------------
    var dom = document.getElementById("container");
    var myChart = echarts.init(dom);
    var app = {};
    option = null;
    option = {
        title : {
            text: '某站点用户访问来源',
            subtext: '纯属虚构',
            x:'center'
        },
        tooltip : {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            orient: 'vertical',
            left: 'left',
            data: ['直接访问','邮件营销','联盟广告','视频广告','搜索引擎']
        },
        series : [
            {
                name: '访问来源',
                type: 'pie',
                radius : '55%',
                center: ['50%', '60%'],
                data:[
                    {value:335, name:'直接访问'},
                    {value:310, name:'邮件营销'},
                    {value:234, name:'联盟广告'},
                    {value:135, name:'视频广告'},
                    {value:1548, name:'搜索引擎'}
                ],
                itemStyle: {
                    emphasis: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
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