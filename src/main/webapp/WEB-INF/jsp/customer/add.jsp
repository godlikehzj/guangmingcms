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
            <h3>客户管理</h3>
        </div>

    </div>
    <div class="clearfix"></div>
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>创建客户</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <br />
                    <form id="add_user" data-parsley-validate class="form-horizontal form-label-left" role="form">
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">姓名<span class="required">*</span>
                            </label>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <input type="text" id="name" required="required" class="form-control col-md-7 col-xs-12">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="mobile">手机<span class="required">*</span>
                            </label>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <input type="text" id="mobile" name="mobile" required="required" class="form-control col-md-7 col-xs-12">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="addr">地址<span class="required">*</span>
                            </label>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <input type="text" id="addr" name="addr" required="required" class="form-control col-md-7 col-xs-12">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">选择片区</label>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <select class="select2_single form-control" tabindex="-1" id="area_select">
                                    <option value="0">--</option>
                                    <c:forEach var="area" items="${areas}">
                                        <option value="${area.id}">${area.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">来源</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div id="channel" class="btn-group" data-toggle="buttons">
                                    <label class="btn" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                        到店:<input type="radio" class="flat" name="status" id="admin" value="0" checked="checked"/>
                                    </label>
                                    <label class="btn" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                        奶工:<input type="radio" class="flat" name="status" id="worker" value="1" />
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="ln_solid"></div>
                        <div class="form-group">
                            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                <button type="button" class="btn createbtn btn-success" onclick="addCustomer()">添加</button>
                                <button type="button" class="btn createbtn btn-primary" onclick="customer.getList()">取消</button>
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
    function addCustomer() {
        var param = {};
        param.name = $('#name').val();
        param.mobile = $('#mobile').val();
        param.addr = $('#addr').val();
        param.channel = $('input:radio:checked').val();
        param.area = $('#area_select').find('option:selected').val();
        if (param.name === ""){
            alert("请填写姓名");
            return;
        }
        if (param.addr === ""){
            alert("请填写地址");
            return;
        }
        if (param.mobile === ""){
            alert("请填写手机");
            return;
        }
        customer.add(param);
    }
</script>
