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
            <h3>用户管理</h3>
        </div>

    </div>
    <div class="clearfix"></div>
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>修改用户</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <br />
                    <form id="add_user" data-parsley-validate class="form-horizontal form-label-left" role="form">
                        <input type="text" id="user_id" class="none" value="${user.id}">
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">姓名(拼音)<span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text" id="name" required="required" value="${user.name}" class="form-control col-md-7 col-xs-12">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="cname">姓名(中文)
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text" id="cname" name="cname" required="required" value="${user.cname}" class="form-control col-md-7 col-xs-12">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="mobile">手机
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text" id="mobile" name="mobile" required="required" value="${user.mobile}" class="form-control col-md-7 col-xs-12">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="password">密码<span class="required">*</span>
                            </label>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <input type="password" id="password" name="password" required="required" value="${user.password}" class="form-control col-md-7 col-xs-12">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">片区<span class="required">*</span></label>
                            <div class="col-md-3 col-sm-3 col-xs-12">
                                <select class="select2_single form-control" tabindex="-1" id="area_select">
                                    <%--<option value="0">--</option>--%>
                                    <c:forEach var="area" items="${areas}">
                                        <option value="${area.id}" <c:if test="${user.area == area.id}">selected="selected"</c:if>>${area.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">角色<span class="required">*</span></label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div id="role" class="btn-group" data-toggle="buttons">
                                    <label class="btn" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                        管理员:<input type="radio" class="flat" name="role" id="admin" value="0" <c:if test="${user.role == 0}">checked="checked"</c:if>/>
                                    </label>
                                    <label class="btn" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                        送奶工:<input type="radio" class="flat" name="role" id="worker" value="1" <c:if test="${user.role == 1}">checked="checked"</c:if> />
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">状态<span class="required">*</span></label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div id="status" class="btn-group" data-toggle="buttons">
                                    <label class="btn" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                        激活:<input type="radio" class="flat" name="status" id="on" value="1" <c:if test="${user.status == 1}">checked="checked"</c:if>/>
                                    </label>
                                    <label class="btn" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                        失效:<input type="radio" class="flat" name="status" id="off" value="0" <c:if test="${user.status == 0}">checked="checked"</c:if>/>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="ln_solid"></div>
                        <div class="form-group">
                            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                <button type="button" class="btn createbtn btn-success" onclick="modifyUser()">保存</button>
                                <button type="button" class="btn createbtn btn-primary" onclick="user.getList()">取消</button>
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
    function modifyUser() {
        var param = {};
        param.id = $('#user_id').val();
        param.name = $('#name').val();
        param.cname = $('#cname').val();
        param.mobile = $('#mobile').val();
        param.password = $('#password').val();
        param.role = $("input[name='role']:checked").val();
        param.area = $('#area_select').find('option:selected').val();
        param.status = $("input[name='status']:checked").val();
        if (param.name === ""){
            alert("请填写姓名");
            return;
        }
        if (param.cname === ""){
            alert("请填写中文姓名");
            return;
        }

        if (param.mobile === ""){
            alert("请填写手机");
            return;
        }

        user.modify(param);
    }
</script>
