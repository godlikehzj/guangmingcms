<%--
  Created by IntelliJ IDEA.
  User: zhijunhu
  Date: 2018/3/2
  Time: 11:59
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../common/taglibs.jsp"%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link href="vendors/iCheck/skins/flat/green.css" rel="stylesheet">

<div class="">
    <div class="page-title">
        <div class="title_left">
            <h3>片区管理</h3>
        </div>

    </div>
    <div class="clearfix"></div>
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>修改片区</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <br />
                    <form id="add_user" data-parsley-validate class="form-horizontal form-label-left" role="form">
                        <input type="text" id="area_id" class="none" value="${area.id}">
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">地区名<span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text" id="name" required="required" value="${area.name}" class="form-control col-md-7 col-xs-12">
                            </div>
                        </div>
                        <div class="ln_solid"></div>
                        <div class="form-group">
                            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                <button type="button" class="btn createbtn btn-success" onclick="modifyArea()">修改</button>
                                <button type="button" class="btn createbtn btn-primary" onclick="area.getList()">取消</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="vendors/iCheck/icheck.min.js"></script>
<%--<script src="vendors/custom/custom.min.js"></script>--%>

<script>
    initicheck();
    function modifyArea() {
        var param = {};
        param.id = $('#area_id').val();
        param.name = $('#name').val();
        if (param.name === ""){
            alert("请填写地区名");
            return;
        }

        area.modify(param);
    }
</script>
