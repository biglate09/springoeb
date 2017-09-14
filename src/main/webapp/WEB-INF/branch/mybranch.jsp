<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="branch" value="${branchUser.branch}"/>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../_include/topenv.jsp"/>
    <title>จัดการสาขานี้</title>

</head>
<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <jsp:include page="../_include/navbar.jsp"/>
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
                            <h4>จัดการสาขานี้</h4>
                        </div>
                        <form method="POST" action="${contextPath}/branch/managemybranch" modelAttribute="branch">
                            <div class="x_content">
                                <div class="col align-self-start form-group has-feedback">
                                    <label class="required">ชื่อสาขา</label>
                                    <input class="form-control" style="width: 50%" name="branchName"
                                           placeholder="ชื่อสาขา"
                                           value="${branch.branchName}">
                                </div>
                                <div class="col align-self-start form-group has-feedback">
                                    <label>รายละเอียดสาขา</label>
                                    <textarea rows="4" cols="60" class="form-control" style="width: 50%"
                                              name="branchDesc"
                                              placeholder="รายละเอียด...">${branch.branchDesc}</textarea>
                                </div>

                                <hr style="margin-top: 20px;margin-bottom: 15px;border: 0;border-top: 1px solid #eeeeee;"/>
                                <div class="col-md-12">
                                    <h4 style="font-weight: normal;text-decoration: underline;margin-bottom: 15px;">
                                        ติดต่อ</h4>
                                </div>
                                <div class="col-md-6">
                                    <div class="col form-group has-feedback">
                                        <label class="required">ที่อยู่</label>
                                        <input class="form-control" placeholder="1/350 ..." name="addressName"
                                               value="${branch.addressName}">
                                    </div>
                                    <div class="col form-group has-feedback">
                                        <label class="required">ถนน</label>
                                        <input class="form-control" placeholder="พุทธบูชา 36" name="road"
                                               value="${branch.road}">
                                    </div>
                                    <div class="col form-group has-feedback">
                                        <label class="required">จังหวัด</label>
                                        <select change="province" progress="1" class="form-control depend-field"
                                                name="provinceNo">
                                            <option value="">เลือก</option>
                                            <c:forEach items="${provinces}" var="p">
                                                <option value="${p.provinceNo}">${p.provinceName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="col form-group has-feedback">
                                        <label class="required">อำเภอ/เขต</label>
                                        <select change="district" progress="2" class="form-control depend-field"
                                                name="districtNo">
                                            <option value="">เลือก</option>
                                        </select>
                                    </div>
                                    <div class="col form-group has-feedback">
                                        <label class="required">ตำบล/แขวง</label>
                                        <select change="subDistrict" progress="3" class="form-control depend-field"
                                                name="subDistrictNo">
                                            <option value="">เลือก</option>
                                        </select>
                                    </div>
                                    <div class="col form-group has-feedback">
                                        <label class="required">รหัสไปรษณีย์</label>
                                        <select change="zipcode" progress="4" class="form-control depend-field"
                                                name="zipNo">
                                            <option value="">เลือก</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="col form-group">
                                        <label>เบอร์โทรศัพท์</label>
                                        <input class="form-control" name="tel" placeholder="0xx-xxx-xxxx"
                                               value="${branch.tel}">
                                    </div>
                                    <div class="col form-group">
                                        <label>Line ID </label>
                                        <input class="form-control" name="line" placeholder="Line ID"
                                               value="${branch.line}">
                                    </div>
                                    <div class="col form-group">
                                        <label>Facebook</label>
                                        <input class="form-control" name="fb" placeholder="fb.com/xxxxxx"
                                               value="${branch.fb}">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12 col-sm-12 col-xs-12" style="text-align: center;">
                                <button type="submit" style="margin-left:5px;width: 100px;"
                                        class="btn btn-warning">แก้ไข
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../_include/bottomenv.jsp"/>
<script>
    $(document).ready(function () {
        $(".depend-field").eq(0).val(${branch.provinceNo});
        $(".depend-field").eq(0).trigger('change');
        $(".depend-field").eq(1).val(${branch.districtNo});
        $(".depend-field").eq(1).trigger('change');
        $(".depend-field").eq(2).val(${branch.subDistrictNo});
        $(".depend-field").eq(2).trigger('change');
        $(".depend-field").eq(3).val(${branch.zipNo});

        if(${edit == true}){
            swal("สำเร็จ", "ข้อมูลสาขาถูกเปลี่ยนเรียบร้อยแล้ว", "success");
        }
    });

    $(".depend-field").change(function () {
        var attName = $(this).attr('change');
        var progress = parseInt($(this).attr('progress'));

        var variable = {
            province: $(".depend-field").eq(0).val(),
            district: $(".depend-field").eq(1).val(),
            subDistrict: $(".depend-field").eq(2).val(),
        };

        if (progress == 4) {
            return false;
        }

        $.ajax({
            url: "${contextPath}/system/get" + attName + "/" + variable[attName]
            , method: "PUT"
            , dataType: "json"
            , async: false
            , success: function (result) {
                var progressAttName = $(".depend-field").eq(progress).attr('change');
                var provides = result[progressAttName + 's'];

                for (var i = progress; i <= 3; i++) {
                    $(".depend-field").eq(i).empty();
                    $(".depend-field").eq(i).append('<option value="">เลือก</option>');
                }

                for (var i = 0; i < provides.length; i++) {
                    var provide = provides[i];
                    $(".depend-field").eq(progress).append('\
                    <option value="' + provide[progressAttName + "No"] + '">' + provide[progressAttName + "Name"] + '</option>\
                    ');
                }
            }
        });
    });
</script>
</body>
</html>