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
            <h3>奶品管理</h3>
        </div>

    </div>
    <div class="clearfix"></div>
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>修改奶品</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <br />
                    <form id="add_dairy" data-parsley-validate class="form-horizontal form-label-left" role="form">
                        <input type="text" id="price_id" class="none" value="${priceType.id}">
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">奶品<span class="required">*</span>
                            </label>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <input type="text" id="name" required="required" value="${priceType.name}" class="form-control col-md-7 col-xs-12">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="price">单价(分)<span class="required">*</span>
                            </label>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <input type="text" id="price" name="price" required="required" value="${priceType.price}" class="form-control col-md-7 col-xs-12">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="deliverPrice">工价(分)<span class="required">*</span>
                            </label>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <input type="text" id="deliverPrice" name="deliverPrice" required="required" value="${priceType.deliverPrice}" class="form-control col-md-7 col-xs-12">
                            </div>
                        </div>
                        <div class="ln_solid"></div>
                        <div class="form-group">
                            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                <button type="button" class="btn createbtn btn-success" onclick="modifyPrice()">修改</button>
                                <button type="button" class="btn createbtn btn-primary" onclick="dairy.getList()">取消</button>
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
    function modifyPrice() {
        var param = {};
        param.id = $('#price_id').val();
        param.name = $('#name').val();
        param.deliverPrice = $('#deliverPrice').val();
        param.price = $('#price').val();
        if (param.name === ""){
            alert("请填写名称");
            return;
        }
        if (param.price === ""){
            alert("请填写价格");
            return;
        }
        if (param.deliverPrice === ""){
            alert("请填写工费");
            return;
        }

        dairy.modifyPrice(param);
    }
</script>
