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
                    <h2>创建二级奶品</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <br />
                    <form id="add_dairy" data-parsley-validate class="form-horizontal form-label-left" role="form">
                        <input type="text" id="price_id" class="none" value="${priceType.id}">
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">奶品</label>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <select class="select2_single form-control" tabindex="-1" id="price_select">
                                    <c:forEach var="priceType" items="${priceTypes}">
                                        <option value="${priceType.id}" <c:if test="${pid == priceType.id}">selected="selected"</c:if>>${priceType.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">二级奶品<span class="required">*</span>
                            </label>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <input type="text" id="name" required="required" class="form-control col-md-7 col-xs-12">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="description">描述<span class="required">*</span>
                            </label>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <input type="text" id="description" name="description" required="required" class="form-control col-md-7 col-xs-12">
                            </div>
                        </div>

                        <div class="ln_solid"></div>
                        <div class="form-group">
                            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                <button type="button" class="btn createbtn btn-success" onclick="addDairy()">添加</button>
                                <button type="button" class="btn createbtn btn-primary" onclick="dairy.getList($('#price_id').val())">取消</button>
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
    function addDairy() {
        var param = {};
        param.priceId = $('#price_select').find('option:selected').val();
        param.name = $('#name').val();
        param.description = $('#description').val();
        if (param.name === ""){
            alert("请填写名称");
            return;
        }

        dairy.addDairy(param);
    }
</script>
